From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 22:28:36 +0200
Subject: [Buildroot] [PATCH 3/3] wireless-regdb: omit author info from
 private key in home directory
In-Reply-To: <20200612053110.15316-4-dev.kurt@vandijck-laurijssen.be>
References: <20200612053110.15316-1-dev.kurt@vandijck-laurijssen.be>
 <20200612053110.15316-4-dev.kurt@vandijck-laurijssen.be>
Message-ID: <20200618222836.5384fe64@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Jun 2020 07:31:10 +0200
Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be> wrote:

> Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
> ---
>  .../002-no-author-from-user-privkey.patch            | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 package/wireless-regdb/002-no-author-from-user-privkey.patch
> 
> diff --git a/package/wireless-regdb/002-no-author-from-user-privkey.patch b/package/wireless-regdb/002-no-author-from-user-privkey.patch
> new file mode 100644
> index 0000000000..8cab1e169c
> --- /dev/null
> +++ b/package/wireless-regdb/002-no-author-from-user-privkey.patch
> @@ -0,0 +1,12 @@
> +diff -Naur wireless-regdb.orig/Makefile wireless-regdb/Makefile
> +--- wireless-regdb.orig/Makefile	2017-03-07 14:13:09.000000000 +0100
> ++++ wireless-regdb/Makefile	2019-01-07 14:15:14.296020922 +0100
> +@@ -29,7 +29,7 @@
> + 			echo custom-user; \
> + 		fi)
> + 
> +-REGDB_PRIVKEY ?= ~/.wireless-regdb-$(REGDB_AUTHOR).key.priv.pem
> ++REGDB_PRIVKEY ?= ~/.wireless-regdb.key.priv.pem
> + REGDB_PUBKEY ?= $(REGDB_AUTHOR).key.pub.pem
> + 
> + REGDB_UPSTREAM_PUBKEY ?= sforshee.key.pub.pem

All patches need a description and Signed-off-by line. But what about
passing REGDB_AUTHOR=buildroot from wireless-regdb.mk, or something
like that ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
