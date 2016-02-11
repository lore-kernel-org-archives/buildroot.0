From: Patrick Doyle <wpdster@gmail.com>
Date: Thu, 11 Feb 2016 10:23:32 -0500
Subject: [Buildroot] How do folks add packages to an existing rootfs during
	development?
Message-ID: <CAF_dkJDw95gyf3WFhfy7_zPgD05W4N0kTmGFLJbWcTCRwj1uKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have read section 10.7 "Why doesn't Buildroot generate binary
packages (.deb, .ipkg...)?" in the Buildroot users manual, and I
understand and appreciate the answer to that question.

My question is slightly different, and it is based on the following scenario:

I am creating a buildroot environment for my custom product.  I have
generated the rootfs and deployed it to my development board.  Once I
have done that, I have customized a few things to my liking (e.g.
hostname, installed my custom application, generated OpenSSH keys,
etc...).  Now I discover that I also want to add another package to my
environment.

Option 1:
Rerun "make menuconfig; make"; generate a new rootfs; flash it on my
board; and redo the customizations.  (Most of the customizations will
get easier with time, as I roll them into my configuration, but some
of them, such as OpenSSH host keys, will just have to change each time
I do this).

Option 2:
Rerun "make menuconfig; make" and deploy just the new package.
Lather, rinse, repeat, until I've figured out what package sets make
the most sense.  Then do Option 1.

Which option do folks in this community choose in general?

--wpd
