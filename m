From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 5 Oct 2015 17:52:31 +0300
Subject: [Buildroot] [PATCH 0/4] xtensa: toolchain fix for compiling
	huge functions
In-Reply-To: <20151004172825.562eb8a6@free-electrons.com>
References: <1439418003-23805-1-git-send-email-jcmvbkbc@gmail.com>
 <20151004172825.562eb8a6@free-electrons.com>
Message-ID: <CAMo8BfLiTijALZxQ2KpCy+81rnSpn9vgzrnfQ6p4hOD-0TW=3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Oct 4, 2015 at 7:28 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Thu, 13 Aug 2015 01:19:59 +0300, Max Filippov wrote:
>
>> Max Filippov (4):
>>   binutils: backport auto-litpools xtensa gas option
>>   gcc: backport mauto-litpools xtensa option
>>   xtensa: switch from text-section-literals to auto-litpools
>>   Revert "opencv: mark as not available on Xtensa"
>
> In the end, I decided to apply these patches. They will break the
> current pre-built Xtensa external toolchain we use (which was built
> with Buildroot), but I will rebuild it soon to cope with that.
>
> It's not nice to have such large patches in binutils/gcc, but I guess
> it's necessary for architectures that are a bit specific, and for which
> the compiler support is not yet perfect. I hope you are pushing these
> changes to upstream gcc and binutils, so that we can drop the patches
> in future versions.

They will appear in next major releases of gcc (6.1) and binutils (2.26),
but not in any of the current branches as they are not regression fixes.
Having them backported to all xtensa toolchain versions makes set of
ABI flags smaller and future backports easier.

> BTW, can you have a look at gcc 5.x for Xtensa? We currently allow
> using gcc 5.2.x on Xtensa, but we don't have any patches for it. It
> would be great if you could have a look at which gcc 4.9.x patches are
> still needed for gcc 5.x.

https://patchwork.ozlabs.org/patch/508172/
No other xtensa-specific patches I know of.

-- 
Thanks.
-- Max
