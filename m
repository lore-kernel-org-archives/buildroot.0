From: MERCADIER Johann <johann.mercadier@imerir.com>
Date: Thu, 15 Mar 2012 13:45:58 +0000
Subject: [Buildroot] BR2012.rc1 :: problem to build a new package
Message-ID: <CAPEB33x+aVFQoFgN8FXUDWsdqux4Kgf6cPnpMnxN3eRLedGB2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

   I try to add my 1st package to BR.
   I primarily succeed compiling the program manually and once it had been
added to the rootfs. I could use it normally wihtout bug til now.
   Then as I would like to add this functionality to build root through the
menuconfig option. This part seems ok
   The next one is to built a .mk file and here start the troubles!

   This program require freetype2 and fontconfig. On my system pkg-config
can find it at the following places:
./workdone/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/pkgconfig/freetype2.pc
./output/target/usr/lib/pkgconfig/freetype2.pc
./output/build/freetype-2.4.8/builds/unix/freetype2.pc

  But it cannot find any .pc file for fontconfig and then quit with an
error.
Looking at the man pkg-config I should write a .pc file to help pkg-config
to download it. Doing so I manually interfere the automated build process.
  I found some help in the book "Linux Embarqu?" by P.FICHEUX from page 247
and in the doc provided with buildroot but I don't know how and where to
config things to make the things automatically  I mean download of the
required dependencies.
  I wish to learn to do some good work and not a kind of scrappy job even
if it works. So advices are welcome!

Regards,

-- 
Cordialement.

___Johann MERCADIER___

:(){ :|:& };:
"I am the Unknown lead by the Unknowing.
I have done so much with so little for so long
that I am now qualified to do anything with nothing."
HOOSEEK (http://www.hooseek.com/) 1?moteur de recherche solidaire!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120315/f07b2baf/attachment.html>
