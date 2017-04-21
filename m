From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 21 Apr 2017 06:33:14 +0300
Subject: [Buildroot] [PATCH 2/2] libnss: security bump to version 3.30.2
In-Reply-To: <20170420215334.3aafce73@free-electrons.com>
References: <d86176bbf66ac3fbbdc5a47456314bd68006df13.1492709669.git.baruch@tkos.co.il>
 <f4dcb1e701fce76f7f18bd8dfff60b1f2fdb2a4f.1492709669.git.baruch@tkos.co.il>
 <20170420215334.3aafce73@free-electrons.com>
Message-ID: <20170421033314.mklmhr2tthqheazt@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
On Thu, Apr 20, 2017 at 09:53:34PM +0200, Thomas Petazzoni wrote:
> On Thu, 20 Apr 2017 20:34:29 +0300, Baruch Siach wrote:
> > CVE-2017-5461 - Out-of-bounds write in Base64 encoding in NSS. Might cause
> > remote arbitrary code execution
> > (https://access.redhat.com/errata/RHSA-2017:1100).
> > 
> > CVE-2017-5462 - DRBG flaw in NSS
> > 
> > Drop 0001-cross-compile.patch and TARGET* variables. Upstream Makefile now
> > allows override of CC, so use TARGET_CONFIGURE_OPTS instead.
> > 
> > Drop upstream 0003-it-uninitialized-fix.patch.
> > 
> > Renumber the remaining patch.
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> > Backport note: depends on libnspr version 4.14
> > ---
> >  package/libnss/0001-cross-compile.patch            | 48 ----------------------
> >  .../{0002-uclibc.patch => 0001-uclibc.patch}       |  0
> >  package/libnss/0003-it-uninitialized-fix.patch     | 24 -----------
> >  package/libnss/libnss.hash                         |  4 +-
> >  package/libnss/libnss.mk                           | 12 ++----
> >  5 files changed, 6 insertions(+), 82 deletions(-)
> >  delete mode 100644 package/libnss/0001-cross-compile.patch
> >  rename package/libnss/{0002-uclibc.patch => 0001-uclibc.patch} (100%)
> >  delete mode 100644 package/libnss/0003-it-uninitialized-fix.patch
> 
> Applied to master, thanks.
> 
> Peter: we want this patch for the LTS branch. Baruch, can you comment
> on whether PATCH 1/2 is also needed for the libnss security bump?

As I noted in the backport note above, this NSS version needs libnspr version 
4.14, so PATCH 1/2 is prerequisite for this bump.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
