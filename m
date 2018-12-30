From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 22:50:06 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/lua-std-debug: new package
In-Reply-To: <CADvTj4pp1AXkige=X5PKOyPk01daPkHyjA194GQYRSQPnu=SGw@mail.gmail.com>
References: <1546049245-22865-1-git-send-email-james.hilliard1@gmail.com>
 <20181230145330.3f930031@windsurf>
 <CADvTj4pp1AXkige=X5PKOyPk01daPkHyjA194GQYRSQPnu=SGw@mail.gmail.com>
Message-ID: <20181230225006.157b6c31@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello James,

On Sun, 30 Dec 2018 15:38:02 -0600, James Hilliard wrote:

> Yeah, I didn't do that for these since I was adding these packages
> only since they were required for the luaposix version bump, I also
> don't normally write anything in lua(I'm primarily a python developer)
> but needed to use lua for the built in script interface in the
> swupdate package for automatic disk formatting and installation.

OK, understood. But by default, we expect people who add new packages
to be willing to take care of them, at least to some extent.


> > This dependency is not needed: all Lua modules inclusions in
> > package/Config.in are already enclosed in a
> > BR2_PACKAGE_HAS_LUAINTERPRETER & !BR2_STATIC_LIBS condition.  
> Yeah, I wasn't sure what was supposed to be there, I copied that from luaposix.

A number of other Lua packages have this redundant dependency. I have
sent a patch to remove it: http://patchwork.ozlabs.org/patch/1019425/.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
