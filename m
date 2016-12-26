From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 26 Dec 2016 14:12:01 +0200
Subject: [Buildroot] [PATCH] Fix reverse dependencies of util-linux
In-Reply-To: <90B0A5D74F9D1542B45328A4E51B57F0DB2D0541@PUMAIL01.pu.imgtec.org>
References: <1482675981-4575-1-git-send-email-rahul.bedarkar@imgtec.com>
 <20161225180059.jlmzfuuiqumcuf6l@tarshish>
 <90B0A5D74F9D1542B45328A4E51B57F0DB2D0541@PUMAIL01.pu.imgtec.org>
Message-ID: <20161226121201.6a43y7suwi3ujtrw@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rahul,

On Mon, Dec 26, 2016 at 11:07:20AM +0000, Rahul Bedarkar wrote:
> > On Sun, Dec 25, 2016 at 07:56:21PM +0530, Rahul Bedarkar wrote:
> > > Commit 006a328ad6be ("util-linux: fix build with ncurses") removed
> > > dependency on BR2_USE_WCHAR, but failed to update the reverse
> > > dependencies of util-linux.
> > >
> > > This commit fixes all such reverse dependencies by removing dependency
> > > on BR2_USE_WCHAR if not required by package itself.
> > >
> > > Thanks to comments that we add in Config.in for dependencies which are
> > > pulled from selected packages.
> >
> > Have you verified that these packages actually build without BR2_USE_WCHAR?
> > Some packages might have grown dependent on wchar over time. You may use a
> > basic[1] config to verify that.
> 
> I had tested some of the packages with qemu x86 config. But I am now trying to
> build all package with basic config that you shared. Indeed some package that
> I missed are using wchar on it's own. Once I am done with it, I send version 2.

Thanks.

Please send a separate patch to update the dependency comments of packages 
that depends on wchar directly according to your test.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
