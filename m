From: Sven Neumann <s.neumann@phase-zero.de>
Date: Mon, 19 Jan 2009 17:30:48 +0100
Subject: [Buildroot] tslib puts staging_dir into pkgconfig file
Message-ID: <1232382648.8906.11.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

the tslib package passes options to configure that cause the generated
tslib.pc file to contain pointers into the staging_dir. This causes
applications and drivers that link with libts to search for that library
in the staging_dir. Attached is a patch that fixes this.

It looks like libusb has a similar problem, btw.


Sven


-------------- next part --------------
A non-text attachment was scrubbed...
Name: tslib.diff
Type: text/x-patch
Size: 679 bytes
Desc: not available
Url : http://lists.busybox.net/pipermail/buildroot/attachments/20090119/3d39177f/attachment.bin 
