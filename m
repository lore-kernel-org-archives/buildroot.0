From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Sep 2019 14:02:19 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/php-xdebug: new package
In-Reply-To: <f24884d9b449983b9630d2a5ab43823ec586affa.camel@orolia.com>
References: <20190925114456.16388-1-nicolas.carrier@orolia.com>
 <f24884d9b449983b9630d2a5ab43823ec586affa.camel@orolia.com>
Message-ID: <20190925140219.1a0681ef@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 Sep 2019 12:00:19 +0000
Nicolas Carrier <nicolas.carrier@orolia.com> wrote:

> I tried to address all your comments, but:
>  * I didn't manage to use test-pkg, I ran:
>        ./utils/test-pkg -p php-xdebug -c php-xdebug.config
>    but only got a bunch of [...] SKIPPED messages
>    (same with -a).
>    php-xdebug.config's content was:
>        BR2_PACKAGE_PHP_XDEBUG=y

You also need:

BR2_PACKAGE_PHP=y

Because PHP_XDEBUG=y has a depends on BR2_PACKAGE_PHP, if you don't
also enable BR2_PACKAGE_PHP in your config fragment,
BR2_PACKAGE_PHP_XDEBUG=y will be discarded as it has an unmet
dependency.

>  * I didn't manage either to use check-package. I ran:
>        $ ./utils/check-package package/php-xdebug/*
>    _before_ fixing the two errors Arnout mentioned in the Config.in,
>    but just got:
>        36 lines processed
>        0 warnings generated

Well, 36 lines were processed, and no warnings were generated, so
you're all good.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
