From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Sep 2014 23:53:12 +0200
Subject: [Buildroot] [PATCH 1/1] sqlite: add option to disable fsync
In-Reply-To: <1410450212-30718-2-git-send-email-bos@je-eigen-domein.nl>
References: <1410450212-30718-1-git-send-email-bos@je-eigen-domein.nl>
 <1410450212-30718-2-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20140911235312.215338f2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Thu, 11 Sep 2014 17:43:32 +0200, Floris Bos wrote:
> For use-cases in which performance is more important than data integrity.
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> ---
>  package/sqlite/Config.in | 8 ++++++++
>  package/sqlite/sqlite.mk | 4 ++++
>  2 files changed, 12 insertions(+)

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Only one small nitpick below, which can probably be fixed when Peter
applies the patch.

> 
> diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
> index fe6cc08..298f1ca 100644
> --- a/package/sqlite/Config.in
> +++ b/package/sqlite/Config.in
> @@ -53,4 +53,12 @@ config BR2_PACKAGE_SQLITE_SECURE_DELETE
>  	  http://www.sqlite.org/pragma.html#pragma_secure_delete
>  	  for additional information.
>  
> +config BR2_PACKAGE_SQLITE_NO_SYNC
> +	bool "Disable fsync"
> +	help
> +	  By default SQLite forces all database transactions to storage
> +	  immediately using fsync() to protect against data loss in case
> +	  of power failure.
> +	  This option turns this behavior off resulting in higher performance
> +	  especially when using slow flash storage.
>  endif

Missing new line before "endif".

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
