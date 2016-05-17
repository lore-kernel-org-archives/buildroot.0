From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 May 2016 08:50:51 +0200
Subject: [Buildroot] [PATCH 7/9] toolchain: remove eglibc support
In-Reply-To: <1463436782-17051-8-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 17 May 2016 00:13:00 +0200")
References: <1463436782-17051-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1463436782-17051-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87poslch4k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The eglibc support has been marked deprecated since 2015.08, so it's
 > time to remove it.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  Config.in.legacy                                   |   8 +
 >  package/gcc/Config.in.host                         |   2 +-
 >  .../2.18-svnr23787/0001-CVE-2014-7817-eglibc.patch | 174 ---------------------
 >  .../glibc/2.18-svnr23787/0002-accept-make4.patch   |  33 ----
 >  .../glibc/2.18-svnr23787/0003-CVE-2014-6040.patch  | 141 -----------------
 >  .../glibc/2.18-svnr23787/0004-CVE-2014-9402.patch  |  20 ---
 >  .../glibc/2.18-svnr23787/0005-CVE-2015-1472.patch  |  88 -----------
 >  .../2.19-svnr25243/0001-CVE-2014-7817-eglibc.patch | 174 ---------------------
 >  .../glibc/2.19-svnr25243/0002-CVE-2014-6040.patch  | 141 -----------------
 >  .../glibc/2.19-svnr25243/0003-CVE-2014-9402.patch  |  20 ---
 >  .../glibc/2.19-svnr25243/0004-CVE-2015-1472.patch  |  88 -----------
 >  package/glibc/Config.in                            |  27 ----
 >  package/glibc/glibc.mk                             |   7 -
 >  toolchain/toolchain-buildroot/Config.in            |  23 ---
 >  14 files changed, 9 insertions(+), 937 deletions(-)
 >  delete mode 100644 package/glibc/2.18-svnr23787/0001-CVE-2014-7817-eglibc.patch
 >  delete mode 100644 package/glibc/2.18-svnr23787/0002-accept-make4.patch
 >  delete mode 100644 package/glibc/2.18-svnr23787/0003-CVE-2014-6040.patch
 >  delete mode 100644 package/glibc/2.18-svnr23787/0004-CVE-2014-9402.patch
 >  delete mode 100644 package/glibc/2.18-svnr23787/0005-CVE-2015-1472.patch
 >  delete mode 100644 package/glibc/2.19-svnr25243/0001-CVE-2014-7817-eglibc.patch
 >  delete mode 100644 package/glibc/2.19-svnr25243/0002-CVE-2014-6040.patch
 >  delete mode 100644 package/glibc/2.19-svnr25243/0003-CVE-2014-9402.patch
 >  delete mode 100644 package/glibc/2.19-svnr25243/0004-CVE-2015-1472.patch

 > diff --git a/Config.in.legacy b/Config.in.legacy
 > index ff11d75..7b76f28 100644
 > --- a/Config.in.legacy
 > +++ b/Config.in.legacy
 > @@ -145,6 +145,14 @@ endif
 >  ###############################################################################
 >  comment "Legacy options removed in 2016.08"
 
 > +config BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 > +	bool "eglibc support has been removed"
 > +	select BR2_LEGACY
 > +	help
 > +	  The eglibc project no longer exists, as it has been merged
 > +	  back into the glibc project. Therefore, support for eglibc
 > +	  has been removed, and glibc should be used instead.

Committed to next, thanks. Perhaps we should add:

select BR2_TOOLCHAIN_BUILDROOT_GLIBC

As the defconfig otherwise falls back to uClibc.

-- 
Bye, Peter Korsgaard
