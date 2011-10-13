From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Oct 2011 00:18:05 +0200
Subject: [Buildroot] [PATCH v3 1/3] New package: ImLib2
In-Reply-To: <1318410838-24275-2-git-send-email-yegorslists@googlemail.com>
References: <1318410838-24275-1-git-send-email-yegorslists@googlemail.com>
 <1318410838-24275-2-git-send-email-yegorslists@googlemail.com>
Message-ID: <201110140018.06102.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 [Will this discussion ever end? :-P ]

On Wednesday 12 October 2011 11:13:56, yegorslists at googlemail.com wrote:
[snip]
> +config BR2_PACKAGE_IMLIB2_X
> +	depends on BR2_PACKAGE_XORG7
[snip]
> +	IMLIB2_DEPENDENCIES += xlib_libX11 xlib_libXext

 If you ask me, dependencies in Config.in and in pkg.mk should be consistent.
So do select these two libraries in the Config.in (yes, all two of them, just in case that the dependency of Xext on X11 disappears some day; not that that's very likely).  The dependency on XORG7 should stay of course.

 I'm not sure if there should also be a comment that XORG7 needs to be
selected for the X backend.


 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111014/e942715e/attachment-0001.html>
