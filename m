From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 20 Aug 2009 08:53:22 +0000 (UTC)
Subject: [Buildroot] [Bug 575] Buildroot Libtool Patch Fails
In-Reply-To: <bug-575-163@https.bugs.busybox.net/>
References: <bug-575-163@https.bugs.busybox.net/>
Message-ID: <20090820085322.5D153776D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=575





--- Comment #4 from Will Newton <will.newton@gmail.com>  2009-08-20 08:53:21 UTC ---
(In reply to comment #2)
> Yes it did go past, bear in mind the host needs gperf to compile it. Maybe that
> should be added to host tools
> 
> However I now get:
> make[2]: *** [JavaScriptCore/libJavaScriptCore_la-AllInOneFile.lo] Error 1
> make[2]: *** Waiting for unfinished jobs....
> In file included from
> ./WebCore/platform/graphics/transforms/TransformationMatrix.h:36,
>                  from ./WebCore/rendering/style/RenderStyle.h:28,
>                  from ./WebCore/rendering/RenderObject.h:33,
>                  from WebCore/accessibility/AXObjectCache.cpp:46:
> /home/dan/xenon/buildroot/build_i386/staging_dir/usr/include/cairo/cairo.h:1550:5:
> warning: "CAIRO_HAS_PNG_FUNCTIONS" is not defined
> /home/dan/xenon/buildroot/build_i386/staging_dir/usr/include/cairo/cairo.h:1682:5:
> warning: "CAIRO_HAS_PNG_FUNCTIONS" is not defined
> mv -f WebCore/accessibility/.deps/libWebCore_la-AXObjectCache.Tpo
> WebCore/accessibility/.deps/libWebCore_la-AXObjectCache.Plo
> make[2]: Leaving directory `/home/dan/xenon/buildroot/build_i386/webkit-r44552'
> make[1]: *** [all] Error 2
> make[1]: Leaving directory `/home/dan/xenon/buildroot/build_i386/webkit-r44552'
> make: *** [/home/dan/xenon/buildroot/build_i386/webkit-r44552/.stamp_built]
> Error 2
> 

WebKit requires cairo to be built with png support. That can be enabled from
the menuconfig to get things building.

I need to investigate under which circumstances WebKit uses cairo and it's PNG
support.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
