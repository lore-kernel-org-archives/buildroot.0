From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 21:20:02 +0200
Subject: [Buildroot] [PATCH] package/libxslt: add upstream security fix
 for CVE-2019-11068
In-Reply-To: <20190424133718.19751-1-peter@korsgaard.com>
References: <20190424133718.19751-1-peter@korsgaard.com>
Message-ID: <20190424212002.6affd5f3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 24 Apr 2019 15:37:18 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issue:
> 
> - CVE-2019-11068: libxslt through 1.1.33 allows bypass of a protection
>   mechanism because callers of xsltCheckRead and xsltCheckWrite permit
>   access even upon receiving a -1 error code.  xsltCheckRead can return -1
>   for a crafted URL that is not actually invalid and is subsequently loaded.
> 
> Upstream bugtracker issue not yet public:
> https://gitlab.gnome.org/GNOME/libxslt/issues/12
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .../0001-Fix-security-framework-bypass.patch       | 122 +++++++++++++++++++++
>  1 file changed, 122 insertions(+)
>  create mode 100644 package/libxslt/0001-Fix-security-framework-bypass.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
