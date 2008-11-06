From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Nov 2008 23:20:35 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE1909C92102@mi8nycmail19.Mi8.com>
References: <20081106125430.01B343C758@busybox.net>
	<BD79186B4FD85F4B8E60E381CAEE1909C92005@mi8nycmail19.Mi8.com>
	<COL102-DS184854396C0DF2D8C3CCEFDC1E0@phx.gbl>
	<BD79186B4FD85F4B8E60E381CAEE1909C92102@mi8nycmail19.Mi8.com>
Message-ID: <20081106232035.79e50f94@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 6 Nov 2008 13:11:01 -0500,
"hartleys" <hartleys@visionengravers.com> a ?crit :

>   LD [M]  drivers/scsi/scsi_wait_scan.ko
> /usr/local/arm/4.1.1-920t/bin/arm-linux-ld: unrecognized option
> '-Wl,--rpath-link'
> /usr/local/arm/4.1.1-920t/bin/arm-linux-ld: use the --help option for
> usage information

Hum. -Wl,--rpath-link is supposed to be passed to the C compiler, the
-Wl prefix telling the compiler to pass the option to the linker. But
here -Wl,--rpath-link is passed to the linker directly, which obviously
doesn't work. (See
http://lists.openmoko.org/pipermail/openmoko-kernel/2008-May/002772.html
for people having the same kind of issue).

*However*, I'm not sure having -Wl,--rpath-link when building the
kernel is necessary. But because the kernel Makefile does
LDFLAGS="$(TARGET_LDFLAGS)", and the TARGET_LDFLAGS variable is
modified by Daniel's patch, that's why you hit this problem now.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
