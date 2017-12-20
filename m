From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 20 Dec 2017 12:06:06 +0100
Subject: [Buildroot] [PATCH] utils/checkpackagelib: exclude two files
 from Config.in indentation check
In-Reply-To: <20171219092852.4930a601@windsurf>
References: <20171218084303.12472-1-thomas.petazzoni@free-electrons.com>
 <20171218220344.GC2903@scaer> <20171219092852.4930a601@windsurf>
Message-ID: <20171220110606.GA10605@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-12-19 09:28 +0100, Thomas Petazzoni spake thusly:
> On Mon, 18 Dec 2017 23:03:44 +0100, Yann E. MORIN wrote:
> > Can't we simply fix those two files to not have that unusual indentation
> > in the first place?
> > 
> > AFAICS, that special indentation is about the 'source' lines... Surely
> > that does not bring much to have them indented, and they could simply be
> > left-aligned...
> 
> package/Config.in is also indented in the same way, and there's a
> reason: when you do a diff, diff will tell you in which section the
> change is.

I know very well why package/Config.in is indented, I even Acked the
patch doing so, back in the day... ;-)

I'm just questioning if we could instead drop that indentation in the
two other files, because I believe it does not bring much for them.

> For example, if I do a change in the middle of "Audio and
> video applications", I get:
> 
> diff --git a/package/Config.in b/package/Config.in
> index bd39a374f0..dbcf53d1ce 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -31,7 +31,7 @@ menu "Audio and video applications"
>         source "package/mimic/Config.in"
>         source "package/miraclecast/Config.in"
>         source "package/mjpegtools/Config.in"
> -       source "package/modplugtools/Config.in"
> +       source "package/foomodplugtools/Config.in"
>         source "package/motion/Config.in"
>         source "package/mpd/Config.in"
>         source "package/mpd-mpc/Config.in"
> 
> See the @@ menu "Audio and video applications" ? You wouldn't get this
> without the indentation.

Thanks, I know how to read a diff... ;-)

But it does not always work, see:

diff --git a/package/Config.in b/package/Config.in
index bd39a374f0..83bb126cb8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -312,6 +312,7 @@ endif
 	source "package/tekui/Config.in"
 	source "package/weston/Config.in"
 	source "package/x11r7/Config.in"
+	source "package/blabla/Config.in"
 
 comment "X applications"
 	depends on BR2_PACKAGE_XORG7
@@ -375,6 +376,7 @@ endmenu
 	source "package/a10disp/Config.in"
 	source "package/acpica/Config.in"
 	source "package/acpid/Config.in"
+	source "package/foo/Config.in"
 	source "package/acpitool/Config.in"
 	source "package/aer-inject/Config.in"
 	source "package/am335x-pru-package/Config.in"

> So the indentation does serve a purpose, and has been intentionally
> added, at least to package/Config.in. I think the same
> reason/motivation applies to package/kodi/Config.in and
> package/x11r7/Config.in.

Arguably, and that's what I'm sayging: at least for those last two
files, we could well drop the idnentation because it is not so useful
(although it works better for them than for package/Config.in).

But oh well...

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas Petazzoni
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
