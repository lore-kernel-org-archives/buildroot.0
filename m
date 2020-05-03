From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 3 May 2020 21:45:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/gobject-introspection: fix host
 version of .pc file for wrapper
In-Reply-To: <7340e836-134f-a02f-9b3a-528c322517d8@green-communications.fr>
References: <20200502060435.23004-1-james.hilliard1@gmail.com>
 <20200502143243.4e2b3ef3@windsurf.home>
 <CADvTj4oM52ZaAVbC3pUjTPf5ezKj36SF76Udz1c7uBsryXMdRw@mail.gmail.com>
 <20200503134807.4e709fe4@windsurf.home>
 <7340e836-134f-a02f-9b3a-528c322517d8@green-communications.fr>
Message-ID: <20200503214545.71eaf817@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 3 May 2020 19:10:36 +0200
Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:

> > Since Meson goes through $(HOST_DIR)/bin/pkgconf directly, we do not
> > pass any specific sysroot argument to pkg-config. It is up to Meson to
> > pass the appropriate sysroot value when working with target code, and
> > to not pass any sysroot value when working on native code.  
> 
> Look at the logs i posted in this thread. meson uses the 'pkgconfig' in
> the cross-file only when finding target libraries. It does not use it
> when finding native libraries.
> 
> Instead, for native libraries, it expects a native-file, which we don't
> provide. As a fallback, it searches for $PKG_CONFIG_FOR_BUILD,
> $PKG_CONFIG, or for a 'pkg-config' in $PATH. And we have a pkg-config in
> $PATH, it is the target pkgconf wrapper.
> 
> The fix in 4e0bc29993376613d200e892d491e31ea5a49622 does not work.
> Meson still uses the pkg-config wrapper when working with native code.

Indeed, all what you explain here seems to contradict exactly what
4e0bc29993376613d200e892d491e31ea5a49622 claims. Arnout, do you have
the time to discuss this with us ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
