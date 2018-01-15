From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jan 2018 21:24:29 +0100
Subject: [Buildroot] [PATCH v2] wolfssl: fix build on ARMV8
In-Reply-To: <1516027690-24571-1-git-send-email-sergio.prado@e-labworks.com>
References: <1516027690-24571-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20180115212429.53d6c26c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 Jan 2018 12:48:10 -0200, Sergio Prado wrote:

> +# build fails when ARMv8 hardware acceleration is enabled
>  ifeq ($(BR2_ARM_CPU_ARMV8A),y)

I really didn't see the need for this condition, so I just passed
--disable-armasm unconditionally.

Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
