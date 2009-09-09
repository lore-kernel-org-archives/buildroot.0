From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Sep 2009 09:02:44 +0200
Subject: [Buildroot] [PATCH 5/5] Rename the output directories
In-Reply-To: <91f41119dff00090c4984705e86782b2f6efd1cc.1252361088.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Tue\,
	8 Sep 2009 00\:09\:53 +0200")
References: <cover.1252361088.git.thomas.petazzoni@free-electrons.com>
	<cover.1252361088.git.thomas.petazzoni@free-electrons.com>
	<91f41119dff00090c4984705e86782b2f6efd1cc.1252361088.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87r5ug1tyj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> In the output directory, we now have
 Thomas>  - build/    where all the packages are built
 Thomas>  - images/   where the final kernel and rootfs images are stored
 Thomas>  - staging/  the staging directory (containing the development files
 Thomas>              and libraries compiled for the target)
 Thomas>  - target/   which contains the target root filesystem
 Thomas>  - host/     which contains all the host programs
 Thomas>  - stamps/   which contains the stamps files

Why do we still need stamps/ if we get rid of project_build_*? Can't the
stamp files just live with the sources, so you can just do rm -rf
build/<package> to get it rebuilt?

-- 
Bye, Peter Korsgaard
