From: Patrick Doyle <wpdster@gmail.com>
Date: Tue, 7 Aug 2018 15:52:52 -0400
Subject: [Buildroot] Setting BLUEZ5_UTILS_AUTORECONF=YES outside of
 bluez5_utls.mk
Message-ID: <CAF_dkJB_UGTGs+MU7Pco2ViXZg4at1-KHAbA8gUv2LKht2fgdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Is it possible to set BLUEZ5_UTILS_AUTORECONF=YES outside of bluez5_utils.mk?

I have a patch supplied by a third party for bluez5_utils, which
modifies one of the files included by Makefile.am (Makefile.tools).
The problem is, since automake isn't run, my build fails because it
doesn't pick up the change to Makefile.tools.

The solution is to set BLUEZ5_UTILS_AUTORECONF=YES, which appears to
work when I set it in bluez5_utils.mk.  But, since I build
out-of-tree, I like to keep all of my project customizations out of
tree.

I can set it on the command line and execute:

make BLUEZ5_UTILS_AUTORECONF=YES

but that is (very) prone to me forgetting to do that.

I tried placing "BLUEZ5_UTILS_AUTORECONF=YES" in my external.mk, but
that didn't work either.

Any thoughts?

--wpd
