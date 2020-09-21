From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Sep 2020 10:20:13 +0200
Subject: [Buildroot] [PATCH v1 2/3] package/postgresql: needs locale
 command
In-Reply-To: <20200920150659.7562-2-ps.report@gmx.net>
References: <20200920150659.7562-1-ps.report@gmx.net>
 <20200920150659.7562-2-ps.report@gmx.net>
Message-ID: <20200921102013.622616ed@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Sep 2020 17:06:58 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Running (as e.g. /etc/init.d/S50postgresql does):
> 
>   su - postgres -c '/usr/bin/pg_ctl initdb -D /var/lib/pgsql'
> 
> gives the following warning:
> 
>   performing post-bootstrap initialization ... sh: locale: not found
>   1970-01-01 01:13:43.498 UTC [246] WARNING:  no usable system locales were found
>   ok

What is the situation with uClibc and musl toolchains ? Do they provide
the "locale" command as well ?

What about external glibc toolchains ? Do we install/copy the locale
tool to the target ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
