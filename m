From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jul 2020 08:37:52 +0200
Subject: [Buildroot] [git commit] support/script/pkg-stats: handle
 exception when version comparison fails
In-Reply-To: <20200712192003.B0FFA869C1@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 12 Jul 2020 21:22:55 +0200")
References: <20200712192003.B0FFA869C1@busybox.osuosl.org>
Message-ID: <877duxnzjz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=7d2779ecbb142b62f8913d30352b11058f922b2a
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > With python 3, when a package has a version number x-y-z instead of
 > x.y.z, then the version returned by LooseVersion can't be compared
 > which raises a TypeError exception:

 > Traceback (most recent call last):
 >   File "./support/scripts/pkg-stats", line 1062, in <module>
 >     __main__()
 >   File "./support/scripts/pkg-stats", line 1051, in __main__
 >     check_package_cves(args.nvd_path, {p.name: p for p in packages})
 >   File "./support/scripts/pkg-stats", line 613, in check_package_cves
 >     if pkg_name in packages and cve.affects(packages[pkg_name]):
 >   File "./support/scripts/pkg-stats", line 386, in affects
 >     return pkg_version <= cve_affected_version
 >   File "/usr/lib64/python3.8/distutils/version.py", line 58, in __le__
 >     c = self._cmp(other)
 >   File "/usr/lib64/python3.8/distutils/version.py", line 337, in _cmp
 >     if self.version < other.version:
 > TypeError: '<' not supported between instances of 'str' and 'int'

 > This patch handles this exception by adding a new return value when
 > the comparison can't be done. The code is adjusted to take of this
 > change. For now, a return value of CVE_UNKNOWN is handled the same way
 > as a CVE_DOESNT_AFFECT return value, but this can be improved later
 > on.

 > Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
