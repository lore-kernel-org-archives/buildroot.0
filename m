From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Oct 2008 16:15:09 +0100
Subject: [Buildroot] [PATCH] Fix matchbox build
In-Reply-To: <20081027155540.61552c7d@surf> (Thomas Petazzoni's message of
	"Mon\, 27 Oct 2008 15\:55\:40 +0100")
References: <20081027155540.61552c7d@surf>
Message-ID: <87r662jchu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas>  * libmatchbox and matchbox-panel were using a now legacy index()
 Thomas>    function, which is not part of every uClibc build nowadays
 Thomas>    (depending on the configuration). As this function doesn't exist
 Thomas>    anymore in all builds, use strchr() instead, which is the
 Thomas>    recommended replacement for index(). Two patches, one for
 Thomas>    libmatchbox, one for matchbox-panel, are added to fix this problem.

 Thomas>    Closes bug http://bugs.uclibc.org/view.php?id=5484

Thanks! I had a quick look at it as well, but hadn't gotten around to
do it yet.

Don't forget to send to patches upstream.

 Thomas>  * Do not override the CFLAGS and LDFLAGS values, they are already set
 Thomas>    by TARGET_CONFIGURE_OPTS. It caused build failures.

 Thomas>  * Mangle the library paths in the .la file of libmatchbox, after
 Thomas>    installation in the staging dir.

 Thomas> It would probably be nice to switch Matchbox over to the new
 Thomas> Makefile.autotools.in.

Exactly. It seems pretty standard auto*.

Committed.

-- 
Bye, Peter Korsgaard
