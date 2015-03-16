From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 22:14:54 +0100
Subject: [Buildroot] [PATCH 1/1] quagga: option for vtysh
In-Reply-To: <1425929912-43526-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1425929912-43526-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20150316221454.65957bb9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Mon,  9 Mar 2015 14:38:32 -0500, Matt Weber wrote:

> +config BR2_PACKAGE_QUAGGA_VTYSH
> +	bool "Build vtysh"
> +	help
> +	  Build and install vtysh, a vty shell for Quagga.

When I look at quagga's configure.ac script, I see:

         if test $ac_cv_lib_readline_main = no; then
           AC_MSG_ERROR([vtysh needs libreadline but was not found and usable on your system.])
         fi

So I believe you need some more code than what you did: a select on
BR2_PACKAGE_READLINE, and an addition to QUAGGA_DEPENDENCIES in the .mk
file.

I've marked your patch as Changes Requested in patchwork, so please
send an updated version with this issue fixed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
