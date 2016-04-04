From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 4 Apr 2016 21:40:45 +0200
Subject: [Buildroot] [PATCH] opencv: fix sparc64 compile
In-Reply-To: <20160403110913.GA19849@waldemar-brodkorb.de>
References: <20160403110913.GA19849@waldemar-brodkorb.de>
Message-ID: <5702C33D.80608@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/03/16 13:09, Waldemar Brodkorb wrote:
> This patch from Debian fixes following autobuild failure:
> http://autobuild.buildroot.net/results/eda5c6c43da40a342e0f545a348d2f865eb5ccf2/
>
> Tested with ARM build without a regression.
>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>   package/opencv/0002-atomic.patch | 222 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 222 insertions(+)
>   create mode 100644 package/opencv/0002-atomic.patch
>
> diff --git a/package/opencv/0002-atomic.patch b/package/opencv/0002-atomic.patch
> new file mode 100644
> index 0000000..607d3fd
> --- /dev/null
> +++ b/package/opencv/0002-atomic.patch
> @@ -0,0 +1,222 @@
> +Bug#714923: opencv FTBFS on sparc64
> +https://www.mail-archive.com/debian-bugs-dist at lists.debian.org/msg1393793.html
> +

  You should sign off the patch. It is also missing a description of what is 
wrong and how it is fixed.

  Also please refer to the bug tracker itself rather than the mail archive:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=714923

  The first message there contains a nice description of the problem that you 
can reuse in the patch.

  Regards,
  Arnout

> +diff -Nur opencv-2.4.12.3.orig/modules/core/include/opencv2/core/core.hpp opencv-2.4.12.3/modules/core/include/opencv2/core/core.hpp
> +--- opencv-2.4.12.3.orig/modules/core/include/opencv2/core/core.hpp	2015-10-26 08:56:34.000000000 +0100
> ++++ opencv-2.4.12.3/modules/core/include/opencv2/core/core.hpp	2016-04-03 00:10:50.455774144 +0200
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
