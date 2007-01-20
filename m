From: Henning Holtschneider <henning@loca.net>
Date: Sat, 20 Jan 2007 14:47:57 +0100
Subject: [Buildroot] working soft-float on ARM/xscale?
Message-ID: <45B21D8D.1070902@loca.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello everybody,

I'm looking for a version of the buildroot environment that builds a
working set of binaries with decent soft-float support on ARM/xscale. I
started off with a recent SVN snapshot of buildroot (20070113) and tried
to build gcc 3.4.6 and uClibc 0.9.28. It compiled fine and produced
working code, but the it turned out that uClibc's libm did not include
any rounding functions (lround(), lroundf() et.al., which is what I'm
looking for specifically).

I then went on to gcc 3.4.6 and uClibc snapshot 20070113. It compiles,
but it has problems with the linuxthreads support which makes all shared
applications crash on the target platform.

After that, I decided to have a closer look at gcc and it seemed to be
most promising to use gcc 4.1.0 together with a recent uClibc snapshot.
However, that combination fails to compile because of undefined or
redefined symbols. Other people seem to have come across this before
(see http://bugs.busybox.net/view.php?id=299,
http://bugs.uclibc.org/view.php?id=1069,
http://uclibc.org/lists/uclibc/2006-April/015154.html) but none of the
proposed solutions fixes the compile problems for me.

Can anyone help out with a working combination of buildroot snapshot,
uClibc snapshot, buildroot .config and probably uClibc .config?

Best regards,
Henning Holtschneider
- --
LocaNet oHG - http://www.loca.net
Lindemannstrasse 81, D-44137 Dortmund
tel +49 231 91596-25, fax +49 231 91596-55
sip 25 at voip.loca.net
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (MingW32)

iD8DBQFFsh2NP9goCV2uudcRAk/uAKCsRHzLkVvIODyLIfo5SZFIoba7/QCgj6zO
2HqoPK7QZz45irWZHy6x0AQ=
=lHEF
-----END PGP SIGNATURE-----
