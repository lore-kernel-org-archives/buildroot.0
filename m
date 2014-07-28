From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Jul 2014 09:14:01 +0200
Subject: [Buildroot] [PATCH] uclibc: build tests after uClibc libs are
 installed to staging location
In-Reply-To: <1406531251.3364.2.camel@abrodkin-8560l.internal.synopsys.com>
References: <1406039278-19117-1-git-send-email-abrodkin@synopsys.com>
 <1406531251.3364.2.camel@abrodkin-8560l.internal.synopsys.com>
Message-ID: <20140728091401.3377885a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Mon, 28 Jul 2014 07:07:31 +0000, Alexey Brodkin wrote:

> > And the simplest solution is to build tests right before installation in
> > UCLIBC_INSTALL_TARGET_CMDS which follows UCLIBC_INSTALL_STAGING_CMDS so
> > all required libs are in place.
> > 
> > Interesting note - if one enables uClibc tests after initial full buildroot
> > build mentioned errors don't happen. This is because uClibc libc libs are
> > already installed to staging. That's why I didn't noticed this problem before.
> 
> I'm wondering if there're any comments on this one?

On my side, I'm not really happy with the fact of building things in
INSTALL_TARGET_CMDS, but it's true that the C library is kind of a
special case. Any opinion from others?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
