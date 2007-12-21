From: Tony Borras <tonyb@sysdev.org>
Date: Fri, 21 Dec 2007 11:03:54 -0800
Subject: [Buildroot] Changing uclibc runtime prefix
In-Reply-To: <200712211830.lBLIUfOI014955@orion.sysdev.org>
References: <14454607.post@talk.nabble.com>
	<200712211830.lBLIUfOI014955@orion.sysdev.org>
Message-ID: <20071221110354.3224a836.tonyb@sysdev.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 21 Dec 2007 10:30:41 -0800 (PST)
TonyB <tonyb@orion.sysdev.org> wrote:

> I'd like to install uClibc in /usr/i386-uclibc/*, and
> configure the cross-gcc and binutils to link against this
> library. I'm using buildroot to generate the toolchain only.
> 
> Problem is that I can't get buildroot to configure uclibc
> and gcc the way I want. My configuration
> 
> The problem is that all binaries compiled with this
> toolchain, are still expecting the ld library loader to be
> /lib/ld-uClibc.so.0, instead of
> /usr/i386-uclibc/lib/ld-uClibc.so.0 !


Buildroot has limited buildtime auto-configuration editing
capabilities of the runtime configs it creates. I suspect
that it might not be smart enough to configure your custom
/etc/ld.so.conf.

So try checking the created ld.so.conf to include your
/usr/i386-uclibc/lib path, as well as any other paths for your
GNU libc's, that you are also using...

TonyB


There are 10 types of people in this world, those that read
binary and those who don't!

--
  __      __  _     I N C.               http://www.sysdev.org
/ __|\\// __||  \  __   __          /         tonyb at sysdev.org
\__ \ \/\__ \||)|/ O_)\/ /        \/  System Tools / Utilities
|___/ || ___/|_ /\___|\_/        WIntel / Linux Device Drivers
