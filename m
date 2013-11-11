From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 11 Nov 2013 12:01:50 +0200
Subject: [Buildroot] [PATCH] iozone: disable for uClibc 0.9.31
In-Reply-To: <87siv36z7u.fsf@dell.be.48ers.dk>
References: <1384163348-17932-1-git-send-email-spdawson@gmail.com>
 <87siv36z7u.fsf@dell.be.48ers.dk>
Message-ID: <20131111100150.GN4581@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, Simon,

On Mon, Nov 11, 2013 at 10:53:57AM +0100, Peter Korsgaard wrote:
> >>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:
> 
> > From: Simon Dawson <spdawson@gmail.com>
> > uClibc 0.9.31.x does not include the pthread_setaffinity_np GNU extension.
> 
> > Fixes build failures such as the following.
> 
> >   http://autobuild.buildroot.net/results/e21526c0c18733310d3fb322d79d5fff3a71af51/
> 
> > Signed-off-by: Simon Dawson <spdawson@gmail.com>
> > ---
> >  package/iozone/Config.in | 1 +
> >  1 file changed, 1 insertion(+)
> 
> > diff --git a/package/iozone/Config.in b/package/iozone/Config.in
> > index 26d4daa..33e12ca 100644
> > --- a/package/iozone/Config.in
> > +++ b/package/iozone/Config.in
> > @@ -1,6 +1,7 @@
> >  config BR2_PACKAGE_IOZONE
> >  	bool "iozone"
> >  	depends on BR2_USE_MMU # fork()
> > +	depends on !BR2_UCLIBC_VERSION_0_9_31 # no pthread_setaffinity_np
> 
> Committed, thanks. It sounds like it also needs to depend on
> BR2_TOOLCHAIN_HAS_THREADS. Care to send a patch adding that dependency
> and a comment line?

It also depends on BR2_PTHREADS_NATIVE. linuxthreads doesn't have 
pthread_setaffinity_np.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
