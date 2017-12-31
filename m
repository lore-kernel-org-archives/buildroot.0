From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Dec 2017 18:24:28 +0100
Subject: [Buildroot] [RFCv3 01/15] pkgconf: use relative path to
 STAGING_DIR instead of absolute path
In-Reply-To: <20171201205352.24287-2-thomas.petazzoni@free-electrons.com>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
 <20171201205352.24287-2-thomas.petazzoni@free-electrons.com>
Message-ID: <20171231182428.64e8eda1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Dec 2017 21:53:38 +0100, Thomas Petazzoni wrote:
> The pkg-config wrapper script is currently generated with absolute
> paths to $(STAGING_DIR). However, this will not work properly with
> per-package SDK, and each package will be built with a different
> STAGING_DIR value.
> 
> In order to fix this, we adjust how the pkg-config wrapper script is
> generated, so that it uses a relative path to itself: the sysroot (i.e
> STAGING_DIR) is always located in $(path of
> pkg-config)/../$(STAGING_SUBDIR).
> 
> This change is independent from the per-package SDK work, and could be
> applied independently from it.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Changes since v2:
>  - None
> Changes since v1:
>  - As suggested by Arnout, simplify the generation of the pkg-config
>    script by doing only a replacement on @STAGING_SUBDIR@, the rest
>    being encoded inside the pkg-config script.
> ---
>  package/pkgconf/pkg-config.in | 5 ++++-
>  package/pkgconf/pkgconf.mk    | 3 +--
>  2 files changed, 5 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
