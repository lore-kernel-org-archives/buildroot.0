From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Jun 2017 17:40:32 +0200
Subject: [Buildroot] [PATCH v2 1/1] fcgiwrap: Disable -Werror in CFLAGS
 set by configure.
In-Reply-To: <20170619135953.16205-2-thomas.claveirole@green-communications.fr>
References: <20170619135953.16205-1-thomas.claveirole@green-communications.fr>
 <20170619135953.16205-2-thomas.claveirole@green-communications.fr>
Message-ID: <20170619174032.4f597cb2@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Jun 2017 15:59:53 +0200, Thomas Claveirole wrote:

> +FCGIWRAP_CONF_OPTS += CFLAGS='-Wno-error $(TARGET_CFLAGS)'

Should be:

FCGIWRAP_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -Wno-error"

I.e:

 - Use CONF_ENV, not CONF_OPTS, since we pass the original CFLAGS in
   CONV_ENV

 - Use double quotes instead of simple quotes

 - Pass your option *after* TARGET_CFLAGS.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
