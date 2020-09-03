From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 21:49:41 +0200
Subject: [Buildroot] [RESEND PATCH v3 1/1] package/iputils: add configs
 to select which binaries are built
In-Reply-To: <4e8f64ec-1797-a418-79d7-701380a767db@gmail.com>
References: <20190829191722.18761-1-alejandro.gonzalez.correo@gmail.com>
 <4e8f64ec-1797-a418-79d7-701380a767db@gmail.com>
Message-ID: <20200903214941.536f6956@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 15 Sep 2019 12:05:46 +0200
Alejandro Gonz?lez <alejandro.gonzalez.correo@gmail.com> wrote:

> By default, the iputils build script might build binaries which are
> useless for certain applications, like tftpd or ninfod. Those binaries
> will add to the target filesystem size unless a post-build script removes
> them manually, which is cumbersome and doesn't shorten build times.
> 
> In particular, in a certain aarch64 Buildroot project with musl selected
> as a C library, this patch allowed to shrink the full iputils package from
> 219 KiB (if every option is selected) to 63 KiB (with only the ping
> binary selected) - a 71.2% relative size decrease.
> 
> Moreover, upstream recently introduced a commit that disabled tftpd from
> building by default, like rarpd. In the current state of things, this change
> will introduce inconveniences for Buildroot users which prefer to use the
> tftpd implementation provided by this package. With this patch, however, that
> decision and similar future ones won't be a concern, because they will
> have complete control of what binaries are built.
> 
> These changes add Kconfig options which let the user select what
> binaries are built with ease.
> 
> Signed-off-by: Alejandro Gonz?lez <alejandro.gonzalez.correo@gmail.com>
> ---
> Changes v2 -> v3:
> 	- Several style revisions (suggested by Arnout)
> 	- Simplify ninfod crypto dependencies logic (suggested by
> 	  Arnout)
> 	- Better explain the rationale for this patch in the commit
> 	  message

I have finally applied to master. The ninfod situation is now simpler
because iputils no longer needs any external crypto library.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
