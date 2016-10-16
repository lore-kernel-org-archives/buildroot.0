From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 12:13:42 +0200
Subject: [Buildroot] [PATCH 2/2] dependencies: check for Math
 BigInt/BigRat Perl module
In-Reply-To: <1467845012-10531-2-git-send-email-romain.naour@gmail.com>
References: <1467845012-10531-1-git-send-email-romain.naour@gmail.com>
 <1467845012-10531-2-git-send-email-romain.naour@gmail.com>
Message-ID: <20161016121342.5dedf020@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  7 Jul 2016 00:43:32 +0200, Romain Naour wrote:
> As for MakeMaker Perl module, add a check for Math BigInt/BigRat Perl
> Core module.
> 
> Fixes:
> Waf: Entering directory `output/build/mpv-0.17.0/build'
> [  1/198] Compiling version.sh
> [ 12/198] Processing ebml_types.h: demux/ebml.c demux/demux_mkv.c -> build/ebml_types.h
> [ 13/198] Compiling demux/ebml.c
> Can't locate Math/BigRat.pm in @INC (you may need to install the Math::BigRat module)
> 
> Waf: Entering directory `output/build/mpv-0.17.0/build'
> [  1/198] Compiling version.sh
> [  2/198] Compiling TOOLS/osxbundle/mpv.app/Contents/Resources/icon.icns
> [  3/198] Compiling video/out/x11_icon.bin
> [  4/198] Compiling etc/input.conf
> [  5/198] Compiling sub/osd_font.otf
> [  6/198] Compiling video/out/opengl/nnedi3_weights.bin
> [  7/198] Compiling player/lua/defaults.lua
> [  8/198] Compiling player/lua/assdraw.lua
> [  9/198] Compiling player/lua/options.lua
> [ 10/198] Compiling player/lua/osc.lua
> [ 11/198] Compiling player/lua/ytdl_hook.lua
> [ 12/198] Processing ebml_types.h: demux/ebml.c demux/demux_mkv.c -> build/ebml_types.h
> [ 13/198] Compiling demux/ebml.c
> [ 14/198] Compiling DOCS/man/mpv.rst
> Can't locate Math/BigInt.pm in @INC (you may need to install the Math::BigInt module)
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Fran?ois Perrad <francois.perrad@gadz.org>
> ---
>  support/dependencies/dependencies.sh | 2 ++
>  1 file changed, 2 insertions(+)

Applied, after making those Perl modules only required when mpv is
enabled.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
