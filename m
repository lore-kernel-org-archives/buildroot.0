From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Oct 2015 13:28:21 +0200
Subject: [Buildroot] [PATCH] mplayer: enable apng and tdsc only if zlib
 is available
In-Reply-To: <1444832124-35387-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1444832124-35387-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151015132821.7310d6fd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 14 Oct 2015 15:15:24 +0100, Vicente Olivert Riera wrote:
> apng and tdsc are enabled by default, but they need zlib, otherwise the
> compilation will fail with an error like this one:
> 
> libavcodec/pngdec.c:35:18: fatal error: zlib.h: No such file or
> directory
>  #include <zlib.h>
>                   ^
> compilation terminated.
> 
> So add an autodep on BR2_PACKAGE_ZLIB to enable or disable support for
> apng and tdsc accordingly.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/mplayer/mplayer.mk |   13 +++++++++++++
>  1 files changed, 13 insertions(+), 0 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
