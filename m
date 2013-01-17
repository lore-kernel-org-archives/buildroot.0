From: Jenkins, Lee (ISS Houston) <Lee.Jenkins@hp.com>
Date: Thu, 17 Jan 2013 22:41:24 +0000
Subject: [Buildroot] need help adding apache to buildroot
In-Reply-To: <50F71D3A.2010906@zacarias.com.ar>
References: <2DD0B9C711CDFC45A3A266C78966CE7F40E3A14E@G4W3291.americas.hpqcorp.net>
 <50F71D3A.2010906@zacarias.com.ar>
Message-ID: <2DD0B9C711CDFC45A3A266C78966CE7F40E3AC93@G4W3291.americas.hpqcorp.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo & Thomas, thanks for the quick replies!

After a few changes to apache.mk the build started doing its thing, only to fail in mid stride.

The root problem is that the apache make process builds a binary (or maybe more than one) on the BUILD system that are then used to complete the build, but when cross-compiling, the binaries are being built for the target system instead of the build system. Ugh.

The good news is I found a patch that provides a CC_FOR_BUILD variable to fix the problem. However, the patch is not an "official" apache patch, but hosted at a different location here: http://people.apache.org/~fuankg/diffs/httpd-2.2.x-cross_compile.diff. If I'm reading the buildroot docs correctly, if I add APACHE_PATCH to apache.mk it will require the patch to be at the same URL as the tarball. Ugh.

Are the "patch hooks" simply shell commands? How egregious would it be (from a buildroot maintainer perspective) to use the patch hooks to wget the patch and apply it? :-)

Is there a simpler solution I'm not aware of?
