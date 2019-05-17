From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 May 2019 09:08:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: add
 BR2_PACKAGE_HAS_LIBEGL_WAYLAND dependency
In-Reply-To: <20190517002828.GB29253@momiji>
References: <20190516201220.24893-1-fontaine.fabrice@gmail.com>
 <20190517002828.GB29253@momiji>
Message-ID: <20190517090800.1ce26f4f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adrian,

On Fri, 17 May 2019 00:28:28 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> This is not correct. The short version of the story is tat WPE WebKit
> itself does not require Wayland, only wpebackend-fdo uses Wayland.

That does not matter.

If A selects B, and B depends on C, then A *must* replicate the
"depends on C". That's due to how Kconfig work, and it's totally
unrelated to the fact that A doesn't use C directly in practice.

If you don't replicate this "depends on", then Kconfig allows you to
enable "A" even if the dependencies for "B" are not satisfied, causing
the build failure that Fabrice is fixing.

So, Fabrice patch is correct.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
