From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Sep 2016 23:29:16 +0200
Subject: [Buildroot] [PATCH] configs: Add support for Solidrun's MX6
	Cubox/Hummingboard
In-Reply-To: <1473857347-17215-1-git-send-email-fabio.estevam@nxp.com> (Fabio
 Estevam's message of "Wed, 14 Sep 2016 09:49:07 -0300")
References: <1473857347-17215-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <87eg4mf9w3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <fabio.estevam@nxp.com> writes:

 > Add support for Solidrun's MX6 Cubox/Hummingboard.
 > For more information about these boards, please check:

 > https://www.solid-run.com/freescale-imx6-family/hummingboard/
 > https://www.solid-run.com/freescale-imx6-family/cubox-i/

 > U-Boot is capable of detecting the version of the board in run-time
 > and loads the correct dtb.

 > Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

Committed, thanks.

 > +++ b/configs/mx6cubox_defconfig
 > @@ -0,0 +1,28 @@
 > +BR2_arm=y
 > +BR2_cortex_a9=y
 > +# Linux headers same as kernel, a 4.7 series

Not specific to this defconfig, but I see we don't enable NEON/VFP
support for any of our i.MX6 defconfigs, even though the A9 cores used
afaik have both.

Is that something you would care to fix?

-- 
Bye, Peter Korsgaard
