From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Apr 2020 22:38:45 +0200
Subject: [Buildroot] [PATCH v3 7/7] package/gupnp-dlna: add optional
 dependency for gobject-introspection
In-Reply-To: <20200329204251.GP22325@scaer>
References: <20200327183000.1005676-1-aduskett@gmail.com>
 <20200327183000.1005676-7-aduskett@gmail.com>
 <20200329204251.GP22325@scaer>
Message-ID: <20200406223845.1a542ed2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Mar 2020 22:42:51 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> So, vala is _not_ needed to build with introspection.

Right, totally correct. HAVE_INTROSPECTION is used in
libgupnp-dlna/Makefile.am and vala/Makefile.am. In the former case,
Vala support is not needed.

> As such, we have three options:
> 
> 1. Forcibly bring a dependency ti host-vala and build vala bindings,
>    like Adam did;
> 
> 2. Add an option to gupnp-dlna to build vala bindings;

I would prefer this solution, but there may not even be a need to add
an option: there is an AC_PATH_PROG check for vapigen, so probably we
can feed some stupid autoconf cache variable to make sure vapigen is
not detected, even if available.

> 3. Add a vala/Config.in/host to manually enable vala, and thus
>    automatically build the vala bindings.

I would really prefer to handle the whole Vala binding thing once
someone really needs to do Vala stuff with gupnp-dlna.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
