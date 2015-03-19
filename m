From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Mar 2015 13:15:51 +0100
Subject: [Buildroot] [PATCH v2] package/perf: build outside kernel tree
In-Reply-To: <1426762651-7734-1-git-send-email-steven@uplinklabs.net>
References: <1426762651-7734-1-git-send-email-steven@uplinklabs.net>
Message-ID: <20150319131551.320a7189@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steven Noonan,

On Thu, 19 Mar 2015 03:57:31 -0700, Steven Noonan wrote:
> This is necessary for introducing patches.
> 
> Signed-off-by: Steven Noonan <steven@uplinklabs.net>

Can you describe a little bit more what is happening here, and why we
are doing this?

In some cases, the current dependency of the perf package on building a
Linux kernel is a bit annoying: when I do kernel development, I tend to
build my kernel outside of Buildroot. But I still would like to be able
to use Buildroot to build tools like perf. So in some sense, what
you're proposing here makes some sense.

But it is not very efficient to extract twice the entire kernel source
code, and there is the issue of code duplication pointed out by Baruch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
