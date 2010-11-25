From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 25 Nov 2010 05:08:12 +0000 (UTC)
Subject: [Buildroot] [Bug 2845] dialog 1.1 needs libtinfo from ncurses
In-Reply-To: <bug-2845-163@https.bugs.busybox.net/>
References: <bug-2845-163@https.bugs.busybox.net/>
Message-ID: <20101125050812.A0F7A8E3AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2845

--- Comment #4 from S?rgio <sergio@sergiomb.no-ip.org>  ---
in config.log 
line  1692:
configure:13305: testing ...checking LIBS -lncurses -ltinfo -lm
configure:13355: testing ...checked LIBS  -lncurses -ltinfo -lm ... 

seems dialog treats libtinfo as part of ncurses 
btw many check have errors by using -ltinfo has part of the system as -lm .
for example:
configure:12421: checking for start_color
configure:12458:
/home/sergio/hardware/moviecube/buildroot/output/staging/usr/bin/mipsel-unknown-linux-uclibc-gcc
--sysroot=/home/sergio/hardware/moviecube/buildroot/output/staging -o conftest
-Os -pipe -Os  -mtune=mips32r2 -mabi=32 -msoft-float -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/sergio/hardware/moviecube/buildroot/output/staging/usr/include
-I/home/sergio/hardware/moviecube/buildroot/output/staging/include 
-D_GNU_SOURCE  -L/home/sergio/hardware/moviecube/buildroot/output/staging/lib
-L/home/sergio/hardware/moviecube/buildroot/output/staging/usr/lib conftest.c
-lncurses -ltinfo -lm  >&5
/home/sergio/hardware/moviecube/buildroot/output/staging/usr/lib/gcc/mipsel-unknown-linux-uclibc/4.3.5/../../../../mipsel-unknown-linux-uclibc/bin/ld:
cannot find -ltinfo 


config.log is not attach because :
The file you are trying to attach is 101 kilobytes (KB) in size. Non-patch
attachments cannot be more than 75 KB.
We recommend that you store your attachment elsewhere and then insert the URL
to it in a comment, or in the URL field for this bug. 

and I don't have time to do it now .

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
