From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Feb 2016 08:56:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/iputils: patch ping to link
 against libm
In-Reply-To: <56C3BC1E.1060002@mind.be>
References: <1455541206-18200-1-git-send-email-martin@barkynet.com>
 <20160215231703.2052c7e0@free-electrons.com>
 <20160216190329.GO14809@waldemar-brodkorb.de>
 <20160216212804.7a56f3a7@free-electrons.com>
 <56C3BC1E.1060002@mind.be>
Message-ID: <20160217085620.050d6132@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Feb 2016 01:17:34 +0100, Arnout Vandecappelle wrote:

>  I think the difference is in gcc versions. It looks like gcc 4.7 in that
> external toolchain uses a built-in inline version of __finite(), while gcc 4.9
> just calls the external function. I don't think it has anything to do with the
> uClibc version (though I didn't try all combinations). But for sure, it fails
> with gcc 4.9 and uClibc 1.0.10 while it succeeds with the same config and gcc 4.7.

Aaah, okay. Makes sense.

>  I don't think BR2_ENABLE_DEBUG has anything to do with it, but I didn't test that.
> 
>  Anyway, it seems obvious to me that if you use finite(), then you should link
> with -lm. There's bound to be some combination of libc and compiler that
> requires -lm.

I fully agree that from the beginning -lm is needed. However, I didn't
like the fact that the build failures were not fully understood.

> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
