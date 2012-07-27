From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jul 2012 08:34:53 +0200
Subject: [Buildroot] [PATCH] sconeserver: new package
In-Reply-To: <CAHXCMMLwWEA-eyQ9GZpa0L2o2QgxAE38W64LgDBfTRHD5iP45g@mail.gmail.com>
References: <1343051342-12829-1-git-send-email-spdawson@gmail.com>
 <50117709.8060209@mind.be>
 <CAHXCMMLwWEA-eyQ9GZpa0L2o2QgxAE38W64LgDBfTRHD5iP45g@mail.gmail.com>
Message-ID: <20120727083453.7be325d8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 27 Jul 2012 01:14:43 +0200,
Samuel Martin <s.martin49@gmail.com> a ?crit :

> Since the ssl option (like most of of the following ones) has effect
> on both SCONESERVER_DEPENDENCIES and SCONESERVER_CONF_OPT,
> I would prefer to see them nested in the same if[n]eq statement:
> 
> ifneq ($(BR2_PACKAGE_SCONESERVER_SSL),)
> SCONESERVER_CONF_OPT += --with-ssl
> SCONESERVER_DEPENDENCIES += openssl
> else
> SCONESERVER_CONF_OPT += --without-ssl
> endif
> 
> IMO, this makes things easier to maintain.

I agree. It's a bit longer from a number of lines perspective, but it's
much more logical, IMO.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
