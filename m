From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 May 2016 21:58:34 +0200
Subject: [Buildroot] [PATCH] libgpgme: fix musl build with
	argp-standalone
In-Reply-To: <c36ebee5f307f61019940cc0ba7037c728ffe79c.1464093017.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 24 May 2016 15:30:17 +0300")
References: <c36ebee5f307f61019940cc0ba7037c728ffe79c.1464093017.git.baruch@tkos.co.il>
Message-ID: <877fejb53p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The libgpgme configure script does not detect the error_t type under musl,
 > because musl does not define error_t in errno.h. As a result config.h adds a
 > local definition of error_t. When argp-standalone is present this local
 > definition collides with the error_t typedef in argp.h. Assume we always have
 > error_t when argp-standalone is present.

 > Fixes:
 > http://autobuild.buildroot.net/results/656/6566a1c77983404d90920997bfd15bd98c7ddde7/
 > http://autobuild.buildroot.net/results/a7b/a7b92ad68ff6e13d20ff44e955dc5748b2efd6a4/
 > http://autobuild.buildroot.net/results/0db/0db1b2aa0969d6cbae57b1400b7b766a5988abf9/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
