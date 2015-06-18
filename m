From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jun 2015 22:41:09 +0200
Subject: [Buildroot] [PATCH 1/1] fluxbox: fix build against xlib_libXpm
In-Reply-To: <1434649376-8012-1-git-send-email-james.knight@rockwellcollins.com>
References: <1434649376-8012-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20150618224109.3f276428@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Knight,

On Thu, 18 Jun 2015 13:42:56 -0400, James Knight wrote:
> Explicitly configure XPM support based on the library selection provided
> (BR2_PACKAGE_XLIB_LIBXPM). It has been observed on different hosts that
> XPM support may or may not be included based off the state of the host's
> system. One can validate XPM support is included in Fluxbox by using the
> command `fluxbox -info`.
> 
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> ---
>  package/fluxbox/fluxbox.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied, thanks. However, there are lots of optional dependencies in
fluxbox that we don't handle correctly yet. At least:

  --disable-xft           disable xft support
  --disable-freetype2     disable freetype2 support
  --disable-xrender       disable xrender support
  --disable-xinerama      disable xinerama support
  --disable-xext          disable Misc X Extension Library support
  --disable-xrandr        disable xrandr support
  --disable-fribidi       disable fribidi support

If you want to send a patch also adding support for all those optional
dependencies, or at least explicitly passing --disable-<foo> to avoid
automatic detection, it would be useful.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
