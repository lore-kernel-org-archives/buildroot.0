From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 14 Aug 2020 21:37:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/avahi: fix building against
 gobject-introspection
In-Reply-To: <CAFSsvmqhCPXYn9A8pXOy5bi2h35KJZ92r-EWms9Ra7yG2HW=xA@mail.gmail.com>
References: <20200813232351.1552307-1-aduskett@gmail.com>
 <20200814133934.26a33b17@windsurf.home>
 <CAFSsvmqhCPXYn9A8pXOy5bi2h35KJZ92r-EWms9Ra7yG2HW=xA@mail.gmail.com>
Message-ID: <20200814213721.62d58c25@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 Aug 2020 12:27:46 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> > This really isn't very neat. Isn't there a better solution?
> >  
> Maybe? But that's why the GIR_EXTRA_LABS_PATH macro exists, is for
> situations just like this.

It seems absolutely awful that within the build of a package this kind
of variable is needed. If it was to point to libraries installed by
other packages, why not. But here, the package build system itself is
not capable of finding its own libraries?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
