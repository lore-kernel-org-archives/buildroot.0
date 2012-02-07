From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 Feb 2012 10:27:28 +0100
Subject: [Buildroot] [PATCH] Add Freescale MX53 support
In-Reply-To: <201202070000.34270.arnout@mind.be> (Arnout Vandecappelle's
 message of "Tue, 7 Feb 2012 00:00:33 +0100")
References: <1328273223-16093-1-git-send-email-mbriand@adeneo-embedded.com>
 <1328277370-18423-1-git-send-email-mbriand@adeneo-embedded.com>
 <201202070000.34270.arnout@mind.be>
Message-ID: <8762fjt2m7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> create mode 100644 configs/freescale_mx53loco_defconfig

 Arnout>  The processor is called "i.MX53", I believe.  We also usually don't 
 Arnout> include the vendor name in the processor identification.  So something
 Arnout> like configs/imx53loco_defconfig is probably more appropriate.  OTOH,
 Arnout> Freescale themselves seem to call i.MX3x processors "imx" and i.MX5x
 Arnout> processors "mx5"...

mx53loco was afaik the internal code name for the board. Officially it's
called the i.MX53 Quick Start Board
(http://www.freescale.com/webapp/sps/site/prod_summary.jsp?code=IMX53QSB),
but the mx53loco name is also used other places, like E.G. the kernel.

I don't really feel strongly about mx53loco vs imx53qsb though.

 >> diff --git a/board/freescale/mx53loco/linux.config b/board/freescale/mx53loco/linux.config
 Arnout>  Personally I'd prefer to use a kernel defconfig (mx5_defconfig), but
 Arnout> perhaps this one is more appropriate.

I agree if possible, as that's one thing less to maintain.

-- 
Bye, Peter Korsgaard
