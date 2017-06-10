From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jun 2017 13:33:53 +0200
Subject: [Buildroot] [PATCH] glibc: remove version choice
In-Reply-To: <d6af409f-8318-d97e-9193-cb07f94de67a@mind.be>
References: <20170606175659.GA2566@waldemar-brodkorb.de>
 <20170606213500.0fe44a79@free-electrons.com>
 <20170607212720.GA23160@scaer> <87h8zq9r6u.fsf@dell.be.48ers.dk>
 <d6af409f-8318-d97e-9193-cb07f94de67a@mind.be>
Message-ID: <20170610133353.068831eb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Jun 2017 11:19:32 +0200, Arnout Vandecappelle wrote:

>  I think there is in fact more reason to have multiple versions for uClibc-ng
> than for glibc. Multiple versions are useful in any situation when there are ABI
> changes in the newer version so that binaries linked with the older version no
> longer work. glibc is very careful about ABI changes, uClibc-ng somewhat less so.
> 
>  So yes, I'm in favour of removing this version choice. Also for binutils, by
> the way. Yes, there may be regressions, but then those should be fixed, not
> swept under the carpet for some time until the new version becomes the default.
> 
>  GCC is different, because newer GCC versions do break compatibility with older
> libraries, and they do break existing (badly written) source code. In that sense
> I think it was a bad idea to remove GCC 4.9, because GCC 5 did break binary
> compatibility for C++... But I wasn't here at the time and that ship has sailed now.

I haven't merged https://patchwork.ozlabs.org/patch/767087/, so gcc 4.9
is still there:

$ grep 4_9_X package/gcc/Config.in.host 
config BR2_GCC_VERSION_4_9_X
	default "4.9.4"     if BR2_GCC_VERSION_4_9_X

I was waiting for feedback (such as yours) before merging this patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
