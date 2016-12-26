From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Date: Mon, 26 Dec 2016 11:07:20 +0000
Subject: [Buildroot] [PATCH] Fix reverse dependencies of util-linux
In-Reply-To: <20161225180059.jlmzfuuiqumcuf6l@tarshish>
References: <1482675981-4575-1-git-send-email-rahul.bedarkar@imgtec.com>,
 <20161225180059.jlmzfuuiqumcuf6l@tarshish>
Message-ID: <90B0A5D74F9D1542B45328A4E51B57F0DB2D0541@PUMAIL01.pu.imgtec.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

> Hi Rahul,
>
> On Sun, Dec 25, 2016 at 07:56:21PM +0530, Rahul Bedarkar wrote:
> > Commit 006a328ad6be ("util-linux: fix build with ncurses") removed
> > dependency on BR2_USE_WCHAR, but failed to update the reverse
> > dependencies of util-linux.
> >
> > This commit fixes all such reverse dependencies by removing dependency
> > on BR2_USE_WCHAR if not required by package itself.
> >
> > Thanks to comments that we add in Config.in for dependencies which are
> > pulled from selected packages.
>
> Have you verified that these packages actually build without BR2_USE_WCHAR?
> Some packages might have grown dependent on wchar over time. You may use a
> basic[1] config to verify that.

I had tested some of the packages with qemu x86 config. But I am now trying to
build all package with basic config that you shared. Indeed some package that
I missed are using wchar on it's own. Once I am done with it, I send version 2.

Thanks,
Rahul
