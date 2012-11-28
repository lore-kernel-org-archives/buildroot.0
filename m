From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Nov 2012 14:06:55 +0100
Subject: [Buildroot] [git commit branch/next] package: add gd package
In-Reply-To: <20121128052616.GA29377@sapphire.tkos.co.il>
References: <20121128011244.B677B8F461@busybox.osuosl.org>
 <20121128052616.GA29377@sapphire.tkos.co.il>
Message-ID: <20121128140655.094861cd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed, 28 Nov 2012 07:26:17 +0200, Baruch Siach wrote:

> On Tue, Nov 27, 2012 at 11:21:06AM -0800, Peter Korsgaard wrote:
> 
> [...]
> 
> > +GD_TOOLS_                         	+= gdlib-config
> 
> Shouldn't this be 'GD_TOOLS_y'?

No, the idea is to have all tools to be kept in GD_TOOLS_y and all
tools to be removed in GD_TOOLS_. Since we always want to remove
gdlib-config from the target, we unconditionally add it to GD_TOOLS_.

> > +define GD_REMOVE_TOOLS
> > +	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(GD_TOOLS_))
> 
> And here.

No, that's correct. GD_TOOLS_ is the list of things to be removed.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
