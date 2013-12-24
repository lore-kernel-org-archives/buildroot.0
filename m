From: Wojciech Zabolotny <wzab01@gmail.com>
Date: Tue, 24 Dec 2013 22:33:52 +0100
Subject: [Buildroot] Untypical situation - python-smbus which is also a part
	of i2c-tools.
Message-ID: <CAMduVEehZnpUyUbdY-CY1xo=yABivLkrFdxa1atK537NYE9huA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I needed to assure access to i2c peripherals from Python programs in
my buildroot based embedded system.
There is a py-smbus module, which is available as a part of i2c-tools,
but which is not compiled during compilation of this package, and uses
other tools for compilation.

Simple addition of EXTRA="py-smbus" when executing make (as described
in original README) doesn't help as it was discussed in a thread:
http://lists.busybox.net/pipermail/buildroot/2013-June/074037.html

After some review of some packages which use python components, I have
got the attached mk file, which works, but is not a clean solution.
I don't know if there is a cleaner way to achieve that?

The ideal solution would be probably to allow selection of the
python-smbus as a part of the i2c-tools package.
How should it be done?

-- 
Regards,
Wojciech M. Zabo?otny
My GPG/PGP keys:
standard: B191 ACF0 7909 83FA 3F9B  450C 407E 3C4B 4569 D119
confidential: 2BF3 F90F 6EA8 7D35 59FD  5080 78ED 33DE 1312 D8F8
-------------- next part --------------
A non-text attachment was scrubbed...
Name: Config.in
Type: application/octet-stream
Size: 229 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131224/92a8d954/attachment.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: python-smbus.mk
Type: application/octet-stream
Size: 1944 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131224/92a8d954/attachment-0001.obj>
