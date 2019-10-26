From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Sat, 26 Oct 2019 19:15:33 +0000
Subject: [Buildroot] [PATCH 1/2] package/bmap-tools: new package
In-Reply-To: <20191026193050.16ecf3dc@windsurf.home>
References: <20191026144101.30599-1-nicolas.carrier@orolia.com>
 <20191026193050.16ecf3dc@windsurf.home>
Message-ID: <02f5119a6b82424f4a639427cd68db9f4a7f0546.camel@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 2019-10-26 at 19:30 +0200, Thomas Petazzoni wrote:
> ...
> 
> Do you really need setuptools on the target? This seems odd.
> 

Apparently yes, otherwise I have this failure when running the test:
Traceback (most recent call last):
  File "/usr/bin/bmaptool", line 6, in <module>
    from pkg_resources import load_entry_point
ModuleNotFoundError: No module named 'pkg_resources'

And a bit of searching on SO showed that having setuptools was the
missing package.

> 
> > +BMAP_TOOLS_VERSION = v3.5
> 
> The "v" should be in BMAP_TOOLS_SITE, not BMAP_TOOLS_VERSION.

Ok, will fix in v3.

> 
> > +BMAP_TOOLS_SITE = $(call github,intel,bmap-
> > tools,$(BMAP_TOOLS_VERSION))
> > +BMAP_TOOLS_LICENSE = GPLv2
> 
> Should be GPL-2.0

Ok, will fix in v3.

> 
> > +BMAP_TOOLS_LICENSE_FILES = COPYING
> > +BMAP_TOOLS_SETUP_TYPE = setuptools
> > +BMAP_TOOLS_DEPENDENCIES = \
> > +     python-setuptools
> 
> Why do you need python-setuptools on the target, and be a build time
> dependency ? BMAP_TOOLS_SETUP_TYPE = setuptools already says that
> this
> package needs setuptools on the host for its build/installation.

As said before, it appears to be a runtime dependency too.

> 
> Thanks,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> ATTENTION: This email came from an external source.
> Do not open attachments or click on links from unknown senders or
> unexpected emails.
