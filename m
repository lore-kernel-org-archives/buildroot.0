From: Qais Yousef <Qais.Yousef@imgtec.com>
Date: Wed, 21 Mar 2012 10:49:11 +0000
Subject: [Buildroot] [BUILDROOT][PATCH] Add bellagio package
In-Reply-To: <20120321001332.6112cb72@skate>
References: <0D107966AF6D79418315B7C5549F4B51032EEA04@lemail1.le.imgtec.org>
 <20120321001332.6112cb72@skate>
Message-ID: <0D107966AF6D79418315B7C5549F4B51032EEA49@lemail1.le.imgtec.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for your response. I'll take your comments into account and repost :)

Cheers,
Qais

> -----Original Message-----
> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Sent: 20 March 2012 23:14
> To: Qais Yousef
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] [BUILDROOT][PATCH] Add bellagio package
> 
> Hello Qais,
> 
> Thanks for your contribution. See my comments below.
> 
> Le Tue, 20 Mar 2012 17:04:02 +0000,
> Qais Yousef <Qais.Yousef@imgtec.com> a ?crit :
> 
> > Attached patch adds Bellagio package. Copy pasted below also for
> > convenience.
> 
> Your patch is completely word-wrapped, and therefore cannot be applied.
> Of course, you have sent it as an attachment as well, but it would be much
> better if it could be sent inline without being word-wrapped. I'd recommend
> using "git send-email" to do this, since it ensures that your patch will be sent
> correctly.
> 
> See http://elinux.org/Buildroot_how_to_contribute for a basic introduction
> to Git for Buildroot contribution.
> 
> 
> > diff --git a/package/multimedia/bellagio/Config.in
> > b/package/multimedia/bellagio/Config.in
> > new file mode 100644
> > index 0000000..21998e9
> > --- /dev/null
> > +++ b/package/multimedia/bellagio/Config.in
> > @@ -0,0 +1,6 @@
> > +config BR2_PACKAGE_BELLAGIO
> > +	bool "bellagio"
> > +	help
> > +	  Bellagio is an opensource implementation of the OpenMAX IL
> > API.
> 
> The help text should be wrapped at ~80 columns.
> 
> > +
> > +	  http://omxil.sourceforge.net/
> > diff --git
> > a/package/multimedia/bellagio/bellagio-0.9.3-segfault-on-
> removeFromWai
> > tR
> > esource.patch
> > b/package/multimedia/bellagio/bellagio-0.9.3-segfault-on-
> removeFromWai
> > tR
> > esource.patch
> > new file mode 100644
> > index 0000000..0716eeb
> > --- /dev/null
> > +++
> > b/package/multimedia/bellagio/bellagio-0.9.3-segfault-on-
> removeFromWai
> > tR
> > esource.patch
> > @@ -0,0 +1,32 @@
> 
> Your patch bellagio-0.9.3-segfault-on-removeFromWaitResource.patch must
> include a description + a Signed-off-by line indicating that you are the author
> of the patch.
> 
> > +++ b/package/multimedia/bellagio/bellagio.mk
> > @@ -0,0 +1,11 @@
> >
> +#########################################################
> ####
> > +#
> > +# bellagio
> > +#
> >
> +#########################################################
> ####
> > +BELLAGIO_VERSION = 0.9.3
> > +BELLAGIO_SOURCE = libomxil-bellagio-$(BELLAGIO_VERSION).tar.gz
> > +BELLAGIO_SITE =
> >
> http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/om
> xil
> > +BELLAGIO_INSTALL_STAGING = YES
> > +
> > +$(eval $(call AUTOTARGETS))
> 
> This looks good.
> 
> Maybe you could expand a bit the description of the package in the help
> text, to explain in what contexts this package is useful.
> 
> Can you repost an updated version with those improvements?
> 
> Thanks!
> 
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux development, consulting,
> training and support.
> http://free-electrons.com
