From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jan 2014 20:16:23 +0100
Subject: [Buildroot] [PATCH v2 1/1] minidlna: bump version to 1.1.1
In-Reply-To: <BLU0-SMTP129F833EB3F5406F1F8364ED9CB0@phx.gbl>
References: <BLU0-SMTP129F833EB3F5406F1F8364ED9CB0@phx.gbl>
Message-ID: <20140103201623.62d364f3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Thu, 2 Jan 2014 20:44:22 +0100, Bernd Kuhls wrote:
> - remove all patches needed for pre-autotools minidlna release
> - convert .mk file to autotools-package
> - disable broken static build

If static build is broken, then the package should depends
on !BR2_PREFER_STATIC_LIB. See other packages doing that.

You would still have to keep --disable-static however, because a shared
library build is currently passing both --enable-shared and
--enable-static. Please add a comment above the --disable-static
addition that explains why it is done.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
