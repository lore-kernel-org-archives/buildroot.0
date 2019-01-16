From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 23:39:18 +0100
Subject: [Buildroot] [PATCH 2/3] boot/uboot: use HOSTCC_NOCCACHE as
 kconfig HOSTCC
In-Reply-To: <20190110211500.14368-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 10 Jan 2019 22:14:59 +0100")
References: <20190110211500.14368-1-thomas.petazzoni@bootlin.com>
 <20190110211500.14368-3-thomas.petazzoni@bootlin.com>
Message-ID: <8736ps9qi1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > At kconfig time, dependencies are not built, and therefore host-ccache
 > is not ready. Due to this, using $(HOSTCC) as the host compiler in
 > KCONFIG_OPTS does not work: a "make uboot-menuconfig" invocation from
 > a clean tree with ccache enabled fails.

 > This commit fixes this by using $(HOSTCC_NOCCACHE). We cannot rely on
 > the default value of HOSTCC passed by the kconfig-package
 > infrastructure, because $(UBOOT_MAKE_OPTS) also contains a HOSTCC
 > definition that would override the one passed by the kconfig-package
 > infrastructure.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
