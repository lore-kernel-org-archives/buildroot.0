From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 Sep 2020 23:41:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/wlroots: always disable
 xcb-errors
In-Reply-To: <20200909213756.1945855-1-aperez@igalia.com>
References: <20200909213756.1945855-1-aperez@igalia.com>
Message-ID: <20200909234149.426fe79c@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 10 Sep 2020 00:37:56 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Stop trying to enable the xcb-errors Meson option and always disable it:
> there is no xcb-util-errors package in Buildroot. The build recipe was
> wrongly assuming that the XCB errors library would be installed as part
> of the xcb-util package, which is not the case.
> 
> Fixes the following autobuilder failure:
> 
>   http://autobuild.buildroot.net/results/1891aa624b29e4bbcbbe6bc752a1cc90c316024e/
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Fabrice posted the same patch no longer before you:

  https://patchwork.ozlabs.org/project/buildroot/patch/20200909210022.2822148-1-fontaine.fabrice at gmail.com/

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
