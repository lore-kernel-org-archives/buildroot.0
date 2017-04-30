From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Apr 2017 23:07:47 +0200
Subject: [Buildroot] [PATCH] freetype: add upstream security fixes for
 CVE-2017-8105 and CVE-2017-8287
In-Reply-To: <20170430193602.1577-1-peter@korsgaard.com>
References: <20170430193602.1577-1-peter@korsgaard.com>
Message-ID: <20170430230747.28196b95@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Apr 2017 21:36:02 +0200, Peter Korsgaard wrote:
> Add upstream post-2.7.1 commits (except for ChangeLog modifications) fixing
> the following security issues:
> 
> CVE-2017-8105 - FreeType 2 before 2017-03-24 has an out-of-bounds write
> caused by a heap-based buffer overflow related to the
> t1_decoder_parse_charstrings function in psaux/t1decode.c.
> 
> CVE-2017-8287 - FreeType 2 before 2017-03-26 has an out-of-bounds write
> caused by a heap-based buffer overflow related to the
> t1_builder_close_contour function in psaux/psobjs.c.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .../0001-psaux-Better-protect-flex-handling.patch  | 47 ++++++++++++++++++++++
>  ...sobjs.c-t1_builder_close_contour-Add-safe.patch | 35 ++++++++++++++++
>  2 files changed, 82 insertions(+)
>  create mode 100644 package/freetype/0001-psaux-Better-protect-flex-handling.patch
>  create mode 100644 package/freetype/0002-src-psaux-psobjs.c-t1_builder_close_contour-Add-safe.patch

Applied, thanks! Obviously for the LTS branch as well.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
