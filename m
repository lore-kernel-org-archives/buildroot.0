From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Mar 2016 21:25:53 +0100
Subject: [Buildroot] [PATCH] pkgconf: Add a symlink to the
 GNU_TARGET_NAME-pkg-config
In-Reply-To: <1456770170-6326-1-git-send-email-jer@airfi.aero>
References: <1456770170-6326-1-git-send-email-jer@airfi.aero>
Message-ID: <20160302212553.718456cf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeroen Roovers,

On Mon, 29 Feb 2016 19:22:50 +0100, Jeroen Roovers wrote:
>  Lots of packages start to call pkg-config "properly" and run into
>  failures like this:
> 
> *
> * System Logging Utilities
> *
> syslogd (SYSLOGD) [N/y/?] n
> klogd (KLOGD) [N/y/?] n
> logger (LOGGER) [Y/n/?] y
> make[2]: .../output/host/usr/bin/arm-buildroot-linux-gnueabihf-pkg-config: Command not found
> make[2]: .../output/host/usr/bin/arm-buildroot-linux-gnueabihf-pkg-config: Command not found
> make[1]: Leaving directory '.../output/build/busybox-1.24.1'

I think we should solve this specific problem by passing the PKG_CONFIG
in the Busybox environment.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
