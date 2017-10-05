From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Oct 2017 22:17:56 +0200
Subject: [Buildroot] [PATCH 1/2] openntpd: fix musl build with older
	kernel headers
In-Reply-To: <fcd9c70d93d412866e9f973469a81acfffa1860a.1506676404.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 29 Sep 2017 12:13:23 +0300")
References: <fcd9c70d93d412866e9f973469a81acfffa1860a.1506676404.git.baruch@tkos.co.il>
Message-ID: <871smhic23.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > musl provides its own SYS_getrandom definition, but not GRND_NONBLOCK.
 > This breaks the build with kernel headers older than v3.17. Add a patch
 > adding a local definition of GRND_NONBLOCK to fix the build.

 > The getentropy_linux.c file is in upstream tarball, but not in its git
 > repository. It originates form OpenBSD. For this reason the patch is
 > against the tarball, but not git formatted.

FYI, I believe upstream openntpd development only supports openbsd,
similar to E.G. openssh, and the linux specific code is in
openntpd-portable:

https://github.com/openntpd-portable/openntpd-portable

-- 
Bye, Peter Korsgaard
