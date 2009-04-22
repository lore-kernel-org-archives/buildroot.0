From: Steffen Schulz <pepe_ml@gmx.net>
Date: Wed, 22 Apr 2009 15:17:20 +0200
Subject: [Buildroot] [PATCH] Add host-libglib2 dependencie to dbus-glib
In-Reply-To: <1240404749.7072.1.camel@sven>
References: <49CB469A.5080404@eclis.ch> <20090422124829.GA28316@cbg.dyndns.org>
	<1240404749.7072.1.camel@sven>
Message-ID: <20090422131720.GA29962@cbg.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 090422 at 15:00, Sven Neumann wrote:
> On Wed, 2009-04-22 at 14:48 +0200, Steffen Schulz wrote:
> 
> > I just had the same problem when trying to compile trunk for i686.
> > However, after applying the fix I got an error about missing '-lexpat'.
> > Adding expat to the dependencies fixed that.
> 
> There is expat in the dependencies already:
> 
> ifeq ($(BR2_DBUS_EXPAT),y)
> DBUS_CONF_OPT += --with-xml=expat
> DBUS_DEPENDENCIES += expat
> else
> DBUS_CONF_OPT += --with-xml=libxml
> DBUS_DEPENDENCIES += libxml2
> endif

Ah...but this is in dbus.mk, not dbus-glib.mk which gives the error.

Anyway, hal also fails to compile so I will skip the dbus stuff..
