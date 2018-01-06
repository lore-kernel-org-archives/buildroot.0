From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Sat, 6 Jan 2018 21:32:35 +0100
Subject: [Buildroot] [PATCH 1/2] nilfs-utils: need NPTL threads
In-Reply-To: <20180106153518.2fa78e98@windsurf>
References: <1515060652-22472-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <20180106153518.2fa78e98@windsurf>
Message-ID: <20180106203235.GB10338@airbook.vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hello,
> 
> On Thu,  4 Jan 2018 11:10:51 +0100, Kurt Van Dijck wrote:
> > nilfs-utils use clock_nanosleep(), which comes with NPTL threads
> > 
> > Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
> > ---
> >  package/nilfs-utils/Config.in | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/package/nilfs-utils/Config.in b/package/nilfs-utils/Config.in
> > index 0c6b7a0..9dda27c 100644
> > --- a/package/nilfs-utils/Config.in
> > +++ b/package/nilfs-utils/Config.in
> > @@ -1,6 +1,7 @@
> >  config BR2_PACKAGE_NILFS_UTILS
> >  	bool "nilfs-utils"
> >  	depends on BR2_TOOLCHAIN_HAS_THREADS # sem_open()
> > +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
> >  	depends on BR2_USE_MMU # util-linux libmount, libblkid
> >  	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> >  	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> 
> You forgot to update the Config.in comment accordingly. Also, I've
> updated the commit log to summarize why we keep both the threads *and*
> NPTL dependencies, even though it might look redundant.
> 
> Applied with those changes. Thanks!

Only now, after having seen the commit, I realise you all meant the
'comment' section below, and not the '# clock_nanosleep()' comment :-)

Thanks,
Kurt
