From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 5 Mar 2016 16:55:10 +0100
Subject: [Buildroot] Reviewed-by
In-Reply-To: <1456883894-25867-1-git-send-email-rprebello@gmail.com>
References: <1456883894-25867-1-git-send-email-rprebello@gmail.com>
Message-ID: <56DB015E.1090205@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rodrigo,

Le 02/03/2016 02:58, Rodrigo Rebello a ?crit :
> A 'Libs.private' field needs to be present and properly defined in the
> pkg-config file in order for static linking against SDL_mixer to work.
> 
> Besides adding the mentioned field, the included patch also modifies
> configure.in so that EXTRA_LDFLAGS (which is now also used as the value
> of 'Libs.private') no longer includes SDL_LIBS. This is done so as to
> prevent libraries required by SDL from being listed twice when
> 'pkg-config --libs --static SDL_mixer' is run (they're already shown
> because of the 'Requires: sdl' line in SDL_mixer.pc). Makefile.in is
> adjusted accordingly as well.
> 
> Also enable autoreconf for this package since we're patching
> configure.in.
> 
> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
> ---
> Changes v1 -> v2:
>   - Add host-autoconf host-automake and host-libtool to
>     SDL_MIXER_DEPENDENCIES (Thomas Petazzoni)
> 
> Changes v2 -> v3:
>   - Use SDL_MIXER_AUTORECONF instead of pre-configure hook
>     (Arnout Vandecappelle)
> ---

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain
