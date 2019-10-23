From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Oct 2019 22:50:38 +0200
Subject: [Buildroot] [PATCH v14 4/5] package/pkg-meson.mk: set Python
 sysconfigdata
In-Reply-To: <CAFSsvmowGKsba5LaD5S6xXbK0uL2kVYCvNbh9vN9-Mnu2=LFzA@mail.gmail.com>
References: <20191021200438.97453-1-aduskett@gmail.com>
 <20191021200438.97453-5-aduskett@gmail.com>
 <20191022225920.7e35e42e@windsurf>
 <b3699991-75ec-157a-0a4f-913a7a1d83f8@mind.be>
 <99a57ce9-4573-87c9-d978-f14e7fa00dba@mind.be>
 <CAFSsvmowGKsba5LaD5S6xXbK0uL2kVYCvNbh9vN9-Mnu2=LFzA@mail.gmail.com>
Message-ID: <20191023225038.55ee5c3e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 23 Oct 2019 13:42:54 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> >  Adam, could you test if this works better?
> >
> > +       $$(if
> > $$(BR2_PACKAGE_PYTHON3),_PYTHON_SYSCONFIGDATA_NAME="$$(PKG_PYTHON_SYSCONFIGDATA_NAME)")
> > \  
> $$(if $$(BR2_PACKAGE_PYTHON3),_PYTHON_SYSCONFIGDATA_NAME="$$(PKG_PYTHON_SYSCONFIGDATA_NAME),_sysconfigdata)"
> Also does not work, because the target python3 may not yet be built.

But that is totally unrelated to the _sysconfigdata "fallback" that I
was criticizing. The issue of "you're passing
_PYTHON_SYSCONFIG_DATA_NAME regardless of whether Python was built
before or not" was already present in your initial submission.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
