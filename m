From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Date: Mon, 19 Jun 2017 18:26:04 +0200
Subject: [Buildroot] [PATCH v3 0/1] fcgiwrap: Disable -Werror in CFLAGS set
	by configure.
In-Reply-To: <20170619174032.4f597cb2@windsurf.lan>
References: <20170619174032.4f597cb2@windsurf.lan>
Message-ID: <20170619162605.30831-1-thomas.claveirole@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Should be:
>
> FCGIWRAP_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -Wno-error"
>
> I.e:
>
>  - Use CONF_ENV, not CONF_OPTS, since we pass the original CFLAGS in
>    CONV_ENV
>
>  - Use double quotes instead of simple quotes
>
>  - Pass your option *after* TARGET_CFLAGS.

Done, thanks.

Thomas Claveirole (1):
  fcgiwrap: Disable -Werror in CFLAGS set by configure.

 package/fcgiwrap/fcgiwrap.mk | 1 +
 1 file changed, 1 insertion(+)

-- 
2.11.0
