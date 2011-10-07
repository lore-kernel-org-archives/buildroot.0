From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 07 Oct 2011 09:01:05 +0200
Subject: [Buildroot] [PATCHv4] package: add the poco C++ libraries
	collection
In-Reply-To: <854bf06beba00ffd6f7db32329490f0374347b3d.1317715247.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 4 Oct 2011 10:02:03 +0200")
References: <854bf06beba00ffd6f7db32329490f0374347b3d.1317715247.git.baruch@tkos.co.il>
Message-ID: <87pqi92slq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 Baruch> Add the C++ Portable Components libraries.
 Baruch> The Data/ODBC components is disabled because its dependency (unixODBC) is not
 Baruch> in Buildroot.

 Baruch> The Data/MySQL component is build tested only. It probably requires an
 Baruch> additional RPATH to actually run, because libmysqlclient resides in a
 Baruch> non-standard location under /usr/lib/mysql.
 
 Baruch> diff --git a/package/poco/Config.in b/package/poco/Config.in
 Baruch> new file mode 100644
 Baruch> index 0000000..a815a09
 Baruch> --- /dev/null
 Baruch> +++ b/package/poco/Config.in
 Baruch> @@ -0,0 +1,57 @@
 Baruch> +config BR2_PACKAGE_POCO
 Baruch> +	bool "poco"
 Baruch> +	select BR2_PACKAGE_ZLIB
 Baruch> +	select BR2_PACKAGE_PCRE
 Baruch> +	select BR2_INSTALL_LIBSTDCPP
 Baruch> +	select BR2_USE_WCHAR

We use 'depends on' for toolchain options, as you cannot easily change
those. Other than that it looks good, committed - Thanks.

-- 
Bye, Peter Korsgaard
