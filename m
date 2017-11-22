From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 22:28:58 +0100
Subject: [Buildroot] [NEXT 1/1] postgresql: bump to 10.1
In-Reply-To: <20171120144352.11599-1-aduskett@gmail.com>
References: <20171120144352.11599-1-aduskett@gmail.com>
Message-ID: <20171122222858.62ab3d5f@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

> - PostgreSQL 10.0 and above will default to checking for /dev/urandom if an
>   SSL library is not found, which will fail when cross compiling.
>   The workaround is to add --disable-strong-random to the configure options
>   if a SSL library not selected.

Since /dev/urandom is guaranteed to be provided on Linux systems, I
believe a better solution is to pass ac_cv_file__dev_urandom=yes in
POSTGRESQL_CONF_ENV, so that the PostgreSQL configure script knows
that /dev/urandom will be available on the target.

Could you test this instead?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
