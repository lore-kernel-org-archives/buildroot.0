From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Jan 2021 09:33:15 +0100
Subject: [Buildroot] [PATCH] infra/pkg-meson: avoid host ccache detection
In-Reply-To: <20210110113617.12849-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 10 Jan 2021 12:36:17 +0100")
References: <20210110113617.12849-1-yann.morin.1998@free.fr>
Message-ID: <8735yt9xro.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > meson will by default try to detect the presence of ccache, and if
 > found, will use it unconditioanlly.

 > However, using a system-wide ccache, which would be using our own cache
 > directory, may very well conflict with our own ccache.

 > But there is option to disable that meson nehaviour. The only workaround
 > that is even the official documented way to do so, is to actually pass
 > envornment variables that point to the compiler:

 >     https://mesonbuild.com/Feature-autodetection.html#ccache

 > For the host variants, we pass $(HOST_CONFIGURE_OPTS) in the environment,
 > and this contains correct settings for CC and CXX, so meson does not try
 > and detect ccache; it uses exactly what we tell it to use.

 > For the target variant, the settings for the cross-compiler are defined
 > in the cross-compilation file, and so meson just abides by our will. But
 > for the compiler-for-build, there is no way to specify the CC_FOR_BUILD
 > or CXX_FOR_BUILD via a cross-compilation file:

 >     https://mesonbuild.com/Machine-files.html
 >     https://mesonbuild.com/Cross-compilation.html

 > We could pass the full TARGET_CONFIGURE_OPTS in the environment, like we
 > do for the host variant, but this contains a lot more variables that are
 > supposed to be covered by the cross-compilation file.

 > So, we stay safe and just provide the exact two variables that meson
 > will use to avoid detecting ccache.

 > If the current configuration defines the use of ccache, then these two
 > variables will be properly setup to use our own ccache.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Gleb Mazovetskiy <glex.spb@gmail.com>
 > Cc: James Hilliard <james.hilliard1@gmail.com>
 > Cc: Norbert Lange <nolange79@gmail.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
