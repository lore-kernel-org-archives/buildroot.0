From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 May 2020 07:19:10 +0200
Subject: [Buildroot] [PATCH 2/5] package/gssdp: add optional dependency
 for gobject-introspection
In-Reply-To: <20200315172459.881615-2-aduskett@gmail.com>
References: <20200315172459.881615-1-aduskett@gmail.com>
 <20200315172459.881615-2-aduskett@gmail.com>
Message-ID: <20200511071910.74806b2a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 15 Mar 2020 10:24:55 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> If gobject-introspection is selected, explicitly set -Dintrospection=true in
> the configure options and add a dependency for gobject-introspection.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

The build of gssdp is broken with introspection support:

  /bin/sh: 1: /home/buildroot/autobuild/instance-2/output-1/host/bin/../nios2-buildroot-linux-gnu/sysroot/home/buildroot/autobuild/instance-2/output-1/host/bin/g-ir-scanner: not found

Could you have a look ?

I am wondering if this couldn't be a fallout of the recent changes in
the pkg-config Meson logic.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
