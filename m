From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 16:00:24 +0100
Subject: [Buildroot] [PATCH v3 1/2] sdl_mixer: add patch to fix
 SDL_mixer.pc for static linking
In-Reply-To: <1456883894-25867-1-git-send-email-rprebello@gmail.com>
References: <1456883894-25867-1-git-send-email-rprebello@gmail.com>
Message-ID: <20160306160024.0655ee11@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rodrigo Rebello,

On Tue,  1 Mar 2016 22:58:13 -0300, Rodrigo Rebello wrote:
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

Both patches applied to master! Thanks to Arnout and Romain for the
review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
