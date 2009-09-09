From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Sep 2009 09:37:11 +0200
Subject: [Buildroot] [PATCH 5/5] Rename the output directories
In-Reply-To: <20090909092256.5a9291ab@surf> (Thomas Petazzoni's message of
	"Wed\, 9 Sep 2009 09\:22\:56 +0200")
References: <cover.1252361088.git.thomas.petazzoni@free-electrons.com>
	<cover.1252361088.git.thomas.petazzoni@free-electrons.com>
	<91f41119dff00090c4984705e86782b2f6efd1cc.1252361088.git.thomas.petazzoni@free-electrons.com>
	<87r5ug1tyj.fsf@macbook.be.48ers.dk> <20090909092256.5a9291ab@surf>
Message-ID: <87eiqg1sd4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Why do we still need stamps/ if we get rid of project_build_*? Can't
 >> the stamp files just live with the sources, so you can just do rm -rf
 >> build/<package> to get it rebuilt?

 Thomas> Because the compilation of host packages uses the $(STAMP_DIR) a lot,
 Thomas> see the result of "git grep STAMP_DIR". A few other places use
 Thomas> $(STAMP_DIR) as well.

It did that to test the impact of having real dependencies (E.G. so you
could one day run the top level makefile with -j. If host packages are
the only thing we need stamps/ for, then I think we should just change
the few host packages to use the normal virtual targets and ordering.

 Thomas> Note: this is also something I don't like, but I think it's better to
 Thomas> fix one thing at a time :-)

;)

-- 
Bye, Peter Korsgaard
