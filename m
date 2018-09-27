From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 27 Sep 2018 12:41:48 +0300
Subject: [Buildroot] [PATCH 2/5] webkitgtk: add dependency on the woff2
 package
In-Reply-To: <20180925225255.3fe01107@windsurf>
References: <20180922235333.85642-1-aperez@igalia.com>
 <20180922235333.85642-3-aperez@igalia.com>	<20180925225255.3fe01107@windsurf>
Message-ID: <20180927124148.GB16720@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 25 Sep 2018 22:52:55 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> Hello,
> 
> On Sun, 23 Sep 2018 02:53:30 +0300, Adrian Perez de Castro wrote:
> > The woff2 dependency is used to support Web fonts in WOFF2 format.
> > This is a Web-facing feature that Web sites expect WebKit to support,
> > and it is recommended to be unconditionally enabled. While it is
> > possible to disable the feature at build time, upstream only recommends
> > doing so if the target system cannot provide a woff2 package.
> > 
> > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> > ---
> >  package/webkitgtk/Config.in    | 1 +
> >  package/webkitgtk/webkitgtk.mk | 3 ++-
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> In general, we are not really happy with optional dependencies turned
> into mandatory dependencies. For example, the EFL package makes a lot
> of dependencies optional, even if upstream strongly recommends to have
> such dependencies enabled (to the point where efl.mk needs to pass
> --enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-abb).

Wow, that's a loooong command line option :)

> However, since woff2 has very few dependencies, and
> woff2+brotli+host-pkgconf build in 19 seconds, it's nothing compared to
> webkitgtk, so I applied your patch.

I will make a follow-up patch to make WOFF2 optional. I think it should be
fine to enable it by default if BR2_PACKAGE_WOFF2 is enabled, and add a line
in the help description telling that it is recommended to enable it.

Cheers,

-Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180927/33ac7ff1/attachment.asc>
