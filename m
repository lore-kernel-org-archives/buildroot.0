From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 2 Sep 2015 13:21:35 +0300
Subject: [Buildroot] [PATCHv2 1/2] udisks: bump to version 1.0.5
In-Reply-To: <20150902121429.2829a9e5@free-electrons.com>
References: <1441188349-13079-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150902101033.GY17874@tarshish>
 <20150902121429.2829a9e5@free-electrons.com>
Message-ID: <20150902102135.GZ17874@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Sep 02, 2015 at 12:14:29PM +0200, Thomas Petazzoni wrote:
> On Wed, 2 Sep 2015 13:10:34 +0300, Baruch Siach wrote:
> > On Wed, Sep 02, 2015 at 11:05:48AM +0100, Vicente Olivert Riera wrote:
> > > +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> > > +UDISKS_CONF_OPTS += libgudev
> > > +endif
> > 
> > So libgudev is not even an optional dependency when there is no systemd?
> 
> No.
> 
> libgudev used to be provided by udev. Then udev was merged in systemd.
> Then libgudev was taken out of systemd, and made a separate project.
> 
> So:
> 
>  * If you're using systemd as the udev provider, and you need libgudev,
>    then you must use the libgudev package.
> 
>  * If you're using eudev as the udev provider, and you need libgudev,
>    you have nothing to do, because libgudev is still provided by eudev
>    (it hasn't been removed of it, like it was done in systemd).

I assume that eudev provided libgudev lives at some other place than 
standalone libgudev. Otherwise, one would overwrite the other.

> So, libgudev is used in both cases (systemd or not), but it's simply
> either provided by the libgudev package (systemd case) or by the udev
> implementation itself (eudev case).

Thanks for the detailed explanation.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
