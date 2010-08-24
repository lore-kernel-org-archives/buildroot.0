From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 24 Aug 2010 15:03:19 +0000 (UTC)
Subject: [Buildroot] [Bug 1369] cannot build radvd (flex problem)
In-Reply-To: <bug-1369-163@https.bugs.busybox.net/>
References: <bug-1369-163@https.bugs.busybox.net/>
Message-ID: <20100824150319.EB12D88FA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1369

--- Comment #3 from Olivier <orosello@corp.free.fr>  ---
I have the same problem while trying to compile linux-atm with
buildroot-2010.05 (busybox 1.16.x) for powerpc :

checking dependency style of
/home/olivier/buildroot-2010.05/output/staging/usr/bin/powerpc-unknown-linux-uclibc-gcc
-Os -pipe -Os  -mtune=e500mc
-I/home/olivier/buildroot-2010.05/output/staging/usr/include
-I/home/olivier/buildroot-2010.05/output/staging/include
--sysroot=/home/olivier/buildroot-2010.05/output/staging/ -isysroot
/home/olivier/buildroot-2010.05/output/staging... none
checking for flex... flex
checking lex output file root... configure: error: cannot find output from
flex; giving up
make: ***
[/home/olivier/buildroot-2010.05/output/build/linux-atm-2.5.1/.stamp_configured]
Error 1

$ less output/build/linux-atm-2.5.1/config.log

configure:3727: checking dependency style of
/home/olivier/buildroot-2010.05/output/staging/usr/bin/powerpc-unknown-linux-uclibc-gcc
-Os -pipe -Os  -mtune=e500mc
-I/home/olivier/buildroot-2010.05/output/staging/usr/include
-I/home/olivier/buildroot-2010.05/output/staging/include
--sysroot=/home/olivier/buildroot-2010.05/output/staging/ -isysroot
/home/olivier/buildroot-2010.05/output/staging
configure:3837: result: none
configure:3857: checking for flex
configure:3873: found
/home/olivier/buildroot-2010.05/output/staging/usr/bin/flex
configure:3884: result: flex
configure:3921: flex conftest.l
/lib/ld-uClibc.so.0: No such file or directory
configure:3925: $? = 255
configure:3927: checking lex output file root
configure:3938: error: cannot find output from flex; giving up

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
