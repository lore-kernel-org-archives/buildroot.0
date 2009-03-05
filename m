From: Olaf Rempel <razzor@kopf-tisch.de>
Date: Thu, 5 Mar 2009 15:22:02 +0100
Subject: [Buildroot] Duplication and size of binaries in generated
 toolchain
In-Reply-To: <20090305151359.20b37039@surf>
References: <20090305151359.20b37039@surf>
Message-ID: <20090305152202.2c131b1b@bandomeer.europe.flane.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 5 Mar 2009 15:13:59 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hi,
> 
> After compiling a toolchain with Buildroot (no packages, no kernel, see
> attached configuration file), I end up with duplicated binaries in the
> STAGING_DIR.
> 
> For example, for the 'ar' binutil. The first copy is in :
> 
> $ ls -l usr/bin/arm-linux-uclibcgnueabi-ar 
> -rwxr-xr-x 2 thomas thomas 2500708 2009-03-05 14:19 usr/bin/arm-linux-uclibcgnueabi-ar
             ^
These files are hardlinked, so the data ist stored only once.

Regards
Olaf
