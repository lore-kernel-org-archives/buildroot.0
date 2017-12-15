From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Dec 2017 09:24:08 +0100
Subject: [Buildroot] [PATCH 2/2] luadbi-sqlite3: new package
In-Reply-To: <20171209091711.20226-2-francois.perrad@gadz.org>
References: <20171209091711.20226-1-francois.perrad@gadz.org>
 <20171209091711.20226-2-francois.perrad@gadz.org>
Message-ID: <20171215092408.7f3b9489@windsurf.png.is.keysight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  9 Dec 2017 10:17:11 +0100, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                          |  1 +
>  package/luadbi-sqlite3/Config.in           | 10 ++++++++++
>  package/luadbi-sqlite3/luadbi-sqlite3.hash |  2 ++
>  package/luadbi-sqlite3/luadbi-sqlite3.mk   | 13 +++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/luadbi-sqlite3/Config.in
>  create mode 100644 package/luadbi-sqlite3/luadbi-sqlite3.hash
>  create mode 100644 package/luadbi-sqlite3/luadbi-sqlite3.mk

I've applied, with some minor tweaks, see below.

> diff --git a/package/luadbi-sqlite3/Config.in b/package/luadbi-sqlite3/Config.in
> new file mode 100644
> index 000000000..7e21b95d5
> --- /dev/null
> +++ b/package/luadbi-sqlite3/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_LUADBI_SQLITE3
> +	bool "luadbi-sqlite3"
> +	depends on BR2_PACKAGE_HAS_LUAINTERPRETER

Dependency not needed, as it's already taken care of by
package/Config.in.

> +	select BR2_PACKAGE_SQLITE
> +	select BR2_PACKAGE_LUADBI       # runtime dependency

No need for a tab before the comment + alphabetic ordering of
dependencies.

Applied with those fixes. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
