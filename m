From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 12:01:26 +0200
Subject: [Buildroot] meson for host package with executables doesn't
 work.
In-Reply-To: <CAFr9PXm1Y=HHy4znDBVdxpd2ndHKdu+_unfgSGHkJFotSZ9HKA@mail.gmail.com>
References: <CAFr9PXm1Y=HHy4znDBVdxpd2ndHKdu+_unfgSGHkJFotSZ9HKA@mail.gmail.com>
Message-ID: <20181011120126.4bb50328@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Daniel,

On Thu, 11 Oct 2018 18:25:39 +0900, Daniel Palmer wrote:

> That was working fine a few months ago but now I get this:
> 
> ***
> *** ERROR: package host-json-glib installs executables without proper RPATH:
> ***   <snip>/buildroot-firmware/output/host/bin/json-glib-validate
> ***   <snip>/buildroot-firmware/output/host/bin/json-glib-format
> 
> As far as I know meson strips RPATH on install and there is no way to
> stop it doing that outside of adjusting the build file.
> 
> Does anyone have any ideas about how this should be fixed?

We really need the host tools to have an rpath pointing to
$(HOST_DIR)/lib, otherwise they won't pick up the libraries that we
have installed in $(HOST_DIR)/lib.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
