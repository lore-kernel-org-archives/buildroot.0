From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2020 15:54:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/babeltrace2: disable -Werror
In-Reply-To: <20200912185754.663166-1-fontaine.fabrice@gmail.com>
References: <20200912185754.663166-1-fontaine.fabrice@gmail.com>
Message-ID: <20200913155455.0a6b5d9f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 12 Sep 2020 20:57:54 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add an upstream patch that disable -Werror to avoid the following build
> failure:
> 
> lttng-live.c: In function 'lttng_live_msg_iter_next':
> lttng-live.c:1226:15: error: 'stream_iter' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>      int ret = common_muxing_compare_messages(
>                ^
> lttng-live.c:1198:38: note: 'stream_iter' was declared here
>    struct lttng_live_stream_iterator *stream_iter;
>                                       ^
> lttng-live.c: At top level:
> cc1: error: unrecognized command line option '-Wno-cast-function-type' [-Werror]
> cc1: all warnings being treated as errors
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ff41326f913e71f982b3d5cbaf054f8be47913aa
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ure-simplify-warning-flags-detection.patch | 669 ++++++++++++++++++
>  package/babeltrace2/babeltrace2.mk            |   2 +
>  2 files changed, 671 insertions(+)
>  create mode 100644 package/babeltrace2/0001-configure-simplify-warning-flags-detection.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
