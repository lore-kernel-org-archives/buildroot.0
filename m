From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 15:13:21 +0100
Subject: [Buildroot] [RFC 0/3] WPE WebKit
In-Reply-To: <20181228013448.GB19602@momiji>
References: <20181223154845.23556-1-francois.perrad@gadz.org>
 <20181228013448.GB19602@momiji>
Message-ID: <20181231151321.4d356df9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adrian,

First of all, thanks a lot for your review of this patch series.

On Fri, 28 Dec 2018 01:34:48 +0100, Adrian Perez de Castro wrote:

> - The way I was hoping to do the WPE packaging for upstream Buildroot was to
>   reuse as many bits and pieces as possible from the WebKitGTK+ packaging,
>   and share code with the WPE packaging. For example: right now there is a
>   BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS configuration symbol, and in the WPE
>   overlay I mentioned above there is BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS...
>   ideally we would have a single BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS, which
>   gets used both by the ?wpewebkit? and ?webkitgtk? packages (the same would
>   go for the logic that determines whether the target supports the JSC JIT,
>   and others). I'll follow up on this in a different e-mail.

I have asked in the other e-mail as well: what is the relationship
between all those Webkit "ports" ? Why do they duplicate the core of
the Webkit code ?

I'm not sure where in Buildroot we would put those common ARCH_SUPPORTS
options, that are used by several packages that have no dependency
relationship.

> - I would like to allow building more backends than WPEBackend-fdo. More
>   precisely, WPEBackend-rdk is a good option to use dispmanx on the Raspberry
>   Pi directly, without needing a Wayland compositor.

So WPEBackend-fdo is a wayland backend ? Why is it named "fdo" (for
freedesktop.org I guess) instead of the more obvious
WPEBackend-wayland ?

Also, why is WPEBackend-rdk named after an overall "umbrella" project,
rather than the actual technology used in the backend ? I see that
WPEBackend-rdk also has Wayland support.

I'm confused.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
