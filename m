From: Sven Neumann <s.neumann@phase-zero.de>
Date: Wed, 22 Apr 2009 14:52:29 +0200
Subject: [Buildroot] [PATCH] Add host-libglib2 dependencie to dbus-glib
In-Reply-To: <20090422124829.GA28316@cbg.dyndns.org>
References: <49CB469A.5080404@eclis.ch> <20090422124829.GA28316@cbg.dyndns.org>
Message-ID: <1240404749.7072.1.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, 2009-04-22 at 14:48 +0200, Steffen Schulz wrote:

> I just had the same problem when trying to compile trunk for i686.
> However, after applying the fix I got an error about missing '-lexpat'.
> Adding expat to the dependencies fixed that.

There is expat in the dependencies already:

ifeq ($(BR2_DBUS_EXPAT),y)
DBUS_CONF_OPT += --with-xml=expat
DBUS_DEPENDENCIES += expat
else
DBUS_CONF_OPT += --with-xml=libxml
DBUS_DEPENDENCIES += libxml2
endif

We are using libxml2, so I can't tell for sure if compiling dbus with
expat is working or not. But it looks as if the dependencies are
correct.


Sven
