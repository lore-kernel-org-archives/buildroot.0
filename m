From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 16 Nov 2016 16:00:15 +0200
Subject: [Buildroot] [PATCH] package/e2fsprogs: backport build fix for
 rhel5 due to missing magic
In-Reply-To: <20161116131231.20069c38@free-electrons.com>
References: <1478677142-11627-1-git-send-email-jcmvbkbc@gmail.com>
 <20161116131231.20069c38@free-electrons.com>
Message-ID: <20161116140015.iscxr2td723pgyly@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Nov 16, 2016 at 01:12:31PM +0100, Thomas Petazzoni wrote:
> On Tue,  8 Nov 2016 23:39:02 -0800, Max Filippov wrote:
> > RHEL 5.x does have magic.h, but it does not define all expected symbols. In
> > particular, the NO_CHECK symbols were only added in file 4.20 and RHEL 5.x
> > is using 4.17.
> > 
> > Add substitute defines to allow continued usage of magic but without the
> > requested exclude checks.
> > 
> > Backported from: b003b2e6f9e54e7b2bde15828b97f5dc285b915e
> > 
> > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> 
> Can you try:
> 
> E2FSPROGS_CONF_ENV += \
> 	ac_cv_header_magic_h=no \
>   	ac_cv_lib_magic_magic_file=no
> 
> instead of this patch?

Do you mean HOST_E2FSPROGS_CONF_ENV?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
