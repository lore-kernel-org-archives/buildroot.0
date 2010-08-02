From: anthony henderson <development@fair-games.com>
Date: Mon, 2 Aug 2010 20:51:14 +0100
Subject: [Buildroot] Incorrect selection of the C library Error
Message-ID: <AANLkTi=UxWwfu99d519USYQV-YnNyXZbSXbdPmrVpsC4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
I've just started using buildroot to cross compile some packages I need that
are bundled with it.  I have to use the cross compiler provided via the
vendor (cirrus gcc 4.11 arm 920T build) so I set up for ARM and 920T then I
set toolchain->type to external and toolchain -> path to my compiler path,
/ArmDevelopment/crosscompiler/4.1.1-920t and set path->external toolchain
prefix to arm-linux.  I then make, when I make I get an error Incorrect ABI
setting, to be exact

Checking external toolchain settings
Incorrect ABI setting
make: *** [/root/buildroot-2010.05/output/stamps/ext-toolchain-installed]
Error 1

Some searching showed I needed to change target ABI to OBI, I did this and
got the following error when I tried to make, Incorrect selection of the C
library, to be exact

Checking external toolchain settings
Incorrect selection of the C library
make: *** [/root/buildroot-2010.05/output/stamps/ext-toolchain-installed]
Error 255

I tried setting toolchain->external c lib to both uclibc and glibc but
neither helped, can anyone point me in the right direction.
Thanks

-- 
Regards Tony
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100802/66fc6b86/attachment-0001.html>
