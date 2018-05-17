From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 May 2018 10:13:34 +0200
Subject: [Buildroot] [PATCH] libgpiod: bump version to v1.1
In-Reply-To: <CAMRc=Mf4ZEqxxFPLdJF5P1JGUohTZrxcfGHVxmSTZR2FBTK_Rg@mail.gmail.com>
References: <20180516135856.29408-1-brgl@bgdev.pl>
 <0ff358a9-2d87-b5cb-e1ac-be7294751618@mind.be>
 <CAMRc=MfkUTd5Fz0ABqdwfdN5Au+YTY6GuV2YQqz6cDf8=S9eqQ@mail.gmail.com>
 <20180517072046.wuwor6uyf2tajtca@tarshish>
 <CAMRc=Mf4ZEqxxFPLdJF5P1JGUohTZrxcfGHVxmSTZR2FBTK_Rg@mail.gmail.com>
Message-ID: <20180517101334.2eb4331c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 May 2018 10:10:54 +0200, Bartosz Golaszewski wrote:

> > You don't need to. You can make BR2_INSTALL_LIBSTDCPP an optional dependency.
> > If it is defined, install the C++ binding. Same goes for Python. That is what
> > Arnout suggests.
> >  
> 
> I'm afraid I don't understand. Could you maybe point me to some example?

ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
... enable the build/installation of C++ bindings
endif

ifeq ($(BR2_PACKAGE_PYTHON),y)
... enable the build/istallation of Python bindings
endif

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
