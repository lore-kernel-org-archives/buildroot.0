From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 06 Apr 2018 18:57:07 +0200
Subject: [Buildroot] [git commit] configs/imxsabre: Fix U-Boot parallel
 build issue
In-Reply-To: <20180324155828.E7DC6839C6@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 24 Mar 2018 16:58:10 +0100")
References: <20180324155828.E7DC6839C6@busybox.osuosl.org>
Message-ID: <873708i87w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=0c4bccf9e882ffead426051cfe76764dd2ecaf83
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Sometimes imximage throws the following error:

 > MKIMAGE u-boot-dtb.imx
 > Error: No BOOT_FROM tag in board/freescale/mx6sxsabresd/imximage.cfg.cfgtmp
 > arch/arm/imx-common/Makefile:91: recipe for target 'u-boot-dtb.imx' failed

 > Later on, when running mkimage for the u-boot.imx it will succeed in
 > finding the IVT offset.

 > Looks like some race condition happening during parallel build when
 > processing mkimage for u-boot-dtb.imx and u-boot.imx.

 > A proper fix still needs to be implemented, but as a workaround let's
 > remove the error when the IVT offset is not found.

 > It is useful to have such message, especially during bring-up phase,
 > but the build error that it causes is severe, so better avoid the
 > build error for now.

 > The error checking can be re-implemented later when we have a proper
 > fix.

 > This workaround has already been applied in mainline U-Boot:
 > http://git.denx.de/?p=u-boot.git;a=commit;h=b5b0e4e351e20a606de22db6a56ad6bc1e2aa8fd

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/59015347

 > Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Fabio Estevam <festevam@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
