From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 30 Jul 2015 21:58:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/minidlna: More fixes to static
 compile
In-Reply-To: <1438203871-8548-1-git-send-email-bernd.kuhls@t-online.de>
References: <1438203871-8548-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1438286327.21638.6.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mi, 2015-07-29 at 23:04 +0200, Bernd Kuhls wrote:
> libz is needed by libid3tag, fixes
> http://autobuild.buildroot.net/results/85e/85e53f2b30f107f486be08549c
> e6df08953ea499/
> 
> libm is needed by libexif, changes
> 
> checking for exif_data_new_from_file in -lexif... no
> checking for exif_data_new_from_file in -lexif... no
> 
> from the forementioned autobuilder config.log to
> 
> checking for exif_data_new_from_file in -lexif... yes
> 
> The pkgconfig file of libvorbis is called vorbis.pc, fix wrong 
> naming. Also
> we need to link against libsqlite3, so add that lib to the pkgconf 
> call.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

minidlna successfully compiles in a static build after applying the
patch. Tested with the config file from the autobuilder.

Tested-by: J?rg Krause <joerg.krause@embedded.rocks>
