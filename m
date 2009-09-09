From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Sep 2009 09:22:56 +0200
Subject: [Buildroot] [PATCH 5/5] Rename the output directories
In-Reply-To: <87r5ug1tyj.fsf@macbook.be.48ers.dk>
References: <cover.1252361088.git.thomas.petazzoni@free-electrons.com>
	<cover.1252361088.git.thomas.petazzoni@free-electrons.com>
	<91f41119dff00090c4984705e86782b2f6efd1cc.1252361088.git.thomas.petazzoni@free-electrons.com>
	<87r5ug1tyj.fsf@macbook.be.48ers.dk>
Message-ID: <20090909092256.5a9291ab@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 09 Sep 2009 09:02:44 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Why do we still need stamps/ if we get rid of project_build_*? Can't
> the stamp files just live with the sources, so you can just do rm -rf
> build/<package> to get it rebuilt?

Because the compilation of host packages uses the $(STAMP_DIR) a lot,
see the result of "git grep STAMP_DIR". A few other places use
$(STAMP_DIR) as well.

Note: this is also something I don't like, but I think it's better to
fix one thing at a time :-)

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
