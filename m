From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Feb 2014 14:31:56 +0100
Subject: [Buildroot] [PATCH] pcsc-lite: add patch to fix libusb detection
In-Reply-To: <dd4ef69c052fba9df8dc.1393492720@argentina> (Thomas De
 Schampheleire's message of "Thu, 27 Feb 2014 10:18:40 +0100")
References: <dd4ef69c052fba9df8dc.1393492720@argentina>
Message-ID: <87lhwwadgz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > When libusb support is requested in pcsc-lite, the configure script will try
 > to link a test application to check libusb_init(). However, when libusb
 > needs threads, the linking step should link in threads as well.

 > The configure script, first tries to call libusb-config to determine the
 > necessary cflags and libraries (which should include the thread flags), but
 > this program does not exist, so the cflags/libs variables are empty.

 > Therefore, add a patch to explicitly add PTHREAD_CFLAGS and PTHREAD_LIBS to
 > the libusb test, so libusb is detected correctly.

 > Fixes
 > http://autobuild.buildroot.org/results/432/432be0db3f8415f6a026b69234579ad4d23b6421/

This is only an issue for static linking, so I slightly reworded the
commit message to make that clear and committed, thanks.

-- 
Bye, Peter Korsgaard
