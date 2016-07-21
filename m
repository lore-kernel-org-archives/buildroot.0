From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Jul 2016 15:42:25 +0200
Subject: [Buildroot] [PATCH] libarchive: fix build error when linking
 with lzma
In-Reply-To: <1469103656-22134-1-git-send-email-sergio.prado@e-labworks.com>
References: <1469103656-22134-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20160721154225.28f548ca@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 21 Jul 2016 09:20:56 -0300, Sergio Prado wrote:

> -ifeq ($(BR2_PACKAGE_XZ),y)
> +# libarchive requires LZMA with thread support in the toolchain
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),$(BR2_PACKAGE_XZ),yy)

This condition will always evaluate to false, so it's not good. Indeed:

 ,y
 y,
 y,y
 ,

will never be equal to yy

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
