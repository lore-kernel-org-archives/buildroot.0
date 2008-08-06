From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 6 Aug 2008 15:27:33 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: fix missing dependencies
	in	unpacked and config rules
In-Reply-To: <87zlnq1eu3.fsf@macbook.be.48ers.dk>
References: <1217323007-10041-1-git-send-email-hans-christian.egtvedt@atmel.com>
	<87zlnq1eu3.fsf@macbook.be.48ers.dk>
Message-ID: <20080806132733.GA9020@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 06, 2008 at 02:57:08PM +0200, Peter Korsgaard wrote:
>>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:
>
> Hans-Christian> This patch adds depedency to host-sed and
> Hans-Christian> $(PROJECT_BUILD_DIR) when running make busybox-config
> Hans-Christian> and busybox-unpacked.
>
>Thanks, committed as r23065.

Does that really work?

Please
$ chmod -x $(which sed)
on your build host, so that host-sed has to be actually be built (ISTR
that we rightfully use the busybox sed in this case)
then wipe your obj trees and
$ cp -a my_toplevel_config.BAK .config
$ make busybox-menuconfig

I think that if you had a pristine tree and copyied a backed-up
br2.config to the toplevel, that you could (previously) run all
menuconfig targets (with a disfunctional sed on your host).
