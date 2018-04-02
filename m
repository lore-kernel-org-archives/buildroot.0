From: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 2 Apr 2018 23:07:18 +0100
Subject: [Buildroot] [PATCH v2/next 1/4] brotli: new package
In-Reply-To: <20180402222509.6afc6ec4@windsurf>
References: <20180323185942.60252-1-aperez@igalia.com>
 <20180323185942.60252-2-aperez@igalia.com>	<20180402222509.6afc6ec4@windsurf>
Message-ID: <20180402230718.GB16681@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2 Apr 2018 22:25:09 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> Hello,
> 
> On Fri, 23 Mar 2018 20:59:39 +0200, Adrian Perez de Castro wrote:
> > Add the brotli package to Buildroot. This is needed by woff2, which in
> > turn is needed by webkitgtk from version 2.20.0 onwards. WebKitGTK+ used
> > to bundle a copy of the library, but it stopped doing so now that the
> > upstream has started making releases.
> > 
> > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> 
> Brotli is detected by libcurl, and it causes a build failure, at least
> in some situations:
> 
>   http://autobuild.buildroot.net/results/64b/64bc0dfe284206390ae0680b94c0876863a3c0f3/build-end.log
> 
> Could you have a look ?

Sure, from the looks of it the curl config scripts are not adding
-lbrotlicommon when doing static builds, hence the missing symbols. I'll
see what I can come up with, likely this will end up with a patch sent to
curl upstream.

Now it's a bit late for me, so I'll continue with it tomorrow.

Thanks for the heads up!


--
 Adri?n ?

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180402/d4399987/attachment.asc>
