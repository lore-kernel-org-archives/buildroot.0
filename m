From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jan 2016 22:05:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/alsa-utils: Add util alsaloop
In-Reply-To: <1453064452-31266-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453064452-31266-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160118220522.46378557@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sun, 17 Jan 2016 22:00:52 +0100, Bernd Kuhls wrote:

> +config BR2_PACKAGE_ALSA_UTILS_ALSALOOP
> +	bool "alsaloop"
> +	select BR2_PACKAGE_LIBSAMPLERATE

libsamplerate is not mandatory to build alsaloop it seems:

thomas at skate:~/projets/buildroot (master)$ readelf -d output/build/alsa-utils-1.1.0/alsaloop/alsaloop| grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libm.so.1]
 0x00000001 (NEEDED)                     Shared library: [libasound.so.2]
 0x00000001 (NEEDED)                     Shared library: [libdl.so.1]
 0x00000001 (NEEDED)                     Shared library: [libpthread.so.1]
 0x00000001 (NEEDED)                     Shared library: [libintl.so.8]
 0x00000001 (NEEDED)                     Shared library: [libgcc_s.so.1]
 0x00000001 (NEEDED)                     Shared library: [libc.so.1]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
