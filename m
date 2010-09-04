From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  4 Sep 2010 23:36:26 +0000 (UTC)
Subject: [Buildroot] [Bug 2503] Microperl fails build on MIPS
In-Reply-To: <bug-2503-163@https.bugs.busybox.net/>
References: <bug-2503-163@https.bugs.busybox.net/>
Message-ID: <20100904233626.940538A416@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2503

S?rgio <sergio@sergiomb.no-ip.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Version|2009.11                     |2009.08

--- Comment #1 from S?rgio <sergio@sergiomb.no-ip.org>  ---
Same problem has been reported on 
http://lists.busybox.net/pipermail/buildroot/2009-October/029989.html 
but no conclusion.

Looking for thread, found this: 

/usr/lib64/ccache/gcc -L/usr/local/lib -o miniperl \
            miniperlmain.o opmini.o libperl.a 
libperl.a(pp.o): In function `Perl_pp_int':
pp.c:(.text+0x9d41): undefined reference to `floor'
pp.c:(.text+0x9d61): undefined reference to `ceil'
libperl.a(pp.o): In function `Perl_pp_sqrt':
pp.c:(.text+0x9ec1): undefined reference to `sqrt'
libperl.a(pp.o): In function `Perl_pp_log':
pp.c:(.text+0x9fc9): undefined reference to `log'
libperl.a(pp.o): In function `Perl_pp_exp':
pp.c:(.text+0xa153): undefined reference to `exp'
libperl.a(pp.o): In function `Perl_pp_cos':
pp.c:(.text+0xa493): undefined reference to `cos'
libperl.a(pp.o): In function `Perl_pp_sin':
pp.c:(.text+0xa5f3): undefined reference to `sin'
libperl.a(pp.o): In function `Perl_pp_atan2':
pp.c:(.text+0xa7cd): undefined reference to `atan2'
libperl.a(pp.o): In function `Perl_pp_modulo':
pp.c:(.text+0xccb4): undefined reference to `floor'
pp.c:(.text+0xccea): undefined reference to `floor'
pp.c:(.text+0xcd4e): undefined reference to `fmod'
libperl.a(pp.o): In function `Perl_pp_pow':
pp.c:(.text+0xd35a): undefined reference to `pow'
libperl.a(pp_pack.o): In function `S_pack_rec':
pp_pack.c:(.text+0x21bc): undefined reference to `floor'
pp_pack.c:(.text+0x21ef): undefined reference to `floor'
collect2: ld returned 1 exit status
make[1]: *** [miniperl] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory
`/home/sergio/hardware/moviecube/buildroot/output/build/perl-5.8.8'


which is solved by add -lm 
/usr/lib64/ccache/gcc -L/usr/local/lib -o miniperl miniperlmain.o opmini.o
libperl.a

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
