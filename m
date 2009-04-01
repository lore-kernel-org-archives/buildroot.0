From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 01 Apr 2009 20:38:03 +0200
Subject: [Buildroot] Do I need to install twice?
In-Reply-To: <461F49CC-88D4-4278-947D-453AAFCFDDC5@cannasoftware.com> (Lloyd
	Sargent's message of "Wed\, 1 Apr 2009 11\:33\:27 -0500")
References: <461F49CC-88D4-4278-947D-453AAFCFDDC5@cannasoftware.com>
Message-ID: <87bprg6wz8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lloyd" == Lloyd Sargent <lloyd@cannasoftware.com> writes:

 Lloyd> HOWEVER, I'm a little stumped. If I do the following:

 Lloyd> 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(WXWIDGETS_DIR) install

 Lloyd> The include directory is deleted so I am unable to build files for
 Lloyd> WxWidgets. But my libraries are in the right place.

 Lloyd> To have include files I can build against I added this line:

 Lloyd> 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(WXWIDGETS_DIR) install

 Lloyd> It gets me the include files but I've this bad feeling that it isn't
 Lloyd> the right way to do it.

 Lloyd> So have I got this right? Or have I just made a blunder?

No, it's because of the difference between TARGET_DIR and
STAGING_DIR. TARGET_DIR is your final target rootfs, where you
normally don't need header files and so on. For libraries we
additionally install them into STAGING_DIR and tell gcc to look for
header files there.

-- 
Bye, Peter Korsgaard
