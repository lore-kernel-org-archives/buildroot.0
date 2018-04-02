From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 22:25:09 +0200
Subject: [Buildroot] [PATCH v2/next 1/4] brotli: new package
In-Reply-To: <20180323185942.60252-2-aperez@igalia.com>
References: <20180323185942.60252-1-aperez@igalia.com>
 <20180323185942.60252-2-aperez@igalia.com>
Message-ID: <20180402222509.6afc6ec4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Mar 2018 20:59:39 +0200, Adrian Perez de Castro wrote:
> Add the brotli package to Buildroot. This is needed by woff2, which in
> turn is needed by webkitgtk from version 2.20.0 onwards. WebKitGTK+ used
> to bundle a copy of the library, but it stopped doing so now that the
> upstream has started making releases.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Brotli is detected by libcurl, and it causes a build failure, at least
in some situations:

  http://autobuild.buildroot.net/results/64b/64bc0dfe284206390ae0680b94c0876863a3c0f3/build-end.log

Could you have a look ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
