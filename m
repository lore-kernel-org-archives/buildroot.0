From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 27 Jul 2010 15:30:02 +0000 (UTC)
Subject: [Buildroot] [Bug 635] util-linux fails to build in 2009.08
In-Reply-To: <bug-635-163@https.bugs.busybox.net/>
References: <bug-635-163@https.bugs.busybox.net/>
Message-ID: <20100727153002.24940835C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=635

S?rgio <sergio@sergiomb.no-ip.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|WORKSFORME                  |

--- Comment #4 from S?rgio <sergio@sergiomb.no-ip.org>  ---
Have have this show stopper also , with from today buildroot git version.

Making all in text-utils
(...)
In file included from more.c:56:
buildroot/output/staging/usr/include/a.out.h:1:25: error: linux/a.out.h: No
such file or directory
more.c: In function 'magic':
more.c:507: error: 'OMAGIC' undeclared (first use in this function)
more.c:507: error: (Each undeclared identifier is reported only once
more.c:507: error: for each function it appears in.)
more.c:508: error: 'NMAGIC' undeclared (first use in this function)
more.c:509: error: 'ZMAGIC' undeclared (first use in this function)
make[3]: *** [more.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[3]: Leaving directory
`buildroot/output/build/util-linux-2.13-pre7/text-utils'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `buildroot/output/build/util-linux-2.13-pre7'
make[1]: *** [all] Error 2
make[1]: Leaving directory `buildroot/output/build/util-linux-2.13-pre7'
make: *** [buildroot/output/build/util-linux-2.13-pre7/misc-utils/chkdupexe]
Error 2

furthermore I do a couple of commands like cd .. , cd - (or I wait sometime
?!), do a make , and make forget this package and go to the finish , but never
built the more binary and others.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
