From: =?UTF-8?B?0JrQuNGA0LjQu9C7INCb0YPRhtC10L3QutC+?= <lucenko_kirill@mail.ru>
Date: Sat, 25 Jan 2014 14:23:27 +0400
Subject: [Buildroot] =?utf-8?q?i686-buildroot-linux-gnu-as__does_not_work?=
Message-ID: <1390645407.666601332@f346.i.mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello!
I have got very strange error during building of BuildRoot project. 
It happens after running following commands in /.../BuildRoot/output/build/infozip-30 directory:
/usr/bin/cpp match.S > _match.s
/.../BuildRoot/output/host/usr/bin/i686-buildroot-linux-gnu-as _match.s
/usr/bin/cpp crc_i386.S > _crc_i386.s
mv _match.o match.o
/.../BuildRoot/output/host/usr/bin/i686-buildroot-linux-gnu-as _crc_i386.s 
mv: cannot stat `_match.o': No such file or directory
make[2]: *** [match.o] Error 1
make[2]: *** Waiting for unfinished jobs....
mv _crc_i386.o crc_i386.o
mv: cannot stat `_crc_i386.o': No such file or directory
Of course, building stops after this.?
I tried to do make clean and even make distclean, but it did not solved this issue.?

As I understood, "i686-buildroot-linux-gnu-as" should compile _match.s and _crc_i386.s files, but can't do it. That's why mv command cant find appropriate .o files.
I tried to run separately this two commands in infozip-30 folder:
/.../BuildRoot/output/host/usr/bin/i686-buildroot-linux-gnu-as _match.s
/.../BuildRoot/output/host/usr/bin/i686-buildroot-linux-gnu-as _crc_i386.s 
but there was no any reaction:?no error messages or .o files which should appear.
Does anyone know, what is the reason of this mistake and how can I fix it??
Thanks for any help!

P.S.
My host system: Ubuntu 12.04 ?32-bit
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140125/678aefbc/attachment.html>
