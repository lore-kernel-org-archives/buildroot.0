From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Thu, 16 Jul 2020 14:26:37 +0200
Subject: [Buildroot] audit2allow BR support
In-Reply-To: <20200716110524.5214d23a@windsurf.home>
References: <5696376.2474933.1594878993118.ref@mail.yahoo.com>
 <5696376.2474933.1594878993118@mail.yahoo.com>
 <20200716094540.27274cf4@windsurf.home>
 <159488904315.3198.6229972988341724924@kwain>
 <20200716110524.5214d23a@windsurf.home>
Message-ID: <159490239727.3198.17598205481021389208@kwain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Quoting Thomas Petazzoni (2020-07-16 11:05:24)
> On Thu, 16 Jul 2020 10:44:03 +0200
> Antoine Tenart <antoine.tenart@bootlin.com> wrote:
> > > > 2- /var/lib/selinux directory missing
> > > > $ semodule -llibsemanage.semanage_create_store: Could not create module store at /var/lib/selinux/targeted. (No such file or directory).libsemanage.semanage_direct_connect: could not establish direct connection (No such file or directory).semodule: Could not connect to policy handler
> > > > ls /var/lib/selinuxls: /var/lib/selinux: No such file or directory  
> > > > ==> looks like the directory can just be added    
> > > 
> > > On this one, I'm not sure, would need testing. I don't immediately see
> > > anything creating /var/lib/selinux in Buildroot, so if it's not done by
> > > the build system of one the SELinux packages, indeed /var/lib/selinux
> > > will be missing.
> > > 
> > > Antoine: you are working on building systems with SELinux supports, did
> > > you face the /var/lib/selinux missing problem ? Or perhaps because
> > > you're testing with systemd, the situation is different ?  
> > 
> > Using a modular policy at runtime isn't supported by the current
> > refpolicy support in BR. When playing with it, I had similar issues with
> > directories missing. Also, I don't think adding those directories alone
> > will make it working, there's probably more work to do.
> 
> How could have Tomas encountered this with the current Buildroot, where
> we don't even have the logic to build a modular policy ?

The refpolicy has no upstream support (in BR) to compile and install a
policy with modules; but the semodule tool can still be installed
(coming from policycoreutils). It's two different things.

If we want to improve things, we could have semodule only installed
conditionally when policycoreutils is selected.

Antoine

-- 
Antoine T?nart, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
