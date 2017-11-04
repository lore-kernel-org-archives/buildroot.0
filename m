From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 04 Nov 2017 09:46:06 +0100
Subject: [Buildroot] [PATCH 2/2] usb_modeswitch: explicitly set --host /
 --build for the embedded jimtcl
In-Reply-To: <20171103222838.3974-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 3 Nov 2017 23:28:38 +0100")
References: <20171103222838.3974-1-peter@korsgaard.com>
 <20171103222838.3974-2-peter@korsgaard.com>
Message-ID: <87mv424ek1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/106/106af20196089e74c35daabdae46f030981600bd/

 > Otherwise the (handwritten) configure script uses a config.guess script from
 > 2010 to figure out the build host, breaking builds on ppc64le hosts.

 > The result of --host / --build is only used to detect if we are building for
 > Windows or not, which is why things are working on x86(-64) build hosts
 > without specifying --host even though we are cross compiling - But this may
 > change in the future, so we better pass the correct values.

 > Passing extra jimtcl configure flags is unfortunately not forseen in the
 > usb_modeswitch Makefile, so add a small patch making this possible.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 >  ...low-extra-configure-flags-to-be-passed-to.patch | 29 ++++++++++++++++++++++

Gaah, this is missing the usb_modeswitch.mk hunk. Will resend.

-- 
Bye, Peter Korsgaard
