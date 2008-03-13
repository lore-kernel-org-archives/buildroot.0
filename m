From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 13 Mar 2008 17:32:24 +1100
Subject: [Buildroot] fakeroot patch
In-Reply-To: <10259697.390451205373041411.JavaMail.root@zmail.rearden.com>
References: <10259697.390451205373041411.JavaMail.root@zmail.rearden.com>
Message-ID: <20080313063224.GA2546@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 12, 2008 at 06:50:41PM -0700, J. Spence wrote:
> Did that last patch to the fakeroot package break anyone else's build?  The debian server that the patch now points to is responding 404 when the build system tries to get the fakeroot tarball.

Yes the patch was wrong:

http://buildroot.uclibc.org/cgi-bin/viewcvs.cgi/trunk/buildroot/package/fakeroot/fakeroot.mk?rev=21316&r1=21289&r2=21316

-FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).tar.gz
+FAKEROOT_SOURCE:=fakeroot-$(FAKEROOT_VERSION).tar.gz

This didn't need changing.

Please all, test your commits.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
