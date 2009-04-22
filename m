From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Wed, 22 Apr 2009 16:15:05 +0200
Subject: [Buildroot] [PATCH] Add host-libglib2 dependencie to dbus-glib
In-Reply-To: <1240404749.7072.1.camel@sven>
References: <49CB469A.5080404@eclis.ch> <20090422124829.GA28316@cbg.dyndns.org>
	<1240404749.7072.1.camel@sven>
Message-ID: <49EF2669.7010607@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sven Neumann a ?crit :
> Hi,
> 
> On Wed, 2009-04-22 at 14:48 +0200, Steffen Schulz wrote:
> 
>> I just had the same problem when trying to compile trunk for i686.
>> However, after applying the fix I got an error about missing '-lexpat'.
>> Adding expat to the dependencies fixed that.
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
> 
> We are using libxml2, so I can't tell for sure if compiling dbus with
> expat is working or not. But it looks as if the dependencies are
> correct.

Interesting. On ARM I can only build dbus with expat.

BR2_PACKAGE_DBUS=y
BR2_DBUS_EXPAT=y
# BR2_DBUS_LIBXML2 is not set
BR2_PACKAGE_DBUS_GLIB=y

Jean-Christian de Rivaz
