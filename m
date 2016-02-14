From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Feb 2016 15:11:50 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/numactl: Fix uClibc compile
 breakage after musl compile fix
References: <1455393768-26580-1-git-send-email-bernd.kuhls@t-online.de>
 <20160214135141.3b0cbd49@free-electrons.com>
Message-ID: <6ie6pcx556.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 14 Feb 2016 13:51:41 +0100 schrieb Thomas Petazzoni:

> I still don't understand why
> 
> #if defined(__GLIBC__)
> #if __GLIBC_PREREQ(2, 11)
> ...
> #endif #endif
> 
> isn't the proposed solution. It looks so much cleaner and simpler than
> defining __GLIBC_PREREQ to 0 when __GLIBC__ is not defined. And it is
> actually the most correct solution I believe: only use __GLIBC_PREREQ
> when __GLIBC__ is defined.

Hi,

the code you mentioned above was the first PR I sent on github[1] and 
received this answer: 
https://github.com/numactl/numactl/pull/4#issuecomment-183441544

"I don't think the patch is correct. If GLIBC_PREREQ fails the #elif 
defined(__x86_64) path still needs to be taken. So you need to combine 
the two #ifs into one line"

And combining the two #ifs into one line breaks compilation on musl so I 
wrote the current patch.

Regards, Bernd

[1] http://patchwork.ozlabs.org/patch/575931/
