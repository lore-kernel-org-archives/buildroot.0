From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jul 2012 08:45:03 +0200
Subject: [Buildroot] [PATCH] sconeserver: new package
In-Reply-To: <50117709.8060209@mind.be>
References: <1343051342-12829-1-git-send-email-spdawson@gmail.com>
 <50117709.8060209@mind.be>
Message-ID: <20120727084503.045fbb14@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 26 Jul 2012 18:57:45 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

> > +	help
> > +	  Example modules for SconeServer
> > +
> > +config BR2_PACKAGE_SCONESERVER_SSL
> > +	bool "ssl"
> > +	default y
> 
>   Why does this default to y?
> 
>   Maybe you want
> default y if BR2_PACKAGE_OPENSSL
> 
>   however, I think that conflicts with the select statement below...

Also in general we don't have sub-options for things that depend on
packages: the package automatically enables the feature if the required
dependency is available.

I have the same problem with the VLC package currently being proposed
by Ismael: it has a huge number of sub-options, for each potential
dependency that the package might use.

On one hand having all these sub-options is a bit annoying, but:

 (*) It allows to have sub-options for things that depend on other
     libraries, but also for things that don't have dependencies.
     Otherwise, it's a bit strange: for --enable/--disable flags that
     don't require dependencies, we have a kconfig option, but for
     --enable/--disable flags that require dependencies, they get
     automatically enabled when the required dependency is available.

 (*) You may want to have SSL support in one component of your system,
     but not necessarily others.

Thoughts?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
