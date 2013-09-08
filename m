From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 08 Sep 2013 21:52:39 +0200
Subject: [Buildroot] [PATCH v3 1/2] libssh2: add package
In-Reply-To: <1377871785-4964-2-git-send-email-rjbarnet@rockwellcollins.com>
 (Ryan Barnett's message of "Fri, 30 Aug 2013 09:09:44 -0500")
References: <1377871785-4964-1-git-send-email-rjbarnet@rockwellcollins.com>
 <1377871785-4964-2-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <87zjrnxf94.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <rjbarnet@rockwellcollins.com> writes:

 Ryan> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
 Ryan> ---

 Ryan> Change from v2 -> v3:
 Ryan>   * Use else when selecting configure and dependancy options with using
 Ryan>     libgcrypt or openssl (suggested by Baruch Siach)

Committed with minor tweaks (see below) - Thanks.

 Ryan> diff --git a/package/libssh2/Config.in b/package/libssh2/Config.in
 Ryan> new file mode 100644
 Ryan> index 0000000..1fb89ff
 Ryan> --- /dev/null
 Ryan> +++ b/package/libssh2/Config.in
 Ryan> @@ -0,0 +1,11 @@
 Ryan> +config BR2_PACKAGE_LIBSSH2
 Ryan> +	bool "libssh2"
 Ryan> +	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
 Ryan> +	help
 Ryan> +	  libssh2 is a client-side C library implementing the SSH2 protocol 
 Ryan> +	  as defined by Internet Drafts: SECSH-TRANS(22), SECSH-USERAUTH(25), 
 Ryan> +	  SECSH-CONNECTION(23), SECSH-ARCH(20), SECSH-FILEXFER(06)*, 
 Ryan> +	  SECSH-DHGEX(04), and SECSH-NUMBERS(10)

Trailing spaces.

 Ryan> +
 Ryan> +	  http://www.libssh2.org/
 Ryan> +

You shouldn't have an empty line after the URL.

 Ryan> diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
 Ryan> new file mode 100644
 Ryan> index 0000000..af93d61
 Ryan> --- /dev/null
 Ryan> +++ b/package/libssh2/libssh2.mk
 Ryan> @@ -0,0 +1,32 @@
 Ryan> +#############################################################

The '####' lines should be 80 chars long.

-- 
Bye, Peter Korsgaard
