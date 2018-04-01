From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 1 Apr 2018 21:03:43 +0200
Subject: [Buildroot] [Patch next v2 1/3] sqlite: add option for
 meta-data about tables/queries
In-Reply-To: <20180302193437.15573-2-ps.report@gmx.net>
References: <20180302193437.15573-1-ps.report@gmx.net>
 <20180302193437.15573-2-ps.report@gmx.net>
Message-ID: <92848d60-aca6-4665-fb4d-48a572169b51@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-03-18 20:34, Peter Seiderer wrote:
> Enables SQLITE_ENABLE_COLUMN_METADATA to gain access to:
> 
>   - sqlite3_column_database_name()
>   - sqlite3_column_database_name16()
>   - sqlite3_column_table_name()
>   - sqlite3_column_table_name16()
>   - sqlite3_column_origin_name()
>   - sqlite3_column_origin_name16()
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
> Changes v1 -> v2:
>   - no changes
> ---
>  package/sqlite/Config.in | 7 +++++++
>  package/sqlite/sqlite.mk | 4 ++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
> index ec7396860c..517af50e67 100644
> --- a/package/sqlite/Config.in
> +++ b/package/sqlite/Config.in
> @@ -16,6 +16,13 @@ config BR2_PACKAGE_SQLITE_STAT3
>  	  query planner that can help SQLite to choose a better query
>  	  plan under certain situations.
>  
> +config BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA
> +	bool "Enable convenient access to meta-data about tables and queries"
> +	help
> +	  When this option is defined there are some additional APIs
> +	  enabled to acces meta-data about tables and queries (see
> +	  https://sqlite.org/compile.html).
> +
>  config BR2_PACKAGE_SQLITE_ENABLE_FTS3
>  	bool "Enable version 3 of the full-text search engine"
>  	help
> diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
> index e8ce92df56..d0030d43ab 100644
> --- a/package/sqlite/sqlite.mk
> +++ b/package/sqlite/sqlite.mk
> @@ -15,6 +15,10 @@ ifeq ($(BR2_PACKAGE_SQLITE_STAT3),y)
>  SQLITE_CFLAGS += -DSQLITE_ENABLE_STAT3
>  endif
>  
> +ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA),y)
> +SQLITE_CFLAGS += -DSQLITE_ENABLE_COLUMN_METADATA
> +endif
> +
>  ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_FTS3),y)
>  SQLITE_CFLAGS += -DSQLITE_ENABLE_FTS3
>  endif
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
