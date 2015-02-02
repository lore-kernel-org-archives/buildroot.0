From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Feb 2015 11:38:59 +0100
Subject: [Buildroot] [PATCH v2] libvips: new package
In-Reply-To: <1422867942-9684-1-git-send-email-pieter.degendt@gmail.com>
References: <1422867942-9684-1-git-send-email-pieter.degendt@gmail.com>
Message-ID: <20150202113859.32070b72@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Pieter De Gendt,

On Mon,  2 Feb 2015 10:05:42 +0100, Pieter De Gendt wrote:
> Signed-off-by: Pieter De Gendt <pieter.degendt@gmail.com>
> 
> ---
> Changes v1 -> v2 (suggested by Thomas Petazzoni)
>   - select glib2 dependency
>   - inherit glib2 dependencies (MMU, wchar, threads)
>   - Fixed comments
>   - Newline at end of files
>   - Changed <pkg>_CONF_OPT to <pkg>_CONF_OPTS
>   - Removed gtk-doc options
>   - Fixed autotools dependencies
>   - Check BR2_INSTALL_LIBSTDCPP fir c++ support
>   - Use automatic dependencies instead of separate options

Thanks, applied, after doing a number of changes:

    [Thomas:
     - Fix variable name: LIBVIPS_CONF_OPTSS -> LIBVIPS_CONF_OPTS
     - Add a lot of --without-<foo> options to make sure we explicitly
       disable optional features that are not handled by the .mk file.
     - Remove the host-swig dependency, which was probably thought of
       being needed by Pieter due to --without-python not being passed
       explicitly.
     - Remove trailing spaces in Config.in.
     - Rename patch to the new naming convention.]

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
