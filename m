From: Christopher Reder <creder@digitalcpt.com>
Date: Thu, 17 May 2007 14:05:31 -0500
Subject: [Buildroot] __ctype_b undefined reference after adding
	fontconfig support
Message-ID: <017201c798b6$573bb8b0$2600a8c0@engineering5>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I also see that Bernhard also saw this issue but I did not see if anyone
found a solution.

 

http://osdir.com/ml/lib.uclibc.buildroot/2007-01/msg00140.html

 

  _____  

From: Christopher Reder [mailto:creder at digitalcpt.com] 
Sent: Thursday, May 17, 2007 1:54 PM
To: 'Assen Stoyanov'; 'buildroot at uclibc.org'
Subject: __ctype_b undefined reference after adding fontconfig support

 

All - I will attempt to provide as much detail and if there is more than
should be added, I'll be happy to do so.

 

In wanting to use Matchbox as added by Assen, I enabled those packages which
require fontconfig and freetype.  In doing so, I received the following
error which I found as reported a couple of weeks ago.  I am wondering if
anyone else has encountered this and how to address it.  If there is a
version of buildroot that I can go back to, then I'd be happy to do it.  I
have binutils 2.17, uclibc 0.9.29 and gcc 4.1.2 selected as the toolchain
for buildroot.

 

Below is the output and the bug as reported by ALEXANDER WOLD.

 

 

 

> fc-case.o: In function `main':

> fc-case.c:(.text+0x20b): undefined reference to `__ctype_b'

> collect2: ld returned 1 exit status

> make[4]: *** [fc-case] Error 1

> make[4]: Leaving directory

>
`/home/christopher/buildroot2/buildroot/build_arm/fontconfig-2.4.2/fc-case'

> make[3]: *** [all] Error 2

> make[3]: Leaving directory

>
`/home/christopher/buildroot2/buildroot/build_arm/fontconfig-2.4.2/fc-case'

> make[2]: *** [all-recursive] Error 1

> make[2]: Leaving directory

> `/home/christopher/buildroot2/buildroot/build_arm/fontconfig-2.4.2'

> make[1]: *** [all] Error 2

> make[1]: Leaving directory

> `/home/christopher/buildroot2/buildroot/build_arm/fontconfig-2.4.2'

> make: ***

>
[/home/christopher/buildroot2/buildroot/build_arm/fontconfig-2.4.2/.compiled
] 

> Error 2

> engineering5:/home/christopher/buildroot2/buildroot#

 

 

 

 

http://bugs.busybox.net/view.php?id=1328

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070517/94f5a5b7/attachment.htm 
