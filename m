From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 20:51:51 +0100
Subject: [Buildroot] [PATCH 2/2] squid: add sysv initscript
In-Reply-To: <1421262884-5512-2-git-send-email-gustavo@zacarias.com.ar>
References: <1421262884-5512-1-git-send-email-gustavo@zacarias.com.ar>
 <1421262884-5512-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150114205151.18568a75@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 14 Jan 2015 16:14:44 -0300, Gustavo Zacarias wrote:

> diff --git a/package/squid/S97squid b/package/squid/S97squid
> new file mode 100755
> index 0000000..b30af5b
> --- /dev/null
> +++ b/package/squid/S97squid
> @@ -0,0 +1,40 @@
> +#!/bin/sh
> +
> +[ -x /usr/sbin/squid ] || exit 0
> +[ -f /etc/squid.conf ] || exit 0

I must say I'm not very happy with those "if something is missing,
let's bail out silently" tests. We're doing the same in other init
scripts (as we discussed on IRC), but I think we should probably
rethink that a bit, and at least display an error message.

Also, checking for /usr/sbin/squid sound a bit silly, since the init
script is installed by the squid package, which also has installed the
squid binary.

I've nonetheless applied. Follow-up patches welcome, maybe as part of a
more global overhaul of our init scripts.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
