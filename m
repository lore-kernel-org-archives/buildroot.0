From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 24 Jan 2012 14:50:28 +0100
Subject: [Buildroot] [PATCH v2 2/2] sqlcipher: new package
In-Reply-To: <1327350205-25669-2-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Mon, 23 Jan 2012 21:23:25 +0100")
References: <1327350205-25669-1-git-send-email-arnout@mind.be>
 <1327350205-25669-2-git-send-email-arnout@mind.be>
Message-ID: <8762g19pln.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> SQLCipher is a fork of SQLite that adds AES encryption using OpenSSL.
 Arnout> It relies on tcl to generate some of its source code, so host-tcl is
 Arnout> required.

 Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Arnout> ---
 Arnout> v2: Added forgotten dependency on host-tcl
 Arnout> ---
 Arnout>  package/Config.in              |    1 +
 Arnout>  package/sqlcipher/Config.in    |   27 ++++++++++++++++++
 Arnout>  package/sqlcipher/sqlcipher.mk |   58 ++++++++++++++++++++++++++++++++++++++++
 Arnout>  3 files changed, 86 insertions(+), 0 deletions(-)
 Arnout>  create mode 100644 package/sqlcipher/Config.in
 Arnout>  create mode 100644 package/sqlcipher/sqlcipher.mk

 Arnout> diff --git a/package/Config.in b/package/Config.in
 Arnout> index f219e37..b245da8 100644
 Arnout> --- a/package/Config.in
 Arnout> +++ b/package/Config.in
 Arnout> @@ -272,6 +272,7 @@ endmenu
 Arnout>  menu "Database"
 Arnout>  source "package/berkeleydb/Config.in"
 Arnout>  source "package/mysql_client/Config.in"
 Arnout> +source "package/sqlcipher/Config.in"
 Arnout>  source "package/sqlite/Config.in"
 Arnout>  endmenu
 
 Arnout> diff --git a/package/sqlcipher/Config.in b/package/sqlcipher/Config.in
 Arnout> new file mode 100644
 Arnout> index 0000000..bf77307
 Arnout> --- /dev/null
 Arnout> +++ b/package/sqlcipher/Config.in
 Arnout> @@ -0,0 +1,27 @@
 Arnout> +config BR2_PACKAGE_SQLCIPHER
 Arnout> +	bool "sqlcipher"
 Arnout> +	depends on !BR2_PACKAGE_SQLITE
 Arnout> +	help

You forgot to select BR2_PACKAGE_OPENSSL. Otherwise it looks good -
Committed, thanks.

-- 
Bye, Peter Korsgaard
