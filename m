From: Steven Noonan <steven@uplinklabs.net>
Date: Thu, 19 Mar 2015 05:46:49 -0700
Subject: [Buildroot] [PATCH v2] package/perf: build outside kernel tree
In-Reply-To: <20150319131551.320a7189@free-electrons.com>
References: <1426762651-7734-1-git-send-email-steven@uplinklabs.net>
 <20150319131551.320a7189@free-electrons.com>
Message-ID: <CAKbGBLjdW7-Bm9bYTyMxuUbDCbbLS_xEjkq=TD6n=yH3-Lo4zg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 19, 2015 at 5:15 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Steven Noonan,
>
> On Thu, 19 Mar 2015 03:57:31 -0700, Steven Noonan wrote:
>> This is necessary for introducing patches.
>>
>> Signed-off-by: Steven Noonan <steven@uplinklabs.net>
>
> Can you describe a little bit more what is happening here, and why we
> are doing this?
>
> In some cases, the current dependency of the perf package on building a
> Linux kernel is a bit annoying: when I do kernel development, I tend to
> build my kernel outside of Buildroot. But I still would like to be able
> to use Buildroot to build tools like perf. So in some sense, what
> you're proposing here makes some sense.
>
> But it is not very efficient to extract twice the entire kernel source
> code, and there is the issue of code duplication pointed out by Baruch.

I agree, it's ugly. But if we intend to apply patches on perf it makes
sense that it really has its own tree. For example, in my upcoming x32
patch series:

http://git.uplinklabs.net/snoonan/projects/buildroot.git/commit/?h=x32&id=36f8702bebd0466d4ab2bc680f8087dfab1529e0

Is there a better way to handle patching the perf code base, or am I
taking the right approach here by having it own its own source tree?
If we really care about the efficiency of the extraction we can cut it
down to the bits that perf itself really needs (tools directory, some
of the top-level files), but that feels kind of weird too.
