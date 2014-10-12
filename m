From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 09:25:24 +0200
Subject: [Buildroot] [PATCH 01/25 v7] gendoc infra: move manual build
	location into $(BUILD_DIR)/docs/manual
In-Reply-To: <2c6e9687c0d69163e2e87f9747fa3cf5856a4961.1412355549.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Fri, 3 Oct 2014 19:01:35 +0200")
References: <cover.1412355549.git.yann.morin.1998@free.fr>
 <2c6e9687c0d69163e2e87f9747fa3cf5856a4961.1412355549.git.yann.morin.1998@free.fr>
Message-ID: <8738at7nrv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Samuel Martin <s.martin49@gmail.com>
 > This patch reworks the manual source preparation by:
 > - moving the build directory under $(BUILD_DIR)/, this keeps consistency
 >   with the other Buildroot infrastructures;
 > - adding a couple of targets: 'manual-rsync' and 'manual-prepare-sources',
 >   to deal more efficiently with the manual sources and avoid rsync-ing
 >   them on every single manual-* target.

 > The 'manual-rsync' target only copies the manual sources under git, while
 > the 'manual-prepare-sources' also takes care of the generated ones. These
 > targets are now run only once,  and the manual build is no longer cleaned
 > after each manual format generation.

 > Now, the 'manual-clean' target only remove the manual build directory, but
 > keeps the output one $(O)/output/doc/manual unchanged.

 > Doing so (moving the manual build directory and keeping it between 2
 > manual format generation) ensures that all generated sources are taken
 > in account when generating the manual [1].

 > [1] http://lists.busybox.net/pipermail/buildroot/2014-August/104421.html

 > Cc: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 > [yann.morin.1998 at free.fr: moved into $(BUILD_DIR)/docs/manual as per
 > Thomas P. suggestion]
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed series with the small comment of Thomas DS and the default
make target fixed, thanks!

-- 
Bye, Peter Korsgaard
