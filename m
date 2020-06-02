From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 2 Jun 2020 22:24:29 +0200
Subject: [Buildroot] [PATCH] package/libqmi: bump to 1.25.900
In-Reply-To: <20200602122146.9480-1-matthew.weber@rockwellcollins.com>
References: <20200602122146.9480-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200602222429.220a7e29@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  2 Jun 2020 07:21:46 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> During the configure of the updated version there was a dependency
> found on zlib and it tried to retrieve the archive.
> 
>  Library z found: NO
>  Downloading zlib source from https://zlib.net/fossils/zlib-1.2.11.tar.gz
>  output/build/libglib2-2.64.2/meson.build:1885:4: ERROR: could not get

I don't see anything in the libqmi configure.ac script that suggests a
dependency on zlib. And these messages come from the Meson logic in
libglib2... while libqmi uses autotools. This definitely needs more
research to see what is going on, we can't blindly add a new dependency.

> -LIBQMI_VERSION = 1.24.10
> +LIBQMI_VERSION = 1.25.900

This version is in fact 1.26-rc1, I'm not sure we want to package
release candidate versions.

Also, this version has added gobject introspection support, so it
should either be explicitly disabled by passing the appropriate
configure option, or some conditional logic should be added to enable
gobject introspection support when available.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
