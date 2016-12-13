From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Dec 2016 19:49:08 +0100
Subject: [Buildroot] [PATCH] mx6sx: Add support for mx6sx udoo neo boards
In-Reply-To: <1481649193-29371-1-git-send-email-fabio.estevam@nxp.com> (Fabio
 Estevam's message of "Tue, 13 Dec 2016 15:13:13 -0200")
References: <1481649193-29371-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <878trj3brv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <fabio.estevam@nxp.com> writes:

 > Add support for mx6sx udoo neo boards. For more information about these
 > boards, please check:
 > http://www.udoo.org/udoo-neo

 > The U-Boot and kernel dts patches will be removed when we bump U-Boot
 > to 2017.01 and kernel to 4.10 version as they have already been sent
 > upstream.

 > +++ b/configs/mx6sx_udoo_neo_defconfig
 > @@ -0,0 +1,29 @@
 > +BR2_arm=y
 > +BR2_cortex_a9=y

One more comment, doesn't the A9 in the mx6sx have a VFP and NEON
support? If so, please enable them like we do for
E.G. nitrogen6x_defconfig.

-- 
Bye, Peter Korsgaard
