From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 16:28:30 +0200
Subject: [Buildroot] [PATCH v1 1/6] package/nvidia-modprobe: new package
In-Reply-To: <CA+h8R2qhP00=MNrQHC88ZG5mE0qCCaDP1MRvS7fHipdE40M6XA@mail.gmail.com>
References: <20200801213645.33787-1-christian@paral.in>
 <CALFsTFUsbwJohwJ4wRtd=jkyd=86jTtukirXW0pFHrHhx5NpwQ@mail.gmail.com>
 <CA+h8R2qhP00=MNrQHC88ZG5mE0qCCaDP1MRvS7fHipdE40M6XA@mail.gmail.com>
Message-ID: <20200808162830.5ffdd6c1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 8 Aug 2020 04:29:43 -0700
Christian Stewart <christian@paral.in> wrote:

> > Maybe I miss something?  
> 
> You tested this?... I don't think so. It doesn't work:
> 
>    LINK         _out/Linux_x86_64/nvidia-modprobe.unstripped
> /bin/sh: build/nvidia-modprobe-450.57/_out/Linux_x86_64/gen-manpage-opts:
> cannot execute binary file: Exec format error
> make[2]: *** [Makefile:149: _out/Linux_x86_64/options.1.inc] Error 126
> 
> The package as-is from GitHub has an extremely convoluted Makefile
> which does not do what we want in Buildroot.

The Makefile is not that convoluted, and we definitely want to use it.
The above error is due to the fact that the gen-manpage-opts tool needs
to be built for the host.

Two solutions:

 - Set HOST_CC and other variables properly when building.

 - Don't build the manpage, which should be doable by calling the
   appropriate make target.

Also, you have host-pkgconf as a dependency, and it doesn't seem to be
needed.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
