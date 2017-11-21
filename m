From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Nov 2017 09:12:18 +0100
Subject: [Buildroot] ZeroMQ Version 4.2.X for POLLPRI
In-Reply-To: <YTOPR0101MB12259ED71BEB34B7087A2FD1EC220@YTOPR0101MB1225.CANPRD01.PROD.OUTLOOK.COM>
References: <YTOPR0101MB12259ED71BEB34B7087A2FD1EC220@YTOPR0101MB1225.CANPRD01.PROD.OUTLOOK.COM>
Message-ID: <20171121091218.037a1860@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Nov 2017 22:38:48 +0000, Danick Desjardins wrote:

> I need a feature of ZMQ related to POLLPRI to get interrupts from
> GPIO fds. This feature is only available on ZeroMQ 4.2.x and above.
> 
> Looking at the master branch the version is only at 4.1.6. Just
> curious to know if there is any reason this is being held back.

Nope, just that nobody sent a patch to update ZeroMQ.

> I am manually updating it to 4.2.2 locally for my purpose but was
> curious if there were any gotchas with moving to a more recent
> version that people know about.

I don't think we're aware of any gotcha, but as a user of ZeroMQ, you
are probably more likely to know if the 4.2 version of ZeroMQ
introduces changes that are likely to break other packages that use
ZeroMQ.

As part of your ZeroMQ bump, I'd recommend testing a few of the
packages that depend on ZeroMQ, to make sure everything is still OK:

package/azmq/Config.in: select BR2_PACKAGE_ZEROMQ
package/cppzmq/Config.in:       select BR2_PACKAGE_ZEROMQ
package/czmq/Config.in: select BR2_PACKAGE_ZEROMQ
package/filemq/Config.in:       select BR2_PACKAGE_ZEROMQ
package/mongrel2/Config.in:     select BR2_PACKAGE_ZEROMQ
package/php-zmq/Config.in:      select BR2_PACKAGE_ZEROMQ
package/python-pyzmq/Config.in: select BR2_PACKAGE_ZEROMQ
package/swupdate/Config.in:       * Select BR2_PACKAGE_ZEROMQ to add support for using a remote
package/swupdate/swupdate.mk:ifeq ($(BR2_PACKAGE_ZEROMQ),y)
package/zmqpp/Config.in:        select BR2_PACKAGE_ZEROMQ
package/zyre/Config.in: select BR2_PACKAGE_ZEROMQ

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
