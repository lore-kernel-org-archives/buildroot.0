From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 22:07:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/rdesktop: use --with-sound
 option
In-Reply-To: <20200314223641.2552635-1-fontaine.fabrice@gmail.com>
References: <20200314223641.2552635-1-fontaine.fabrice@gmail.com>
Message-ID: <20200315220704.4d588598@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sat, 14 Mar 2020 23:36:41 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use --with-sound option as requested by Thomas Petazzoni in review of
> https://patchwork.ozlabs.org/patch/1254693
> 
> alsa, libao and pulseaudio are not exclusive, the order of registrations
> in rdpsnd_register_drivers define the probe-order when opening the
> device for the first time

But if you pass a single --with-sound=foo, don't they become mutually
exclusive ? Does the configure script properly handles --with-sound=foo
--with-sound=bar, and understands it should enable both support for
"foo" and "bar" ? I think a normal configure script would only keep
"bar" in such a circumstance.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
