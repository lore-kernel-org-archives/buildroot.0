From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 19:04:00 +0100
Subject: [Buildroot] [PATCH 2/2] package/dtc: backport upstream fix
 solving Assertion Error with some .dts files
In-Reply-To: <20181124090403.4045-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 24 Nov 2018 10:04:03 +0100")
References: <20181124090403.4045-1-thomas.petazzoni@bootlin.com>
 <20181124090403.4045-2-thomas.petazzoni@bootlin.com>
Message-ID: <87a7lvu35b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The build of U-Boot on Microchip (formerly Atmel) platforms currently
 > fails to build with an Assertion Error in dtc. This happens since we
 > bumped dtc from 1.4.4 to 1.4.7, as a regression was introduced in dtc
 > 1.4.6, and fixed post-1.4.7. This commit backports the upstream commit
 > to resolve this Assertion Error.

 > The build error was:

 > dtc: livetree.c:438: propval_cell: Assertion `prop->val.len == sizeof(cell_t)' failed.
 > dtc: livetree.c:438: propval_cell: Assertion `prop->val.len == sizeof(cell_t)' failed.
 > Aborted (core dumped)

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/124434438
 >   (and numerous other similar build failures)

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
