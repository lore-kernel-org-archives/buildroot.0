From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Apr 2018 14:30:25 +0200
Subject: [Buildroot] [PATCH] hackrf: new package
In-Reply-To: <20180331205758.9652-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Sat, 31 Mar 2018 22:57:58 +0200")
References: <20180331205758.9652-1-arnout@mind.be>
Message-ID: <87o9j3rtwe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > From: Jason Pruitt <jrspruitt@gmail.com>
 > This patch adds hackrf/host tools for HackRF, a low cost, open source
 > Software Defined Radio platform.

 > Sources of host tools are available on GitHub here:
 > https://github.com/mossmann/hackrf/tree/master/host

 > Signed-off-by: Jason Pruitt <jrspruitt@gmail.com>
 > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
 > [Arnout:
 >  - Rename package to hackrf to match upstream name;
 >  - Reorder dependencies and remove empty line (check-package);
 >  - Use only sha256 hash;
 >  - Add hash for license file;
 >  - Bump to 2018.01.1;
 >  - Use uploaded tarball rather than github-generated one;
 >  - Fix dependencies of comment (|| instead of &&)
 >  - Add UDEV_RULES_GROUP=plugdev in case the build host doesn't have
 >    this group;
 >  - Add patch fixing build without C++ compiler.
 > ]
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > ---
 > v2: Changes by Arnout, see above

 > +config BR2_PACKAGE_HACKRF
 > +	bool "hackrf"
 > +	depends on !BR2_STATIC_LIBS
 > +	depends on BR2_TOOLCHAIN_HAS_THREADS
 > +	depends on BR2_PACKAGE_FFTW_PRECISION_SINGLE

While not strictly required I think we should select BR2_PACKAGE_FFTW so
it cannot easily be deselected in menuconfig.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
