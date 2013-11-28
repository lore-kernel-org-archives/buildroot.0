From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Nov 2013 13:29:14 +0100
Subject: [Buildroot] [PATCHv3 2/5] core: allow external
 Config.in/makefile	code to be integrated
In-Reply-To: <OF48FFD9A9.EDDCA00F-ON86257C31.0040FD2E-86257C31.0042CA75@rockwellcollins.com>
References: <20131128094342.3f6c84e4@skate>
 <1745239489.15294056.1385631446992.JavaMail.root@openwide.fr>
 <20131128123359.6341f14e@skate>
 <OF48FFD9A9.EDDCA00F-ON86257C31.0040FD2E-86257C31.0042CA75@rockwellcollins.com>
Message-ID: <20131128132914.1e0a6ae2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Thu, 28 Nov 2013 06:09:33 -0600, Ryan Barnett wrote:

> > Ok, I think I see what you mean: creating
> > $(BR2_EXTERNAL)/package/Config.in automatically if it doesn't
> > exist. I don't have a really strong feeling about this, but my
> > initial reaction is that it's better to let the user do that by
> > himself. BR2_EXTERNAL is part of the user source tree, and I hate
> > when tools mess up with my source tree by creating files here and
> > there automatically.
> 
> I'm in agreement with Thomas on this issue. I would prefer it if the
> user has to create the file (even with it being blank). However,
> maybe we could a test within the main makefile that if BR2_EXTERNAL
> is used and there is no "package/Config.in" present we through a make
> error prompt the user to create this file. I prefer this method since
> it would be teaching the user how to correctly use this feature
> instead of doing some hidden "auto-magic".

I don't think anything special is needed. With the current patch set
(v3), if the package/Config.in file is missing in the BR2_EXTERNAL
directory, the error is quite obvious:

$ make BR2_EXTERNAL=/tmp/koin menuconfig
package/Config.in:1000: can't open file "/tmp/koin/package/Config.in"
make: *** [menuconfig] Error 1
$

(The /tmp/koin directory is empty)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
