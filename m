From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 23:15:21 +0200
Subject: [Buildroot] [PATCH v9] google-breakpad: integration into
 Makefile and Config.in
In-Reply-To: <1406837335-9696-1-git-send-email-yann.morin.1998@free.fr>
References: <1406837335-9696-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140731231521.3242d944@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Pascal,

(Adding Pascal in Cc.)

On Thu, 31 Jul 2014 22:08:55 +0200, Yann E. MORIN wrote:

> +config BR2_GOOGLE_BREAKPAD_ENABLE
> +	bool "Enable google-breakpad support"
> +	select BR2_PACKAGE_GOOGLE_BREAKPAD

The propagation of the dependencies of the google-breakpad package were
missing, so I added them here.

> +	help
> +	  This option will enable the use of google breakpad, a library and tool
> +	  suite that allows you to distribute an application to users with
> +	  compiler-provided debugging information removed, record crashes in
> +	  compact "minidump" files, send them back to your server and produce
> +	  C and C++ stack traces from these minidumps.  Breakpad can also write
> +	  minidumps on request for programs that have not crashed.

This help text...

> +
> +if BR2_GOOGLE_BREAKPAD_ENABLE
> +
> +config BR2_GOOGLE_BREAKPAD_INCLUDE_FILES
> +	string "List of executables and libraries to extract symbols from"
> +	default ""
> +	help
> +	  You may specify a space-separated list of binaries and libraries
> +	  with full paths relative to $(TARGET_DIR) of which debug symbols 
> +	  will be dumped for further use with google breakpad.
> +
> +	  A directory structure that can be used by minidump-stackwalk will
> +	  be created at:

... and this one were slightly too long, so I rewrapped them.


> +config BR2_PACKAGE_HOST_GOOGLE_BREAKPAD
> +	bool

I've removed this debugging leftover.

And then I've applied the patch. Thanks a lot Pascal and Yann for
having worked on this. A special thanks to Pascal for his persistence
to get this feature merged, despite our numerous requests to adjust the
implementation.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
