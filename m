From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 17 Jan 2012 23:35:27 +0100
Subject: [Buildroot] Derive HOST_FOO_DEPENDENCIES automatically
In-Reply-To: <1326722336-11759-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Mon, 16 Jan 2012 14:58:34 +0100")
References: <1326722336-11759-1-git-send-email-arnout@mind.be>
Message-ID: <8762gaot3k.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> This patch series derives HOST_FOO_DEPENDENCIES automatically from 
 Arnout> FOO_DEPENDENCIES.  It is a repost of my earlier patch series,
 Arnout> rebased on the current master.

 Arnout> I only compile-tested some of the modified packages.  However, I
 Arnout> checked that 'make host-foo-show-depends' outputs the same result.
 Arnout> There are two exceptions:

 Arnout> host-libxcb: the dependency on host-xcb-proto now appears twice.
 Arnout> This is harmless.

 Arnout> host-xlib_libX11: also some reordering, which should be OK. I also
 Arnout> removed the dependency on xproto_bigreqsproto, which doesn't seem to
 Arnout> be needed.  *This one really requires testing.*

 Arnout> ---
 Arnout> Arnout Vandecappelle (Essensium/Mind) (22):
 Arnout>       package: derive HOST_FOO_DEPENDENCIES from FOO_DEPENDENCIES
 Arnout>       atk: removed redundant HOST_FOO_DEPENDENCIES
 Arnout>       cramfs: removed redundant HOST_FOO_DEPENDENCIES
 Arnout>       libpng: removed redundant HOST_FOO_DEPENDENCIES
 Arnout>       fontconfig: removed redundant HOST_FOO_DEPENDENCIES
 Arnout>       mpc: removed redundant HOST_FOO_DEPENDENCIES
 Arnout>       libxml-parser-perl: removed redundant HOST_FOO_DEPENDENCIES
 Arnout>       squashfs3: removed redundant HOST_FOO_DEPENDENCIES
 Arnout>       mpfr: removed redundant HOST_FOO_DEPENDENCIES
 Arnout>       xapp_mkfontscale: removed redundant HOST_FOO_DEPENDENCIES
 Arnout>       xlib_libXdmcp: removed redundant HOST_FOO_DEPENDENCIES
 Arnout>       xfont_encodings: removed redundant HOST_FOO_DEPENDENCIES
 Arnout>       xlib_libXfont: removed redundant HOST_FOO_DEPENDENCIES
 Arnout>       xlib_libXau: removed redundant HOST_FOO_DEPENDENCIES
 Arnout>       xapp_xkbcomp: removed redundant HOST_FOO_DEPENDENCIES
 Arnout>       libxcb: removed redundant HOST_FOO_DEPENDENCIES
 Arnout>       xlib_libX11: removed redundant HOST_FOO_DEPENDENCIES and incorrect target dependency
 Arnout>       xapp_bdftopcf: removed redundant HOST_FOO_DEPENDENCIES
 Arnout>       xlib_libxkbfile: removed redundant HOST_FOO_DEPENDENCIES
 Arnout>       xfont_font-util: removed redundant HOST_FOO_DEPENDENCIES
 Arnout>       xlib_libfontenc: removed redundant HOST_FOO_DEPENDENCIES
 Arnout>       xapp_mkfontdir: removed redundant HOST_FOO_DEPENDENCIES

Committed entire series, thanks!

-- 
Bye, Peter Korsgaard
