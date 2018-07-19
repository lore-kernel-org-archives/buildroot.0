From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 23:38:09 +0200
Subject: [Buildroot] [PATCH v2 1/2] coreutils: fix chroot installation
In-Reply-To: <2b42d6f4f947a7423813916cd6f8e5f37c5b113a.1531338679.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 11 Jul 2018 22:51:18 +0300")
References: <2b42d6f4f947a7423813916cd6f8e5f37c5b113a.1531338679.git.baruch@tkos.co.il>
Message-ID: <877elqc3em.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Since commit 256bb383fb7 (coreutils: use single binary in symlink
 > method) the chroot move command creates a dangling symlink, because the
 > symlink target is 'coreutils' which is not in the /usr/sbin/ directory.
 > Instead of moving, remove the coreutils installed symlink, and create a
 > new one in $(TARGET_DIR)/usr/sbin with the correct target.

 > Should also fix (busybox):
 > http://autobuild.buildroot.net/results/6b3/6b39648b466738162516aa50ab328d839ec85448/

 > Cc: Carlos Santos <casantos@datacom.ind.br>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 > v2: Drop ../usr from symlink target (Arnout, Carlos)

Committed to 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
