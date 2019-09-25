From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Wed, 25 Sep 2019 12:37:50 +0000
Subject: [Buildroot] [PATCH v2 1/1] package/php-xdebug: new package
In-Reply-To: <20190925140219.1a0681ef@windsurf>
References: <20190925114456.16388-1-nicolas.carrier@orolia.com>
 <f24884d9b449983b9630d2a5ab43823ec586affa.camel@orolia.com>
 <20190925140219.1a0681ef@windsurf>
Message-ID: <bbca9c4f58a19ceb783d3c6fec19c9b44f5e81cf.camel@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2019-09-25 at 14:02 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 25 Sep 2019 12:00:19 +0000
> Nicolas Carrier <nicolas.carrier@orolia.com> wrote:
> 
> > I tried to address all your comments, but:
> >  * I didn't manage to use test-pkg, I ran:
> >        ./utils/test-pkg -p php-xdebug -c php-xdebug.config
> >    but only got a bunch of [...] SKIPPED messages
> >    (same with -a).
> >    php-xdebug.config's content was:
> >        BR2_PACKAGE_PHP_XDEBUG=y
> 
> You also need:
> 
> BR2_PACKAGE_PHP=y

Ha! Thank you, that was it, now the tests ran and gave:

                             br-arm-full [1/6]: OK
                  br-arm-cortex-a9-glibc [2/6]: OK
                   br-arm-cortex-m4-full [3/6]: SKIPPED
                          br-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: SKIPPED
                            sourcery-arm [6/6]: OK
6 builds, 2 skipped, 0 build failed, 0 legal-info failed

> Because PHP_XDEBUG=y has a depends on BR2_PACKAGE_PHP, if you don't
> also enable BR2_PACKAGE_PHP in your config fragment,
> BR2_PACKAGE_PHP_XDEBUG=y will be discarded as it has an unmet
> dependency.
> 
> >  * I didn't manage either to use check-package. I ran:
> >        $ ./utils/check-package package/php-xdebug/*
> >    _before_ fixing the two errors Arnout mentioned in the
> > Config.in,
> >    but just got:
> >        36 lines processed
> >        0 warnings generated
> 
> Well, 36 lines were processed, and no warnings were generated, so
> you're all good.

Ok, I voluntarily spoiled the .mk file by removing its header comments
and got warnings this time.
I was surprised since the two mistakes I had made should have triggered
warnings according to Arnout's saying.

(Note that this doesn't excuse me for not having ran check -package
initially ^^)

> 
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> ATTENTION: This email came from an external source.
> Do not open attachments or click on links from unknown senders or
> unexpected emails.
