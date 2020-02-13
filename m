From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2020 23:03:40 +0100
Subject: [Buildroot] [PATCH 1/2] support/scripts/pkg-stats: add support
 for CVE reporting
In-Reply-To: <6c4454d9-28bc-70ef-579a-7e3b1931ec5d@mind.be> (Arnout
 Vandecappelle's message of "Wed, 5 Feb 2020 11:48:07 +0100")
References: <20200204215232.666841-1-thomas.petazzoni@bootlin.com>
 <20200204215232.666841-2-thomas.petazzoni@bootlin.com>
 <6c4454d9-28bc-70ef-579a-7e3b1931ec5d@mind.be>
Message-ID: <874kvudu0z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> +            pkg_version = distutils.version.LooseVersion(pkg.current_version)
 >> +            if not hasattr(pkg_version, "version"):
 >> +                print("Cannot parse package '%s' version '%s'" % (pkg.name, pkg.current_version))
 >> +                continue
 >> +            cve_affected_version = distutils.version.LooseVersion(v["version_value"])
 >> +            if not hasattr(cve_affected_version, "version"):
 >> +                print("Cannot parse CVE affected version '%s'" % v["version_value"])
 >> +                continue
 >> +            return pkg_version < cve_affected_version

 >  Maybe use packaging.version instead? [1]

 > [1]
 > https://stackoverflow.com/questions/11887762/how-do-i-compare-version-numbers-in-python

 >  Hm, but the packaging module is not installed on my system (which does have
 > setuptools), so maybe not...

On Debian atleast, this is available in python{,3}-packaging, but is not
a reverse dependency of setuptools:

apt-cache rdepends python-packaging
python-packaging
Reverse Depends:
  legit
  python-sphinx
  sagemath
  python-pdal
  python-deprecation
  python-nipype

The stackoverflow package alternatively talks about distutils.version,
which we AFAIK also mentioned earlier.

-- 
Bye, Peter Korsgaard
