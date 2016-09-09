From: Scott Timothy E <ScottTimothy@JohnDeere.com>
Date: Fri, 9 Sep 2016 14:03:28 +0000
Subject: [Buildroot] Microblaze C++ Shared Library issues
Message-ID: <1B269EB6E2E5384098655E41D61BCE1B4683D118@EDXMB53.jdnet.deere.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Are there any known issues with using C++ shared libraries for a Microblaze target?  I've got a system up and running and quite a few things are working for me out of the box.  However, when I try to run a C++ app on the target, I get an immediate segmentation fault.  If I take that same app and compile it statically (via "-static"), it runs just fine - but of course has an inflated size.  The source for the app is about as bare bones as you can get:

int main(void){}

As a sanity check, I tried including the "gperf" package in the build which also utilizes C++.  Same seg fault failure.  On the flip side, compiling and executing things like SDL tests which use (non-C++) shared libraries work as expected.  Things seem to be specific to C++.

I've tried changing from uclibc to glibc to see if that makes a difference.  No difference in behavior.  I've also confirmed the behavior by pulling in the build image to the PetaLinux tools 'qemu' implementation and it behaves the same.  So it doesn't appear to be specific to the target.

I tried including the "gdb" package for additional debugging, but that doesn't successfully compile for the Microblaze target unfortunately.

FWIW, I'm working with a relatively recent version of Buildroot - I last pulled it towards the beginning of July... so I'm not too out of date.

My next step is to use an external toolchain (crosstool-ng) to see if that makes a difference.

Any tips or troubleshooting hints would be appreciated!

Thanks,
--tim

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160909/f90d75df/attachment.html>
