From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 20:32:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcurl: introduce a 'small'
 config option
In-Reply-To: <20190206191305.18306-1-patrickdepinguin@gmail.com>
References: <20190206191305.18306-1-patrickdepinguin@gmail.com>
Message-ID: <20190206203207.0dc09362@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  6 Feb 2019 20:13:05 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> +config BR2_PACKAGE_LIBCURL_SMALL
> +	bool "disable non-basic features to reduce size"
> +	help
> +	  Compile libcurl only with basic features enabled, to save
> +	  about 50 KiB in the root filesystem.
> +
> +	  Following protocols/features are disabled:
> +	  - LDAP / LDAPS
> +	  - POP3 / IMAP / SMTP
> +	  - Telnet
> +	  - TFTP
> +	  - RTSP
> +	  - SMB / CIFS
> +	  - DICT
> +	  - Gopher
> +	  - Proxy support
> +	  - Cookie support

Discussing with Yann, we think that it would make sense to keep Proxy
support and Cookie support, which are both kind of expected for curl as
a tool for HTTP interaction. All the other features are not HTTP
related, so indeed it makes sense to disable them in this "small"
variant.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
