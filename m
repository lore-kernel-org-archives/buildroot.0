From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 08:05:16 +0200
Subject: [Buildroot] [PATCH 1/1] pixiewps: fix static linking with
 uclibc-ng
In-Reply-To: <20180610040845.64npfwieiobvyxgy@sapphire.tkos.co.il>
References: <20180609135820.2002-1-fontaine.fabrice@gmail.com>
 <20180610040845.64npfwieiobvyxgy@sapphire.tkos.co.il>
Message-ID: <20180610080516.5d38df9b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Jun 2018 07:08:45 +0300, Baruch Siach wrote:

> Here is an example where uClibc also requires -static, even though the 
> toolchain is static only. So musl in not alone here, cfr. bug #10996.
> 
> This also means that the lm-sensors RFC fix is correct:
> 
>   http://patchwork.ozlabs.org/patch/883243/

Regarding this, I asked on the musl mailing list, and the conclusion I
got from the discussion was that indeed -static should be passed:

  http://www.openwall.com/lists/musl/2018/05/08/1

So yes, we should add -static when the packages for some reason are not
propagating this LDFLAGS.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
