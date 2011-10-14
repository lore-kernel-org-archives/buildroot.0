From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Oct 2011 10:05:38 +0200
Subject: [Buildroot] [PATCH v2] New package: ImLib2
In-Reply-To: <4E97EA00.8060103@visionsystems.de>
References: <1318328770-9496-1-git-send-email-yegorslists@googlemail.com>
 <20111014083650.46368731@skate> <4E97EA00.8060103@visionsystems.de>
Message-ID: <201110141005.39125.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Friday 14 October 2011 09:51:28, Yegor Yefremov wrote:
> As far as I understand the dependencies should look like this:
> 
> for ImLib2
> 
> depends on BR2_PACKAGE_XORG7 /* because it is some kind of subsystem */
> select BR2_PACKAGE_XLIB_LIBX11
> select BR2_PACKAGE_XLIB_LIBXEXT
> 
> for feh
> 
> depends on BR2_PACKAGE_XORG7 /* because it is some kind of subsystem */
> select BR2_PACKAGE_XLIB_LIBXINERAMA
> select BR2_PACKAGE_XLIB_LIBXT
> 
> Do we agree on this scheme?

 I'm sorry, I have to correct myself again...  In xlib_libXext.mk we can find

XLIB_LIBXEXT_DEPENDENCIES = xlib_libX11 xproto_xextproto xproto_xproto

 Since ImLib2's configure doesn't need to be informed about libX11 directly, that dependency is redundant after all - both in Config.in and in imlib2.mk.

 That said, it doesn't hurt to keep it.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
