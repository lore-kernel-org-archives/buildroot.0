From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 30 Oct 2018 08:00:10 -0500
Subject: [Buildroot] [PATCH 1/2] qemu: sdl frontend needs x11
In-Reply-To: <20181030082755.13043-1-fontaine.fabrice@gmail.com>
References: <20181030082755.13043-1-fontaine.fabrice@gmail.com>
Message-ID: <CANQCQpbV+Ld09XUJLitGh4if+_T324RLdN-gSnq-V5U8OQqctQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice,

On Tue, Oct 30, 2018 at 3:28 AM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Since qemu 2.12.0 and
> https://github.com/qemu/qemu/commit/2ec78706d188df7d3dab43d07b19b05ef7800a44,
> x_keymap.h has been converted from "SDL display driver" to "X11 keymaps"
>
> So add a select on BR2_PACKAGE_SDL_X11
>
> Fixes:
>  - http://autobuild.buildroot.org/results/1908d2d7de8d3aff11ed6fbb8fe4cf3eff54b5a5
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Guessing this one may pop up again when Xen bumps qemu versions.  In
Xen we have the explicit "--disable-sdl" without an option for SDK.
For QEMU, did it look like the "--disable-sdl" still correctly
disables the new x11 dependency?

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

> ---
>  package/qemu/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/package/qemu/Config.in b/package/qemu/Config.in
> index 61a2a1072e..d7390141f9 100644
> --- a/package/qemu/Config.in
> +++ b/package/qemu/Config.in
> @@ -118,7 +118,9 @@ comment "Frontends"
>
>  config BR2_PACKAGE_QEMU_SDL
>         bool "Enable SDL frontend"
> +       depends on BR2_PACKAGE_XORG7
>         select BR2_PACKAGE_SDL
> +       select BR2_PACKAGE_SDL_X11
>         help
>           Say 'y' to enable the SDL frontend, that is, a graphical
>           window presenting the VM's display.
> --
> 2.17.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



--
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / RC Linux Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
