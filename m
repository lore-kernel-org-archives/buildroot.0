From: Ryan Coe <bluemrp9@gmail.com>
Date: Thu, 27 Jul 2017 07:10:05 -0700
Subject: [Buildroot] [PATCH 1/1] host-mariadb: add host-openssl
	dependency
In-Reply-To: <20170727133548.30285-1-aduskett@gmail.com>
References: <20170727133548.30285-1-aduskett@gmail.com>
Message-ID: <81789c43-8791-0078-80ef-4c036c9a18df@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam,


On 7/27/2017 6:35 AM, Adam Duskett wrote:
> On Fedora26, openssl 1.1.x is included by default.  This causes build errors
> when building the host variant of mariadb. Adding host-openssl as a dependency
> fixes this issue.
>
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>   package/mariadb/mariadb.mk | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
> index 1d6c2bcc4..8004709c7 100644
> --- a/package/mariadb/mariadb.mk
> +++ b/package/mariadb/mariadb.mk
> @@ -22,6 +22,9 @@ MARIADB_DEPENDENCIES = \
>   	libxml2 \
>   	readline
>   
> +HOST_MARIADB_DEPENDENCIES = \
> +	host-openssl
> +
>   # We won't need unit tests
>   MARIADB_CONF_OPTS += -DWITH_UNIT_TESTS=0
>   
Acked-by: Ryan Coe <bluemrp9@gmail.com>
