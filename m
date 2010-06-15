From: Damien Borie <dbe@terawatt.fr>
Date: Tue, 15 Jun 2010 09:07:58 +0200
Subject: [Buildroot] [Re:  Valgrind compilation, with patch 3.5.0, need help]
Message-ID: <4C1726CE.8080009@terawatt.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

My architecture is x86.

It's not me that say that Valgrind depends on glibc version, it's the
log...I have only added valgrind in my configuration and launch 'make
source' and 'make'. The package is downloaded without problem but during
compilation, there is a test on glibc version number. I can see it in
'configure.in' file. And it say me that Valgrind need glibc version 2.2
to 2.5. I use 2.9.

So, I tried to compile Valgrind version 3.5.0. I only change the version
number in Config.in file (in package/valgrind/). 'make source' cause the
package download without problems. Then 'make' doesn't cause error but
it try to apply a patch ('valgrind-largefile patch'). This patch modify
a file 'coregrind/m_ume.c' and ask me to type a path to a file to patch,
with no others precisions.
So I don't know how to type here. And if I ignore, the compilation end
with an error (saying that I must apply the patch).

Any idea?

Damien Borie

TERAWATT / AENERGIA S.A.S.
ZA DUBOSCOA
64990 Villefranque
FRANCE

tel : +33 (0)5 59 44 26 08
fax : +33 (0)5 59 31 15 11



Thomas Petazzoni a ?crit :
 > On Mon, 14 Jun 2010 17:10:41 +0200
 > Damien Borie <dbe@terawatt.fr> wrote:
 >
 >
 >> I Have to add Valgrind to my distribution to debug my programs. The
 >> version in buildroot doesn't compile because it needs glibc 2.2 -2.5,
 >> and I have 2.9. So I tried with the patch to bump to Valgrind 3.5.0.
 >> But it ask me fro a file to patch, and I don't understand what I must
 >> type to apply correctly the patch and compile Valgrind. In the match
 >> itself, I cannot see indications about this file to choose.
 >>
 >
 > What is your target architecture ? Remember that Valgrind only works on
 > x86, x86_64 and PowerPC 32/64.
 >
 > Moreover, I don't really see how Valgrind in Buildroot would depend on
 > a particular version of glibc. Can you be more specific about what
 > you're doing and the exact result of the commands you're using ?
 >
 > Thomas
 >


-- 
Damien Borie

TERAWATT / AENERGIA S.A.S.
ZA DUBOSCOA
64990 Villefranque
FRANCE 

tel : +33 (0)5 59 44 26 08
fax : +33 (0)5 59 31 15 11 
