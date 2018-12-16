From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 16:01:51 +0100
Subject: [Buildroot] [PATCH] linux: ensure images/ exist before creatign
 files there
In-Reply-To: <20181203191219.18998-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Mon, 3 Dec 2018 20:12:19 +0100")
References: <20181203191219.18998-1-yann.morin.1998@free.fr>
Message-ID: <87h8fda528.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When using an initramfs, on the first-pass build, we create a dummy cpio
 > so that the build succeeeds. The real cpio will come later, and we'll do
 > a second-pass build to use the actual cpio.

 > However, when we touch that dummy cpio, the images/ directory may not
 > yet exist, since commit d0f4f95e39 (Makefile: rework main directory
 > creation logic) removed its creation at the begining of the build, to
 > only at the moment we need it, i.e. during the *_INSTALL_IMAGES_CMDS
 > steps.

 > However, the linux build is not a _INSTALL_IMAGES_CMDS step, so there is
 > no guarantee that images/ already exist at that time.

 > Fix that by explicitly creating images/ before touching the dummy cpio.

 > Reported-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, 2018.08.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
