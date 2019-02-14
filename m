From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Feb 2019 21:49:12 +0100
Subject: [Buildroot] [PATCH] package/qemu: fix build of host-qemu on
 systems with old kernel headers
In-Reply-To: <20190213211242.19981-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 13 Feb 2019 22:12:41 +0100")
References: <20190213211242.19981-1-thomas.petazzoni@bootlin.com>
Message-ID: <87r2cagkon.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Qemu assumes that when <linux/usbdevice_fs.h> is available, it can
 > build its USBFS code. However, some systems have
 > <linux/usbdevice_fs.h>, but it doesn't provide all the definitions
 > that Qemu needs, causing a build failure.

 > In order to fix this, we introduce a Qemu patch that improves the
 > check that determines whether USBFS support should be enabled or not.

 > Fixes:

 >   http://autobuild.buildroot.net/results/c4af5505f80e1e6185df70d191e85d9393df5795/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
