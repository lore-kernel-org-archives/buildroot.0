From: Alexandre Belloni <alexandre.belloni@piout.net>
Date: Tue, 5 Feb 2013 21:41:30 +0100
Subject: [Buildroot] [PATCH 2/2] Add HW decoding support for Hantro x170
In-Reply-To: <20130204235109.5d1b85f7@skate>
References: <1360016773-8691-1-git-send-email-alexandre.belloni@piout.net>
 <1360016773-8691-2-git-send-email-alexandre.belloni@piout.net>
 <20130204235109.5d1b85f7@skate>
Message-ID: <20130205204129.GA24385@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Feb 04, 2013 at 11:51:09PM +0100, Thomas Petazzoni wrote :
> > +
> > +GST_PLUGIN_X170_AUTORECONF = YES
> > +GST_PLUGIN_X170_AUTORECONF_OPT = -Im4/
> 
> Please add a justification here in a short comment before the
> _AUTORECONF option to explain why it's needed. Normally, it's not
> needed for tarballs when no patches are applied, so we try to give a
> short justification through a comment.
> 

There is no configure script in the archive so you basically have to run
autoreconf to be able to build.

> > +GST_PLUGIN_X170_DEPENDENCIES = gstreamer libglib2 on2-8170-libs
> > +
> > +GST_PLUGIN_X170_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/glib-2.0 -I$(STAGING_DIR)/usr/lib/glib-2.0/include -I$(STAGING_DIR)/usr/include/gstreamer-0.10 -I$(STAGING_DIR)/usr/include/libxml2/"
> 
> Isn't the configure script capable it detecting those libraries? What
> fails if you don't add all those -I values?
> 

The configure script itself seems to be able to find the includes
correctly but the include path is limited to . and .. when compiling so
I had to force the -I at configure.

It may be related to the way I'm using autoreconf. I think that package
is expectig you to use gst-autogen.sh to do that but I could'nt get that
to work.

-- 
Alexandre Belloni
