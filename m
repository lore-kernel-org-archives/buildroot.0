From: Ricardo Herrero <ricardo.herrero@gmail.com>
Date: Tue, 31 Jan 2017 10:06:50 +0100
Subject: [Buildroot] LIBFOO_GIT_SUBMODULES
In-Reply-To: <20170131090458.hubcad6ddjd3zfcp@tarshish>
References: <CABLXdK9xko_SrWN1JQtSwZTxJ8PJuW=CVr6b4D4XR8RiEMXfcg@mail.gmail.com>
 <20170131083011.ut2ltabpqw23v2m5@tarshish>
 <CABLXdK_n0B3nF+iJF5CeD3jDpfieOgpG7RbtnAHOkMTun-_0CQ@mail.gmail.com>
 <CABLXdK9v992hQEmmZGx+r0JW8aDtSHJV2+bcteLtdnP4BVrgYw@mail.gmail.com>
 <20170131090458.hubcad6ddjd3zfcp@tarshish>
Message-ID: <CABLXdK_jmL+LLYAh0OY7-saQf=kWf3ADar+LRab6-w1S2yZV+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ok, Thanks so much!!

On Tue, Jan 31, 2017 at 10:04 AM, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Ricardo,
>
> Please keep the Buildroot list on Cc.
>
> On Tue, Jan 31, 2017 at 09:51:49AM +0100, Ricardo Herrero wrote:
> >  I?m using Buildroot-2016.05, maybe it?s too outdated?
>
> It seems so. Support for git submodules download was added in commit
> ec3e057f791 (core/pkg-infra: download git submodules if the package wants
> them), which was part of release 2016.08.
>
> You may try cherry-picking this commit.
>
> baruch
>
> > On Tue, Jan 31, 2017 at 9:43 AM, Ricardo Herrero <
> ricardo.herrero at gmail.com>
> > wrote:
> >
> > >  Thanks for the help, I have tried different values for my .mk file
> but I
> > > still can?t get it work, It is like buildroot doesn?t use the variable,
> > > maybe I?m using and old version of buildroot? This is the first part
> of my
> > > .mk,
> > >
> > > *AREADETECTOR_VERSION = bf48e03*
> > > *AREADETECTOR_SITE_METHOD = git*
> > > *AREADETECTOR_GIT_SUBMODULES = Y*
> > > *AREADETECTOR_SITE = https://github.com/areaDetector/areaDetector.git
> > > <https://github.com/areaDetector/areaDetector.git>*
> > > *AREADETECTOR_DIR = $(BUILD_DIR)/areaDetector-$(AREADETECTOR_VERSION)*
> > > *#AREADETECTOR_CAT = $(ZCAT)*
> > > *AREADETECTOR_LICENSE = AREADETECTOR*
> > > *AREADETECTOR_LICENSE_FILES = LICENSE*
> > > *AREADETECTOR_INSTALL_TARGET = YES*
> > > *AREADETECTOR_TARGET = $(TARGET_DIR)/opt/epics/support/areaDetector*
> > >
> > > And I?m sending you also my .mk and Config.in if you would like to
> test it.
> > >
> > > On Tue, Jan 31, 2017 at 9:30 AM, Baruch Siach <baruch@tkos.co.il>
> wrote:
> > >
> > >> On Tue, Jan 31, 2017 at 09:20:46AM +0100, Ricardo Herrero wrote:
> > >> >  I?m trying to use github to download a repository with submodules,
> as
> > >> if I
> > >> > we using "*git clone --recursive*". The manual talks about
> > >> > *LIBFOO_GIT_SUBMODULES
> > >> > *when you set *LIBFOO_SITE_METHOD = git* but the manual doesn?t say
> > >> > anything about what we are supposed to configure in this variable.
> Do we
> > >> > have to write Y or YES? The fact is that it is not working and
> buildroot
> > >> > does not give any advice.
> > >>
> > >> You may set LIBFOO_GIT_SUBMODULES to any non-empty value to trigger a
> > >> recursive git clone.
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--
> Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170131/eccdb391/attachment.html>
