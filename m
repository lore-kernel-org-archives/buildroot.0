From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 31 Jul 2016 07:38:53 +0300
Subject: [Buildroot] [PATCH] iperf: bump to version 2.0.9
In-Reply-To: <20160730143139.10ffbed2@free-electrons.com>
References: <0fe5e4e62f4093b8d30fd1155d8832cd2482a57e.1469784407.git.baruch@tkos.co.il>
 <20160730143139.10ffbed2@free-electrons.com>
Message-ID: <20160731043853.GA3620@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Jul 30, 2016 at 02:31:39PM +0200, Thomas Petazzoni wrote:
> On Fri, 29 Jul 2016 12:26:47 +0300, Baruch Siach wrote:
> > iperf2 is a fork of the original unmaintained iperf project, that continues
> > the development of the iperf 2.x series. Update homepage link, and download
> > location.
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> >  package/iperf/0001-add-missing-header.patch | 28 ++++++++++++++++++++++++++++
> >  package/iperf/Config.in                     |  2 +-
> >  package/iperf/iperf.hash                    |  4 +++-
> >  package/iperf/iperf.mk                      |  4 ++--
> >  4 files changed, 34 insertions(+), 4 deletions(-)
> >  create mode 100644 package/iperf/0001-add-missing-header.patch
> 
> I've applied, after doing the following changes:
> 
>     [Thomas:
>      - change the download location to use downloads.sourceforge.net

What is the advantage of downloads.sourceforge.net? Many packages still use 
just sourceforge.net:

$ git grep _SITE[^\.]*sourceforge -- package/ |wc -l
20

>      - turn the patch into a Git-formatted one, since upstream uses Git as
>        its version control system

Where have you found a link to that repo? Only after googling for "iperf2 git" 
I found an indication to its existence in https://github.com/daynix/iperf2.

>      - as noticed by Khem Raj, a C99 compiler is needed for the bool type,
>        so added AC_PROG_CC_C99 to configure.ac, and consequently added
>        IPERF_AUTORECONF = YES.
>      - removed two <pkg>_CONF_ENV variables related to the bool type, they
>        were added by an older commit
>        e13ac0ec8788092c6508636da94fe0198c18dffd back when we had a
>        config.cache shared between packages (which is no longer the case
>        today)]
> 
> If you could submit the updated patch upstream, it would be good.

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
