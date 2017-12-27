From: Trent Piepho <tpiepho@impinj.com>
Date: Wed, 27 Dec 2017 18:54:35 +0000
Subject: [Buildroot] [PATCH v2 branch/next] uboot-tools: fix dtc
 invocation
In-Reply-To: <87k1x8tsos.fsf@dell.be.48ers.dk>
References: <20171201124020.4475-1-yegorslists@googlemail.com>
 <87k1x8tsos.fsf@dell.be.48ers.dk>
Message-ID: <1514400874.26695.45.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2017-12-27 at 10:40 +0100, Peter Korsgaard wrote:
> > > > > > "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:
> 
>  > From: Yegor Yefremov <yegorslists@googlemail.com>
>  > Since uboot 2017.09 path to dtc will be configured via Kconfig. As BR

This isn't quite right, the change to u-boot that pulls in the dtc path
via a Kconfig setting was part of uboot 2017.11-rc1.  The version of u-
boot tools in buildroot 2017.11.x, uboot 2017.09, does not have the
change and works correctly without this patch.

However, the patch does no harm: it just supplies an unused variable on
the command line.

>  > skips this step for uboot-tools building one has to provide
>  > CONFIG_MKIMAGE_DTC_PATH=dtc on the build command line. Otherwise
>  > mkimage will not be able to create FIT images, i.e.:
> 
