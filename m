From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Feb 2021 21:56:42 +0100
Subject: [Buildroot] [PATCH] utils/getdeveloperlib.py: reduce Cc: list
 based on package infras
In-Reply-To: <20210210080136.2709779-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 10 Feb 2021 09:01:35 +0100")
References: <20210210080136.2709779-1-thomas.petazzoni@bootlin.com>
Message-ID: <87k0reiar9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > When a developer has package/pkg-<infra>.mk assigned to him/her in the
 > DEVELOPERS file, this has 3 implications:

 >  (1) Patches adding new packages using this infrastructure are Cc'ed
 >      to this developer. This is done by the analyze_patch() function,
 >      which matches the regexp r"^\+\$\(eval
 >      \$\((host-)?([^-]*)-package\)\)$" in the patch, i.e where an
 >      added line contains a reference to the infra maintained by the
 >      developer.

 >  (2) Patches touching the package/pkg-<infra>.mk file itself are Cc'ed
 >      to this developer.

 >  (3) Any patch touching a package using this infra are also Cc'ed to
 >      this developer.

 > Point (3) causes a significant amount of patches to be sent to
 > developers who have package/pkg-generic.mk and
 > package/pkg-autotools.mk assigned to them in the DEVELOPERS
 > file. Basically, all patches touching generic or autotools packages
 > get CC'ed to such developers, which causes a massive amount of patches
 > to be received.

 > So this patch adjusts the getdeveloperlib.py to drop point (3), but
 > preserves point (1) and (2). Indeed, it makes sense to be Cc'ed on new
 > package additions (to make a review that they use the package
 > infrastructure correctly), and it makes sense to be Cc'ed on patches
 > that touch the infrastructure code itself.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
