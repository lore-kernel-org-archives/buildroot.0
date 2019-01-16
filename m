From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 23:40:23 +0100
Subject: [Buildroot] [PATCH 3/3] linux: use HOSTCC_NOCCACHE as kconfig
 HOSTCC
In-Reply-To: <20190110211500.14368-4-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 10 Jan 2019 22:15:00 +0100")
References: <20190110211500.14368-1-thomas.petazzoni@bootlin.com>
 <20190110211500.14368-4-thomas.petazzoni@bootlin.com>
Message-ID: <87y37k8bvs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > linux is a bit different than other kconfig-package, because it has
 > "toolchain" in KCONFIG_DEPENDENCIES. Thanks to this, host-ccache *is*
 > ready by the time kconfig invocations are made, so we could use
 > $(HOSTCC) as the host compiler for kconfig related operations.

 > However, for consistency with other kconfig-package packages, we chose
 > to use $(HOSTCC_NOCCACHE) as well.

 > We cannot rely on the default value of HOSTCC passed by the
 > kconfig-package infrastructure, because $(LINUX_MAKE_FLAGS) also
 > contains a HOSTCC definition that would override the one passed by the
 > kconfig-package infrastructure.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
