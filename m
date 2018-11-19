From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Nov 2018 16:06:30 +0100
Subject: [Buildroot] [PATCH] rpm: really take DEPENDENCIES into account
In-Reply-To: <20181119111945.17683-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 19 Nov 2018 12:19:45 +0100")
References: <20181119111945.17683-1-thomas.petazzoni@bootlin.com>
Message-ID: <8736rxqf7t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Commit e7af4033c32560594ddbd457b68f6d3713662a26 ("rpm: use the new
 > gettext logic") introduced a really nasty bug: by adding
 > $(TARGET_NLS_DEPENDENCIES) to RPM_DEPENDENCIES, it completely
 > overwrote the existing value of RPM_DEPENDENCIES, entirely masking all
 > mandatory RPM dependencies.

 > rpm is fairly towards the end of the alphabet, and most other
 > mandatory dependencies (berkeleydb, host-pkgconf, file and popt)
 > appear earlier by alphabetic ordering. Only zlib was afterwards, but
 > since file depends on zlib, it was always built before. This probably
 > explains why our autobuilders haven't encountered a single build
 > failure.

 > However, a simple "make rpm" clearly exhibits the failure, and
 > obviously the upcoming per-package folder mechanism makes such bugs
 > even more obvious.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 > I don't know who was this guy @free-electrons.com who did this silly
 > change, but something wasn't quite right with him :-)

:P

Committed, thanks.

-- 
Bye, Peter Korsgaard
