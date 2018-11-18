From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Nov 2018 08:37:32 +0100
Subject: [Buildroot] [PATCH] utils/genrandconfig: add missing new line
 when creating the configuration
In-Reply-To: <20181115163409.8825-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 15 Nov 2018 17:34:09 +0100")
References: <20181115163409.8825-1-thomas.petazzoni@bootlin.com>
Message-ID: <874lceq1j7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > When adding the custom BR2_WGET value in the configuration,
 > genrandconfig forgets to add a newline. Due to this, the next option
 > that is added is printed on the same line as BR2_WGET="", which causes
 > it to be ignored.

 > Due to this, in all builds, the line right after BR2_WGET was
 > ignored. It could have been BR2_ENABLE_DEBUG, BR2_INIT_BUSYBOX,
 > BR2_INIT_SYSTEMD, BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV,
 > BR2_STATIC_LIBS or BR2_PACKAGE_PYTHON_PY_ONLY depending on the
 > randomization.

 > Fix that by adding a proper newline at the end of the BR2_WGET option.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
