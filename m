From: mlweber1 at rockwellcollins.com <mlweber1@rockwellcollins.com>
Date: Mon, 31 Mar 2014 08:01:55 -0500
Subject: [Buildroot] [PATCH v3] pyrex: new package
In-Reply-To: <20140329120325.0faa54ca@skate>
References: <1394920830-12708-1-git-send-email-mlweber1@rockwellcollins.com>
 <20140329120325.0faa54ca@skate>
Message-ID: <OFD28A640B.B4ECD9E6-ON86257CAC.00475E17-86257CAC.00479660@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 03/29/2014 
06:03:25 AM:

> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: mlweber1 at rockwellcollins.com
> Cc: buildroot at busybox.net
> Date: 03/29/2014 06:03 AM
> Subject: Re: [Buildroot] [PATCH v3] pyrex: new package
> 
> Matt,
> 
> On Sat, 15 Mar 2014 17:00:30 -0500, mlweber1 at rockwellcollins.com wrote:
> 
> > diff --git a/package/python-pyrex/Config.in.host b/package/python-
> pyrex/Config.in.host
> > new file mode 100644
> > index 0000000..4edeb38
> > --- /dev/null
> > +++ b/package/python-pyrex/Config.in.host
> > @@ -0,0 +1,10 @@
> > +config BR2_PACKAGE_HOST_PYTHON_PYREX
> > +   bool "python-pyrex"
> > +   depends on BR2_PACKAGE_PYTHON
> 
> Is it actually really needed to have this host package visible in
> menuconfig? python-pyrex is really a tool to generate code, so it
> should be used by other packages as a dependency, and does not
> necessarily need to be exposed in menuconfig.
> 
> To me, host-python-pyrex is a little bit like host-bison or host-flex:
> useful as a dependency of another package, but not really useful as a
> visible host package in menuconfig.
> 
> Would you agree if I removed this option when applying your patch?
Yeah that makes sense.  I'll update the patch set.

Thanks for the feedback!
Matt
