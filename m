From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Aug 2019 14:14:41 +0200
Subject: [Buildroot] [PATCH] package/nfs-utils: enable IPv6 if libtirpc
 is selected
In-Reply-To: <CAJ4jsafKz3Hrex0RwiBmZcULyumTHX4hpAS0Tfb442TNdg4NAQ@mail.gmail.com>
References: <20190812030954.4880-1-unixmania@gmail.com>
 <20190812181450.70b8c901@gmx.net>
 <20190812230639.4a7811d9@windsurf.home>
 <CAJ4jsafKz3Hrex0RwiBmZcULyumTHX4hpAS0Tfb442TNdg4NAQ@mail.gmail.com>
Message-ID: <20190813141441.4d7d91a2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 12 Aug 2019 20:47:06 -0300
Carlos Santos <unixmania@gmail.com> wrote:

> It's an optional dependency only if we decide to make ipv6 optional,
> which goes against the decision taken years go, according to Arnout's
> comment[1]: "We decided a few years ago to no longer make ipv6 support
> in packages optional, i.e. always assume it is there." That's why by
> default autotools packages are configured with --enable-ipv6 (see
> package/pkg-autotools.mk).
> 
> 1. https://bugs.busybox.net/show_bug.cgi?id=10806#c1

But then in this case, we should entirely drop the RPC support for
uClibc-ng, as it doesn't support IPv6 if I remember correctly, and
simply force libtirpc for all packages that need RPC support. This is
not just something specific to nfs-utils, we have a number of other
packages that use RPC.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
