From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Aug 2012 11:19:51 +0200
Subject: [Buildroot] A little summer game ? :-)
In-Reply-To: <501B9416.3090700@lucaceresoli.net>
References: <1343962432-2772-1-git-send-email-danomimanchego123@gmail.com>
 <20120803103052.5ec63fb7@skate> <501B9416.3090700@lucaceresoli.net>
Message-ID: <20120803111951.2269f1ca@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Fri, 03 Aug 2012 11:04:22 +0200,
Luca Ceresoli <luca@lucaceresoli.net> a ?crit :

> Wheee, what a fun, Thomas! Call it "Buildroot Summer Of Bugfix" and
> people will flock in! :-D

I like this name, adopted! :-)

> Seriously, I admit I'm not investing a lot of time in fixing build
> errors. This is in part due to the limited time available, but
> another important blocking factor is that many build errors happen
> with external, custom toolchains that are installed on your build
> server.
> 
> I almost daily skim through the build failures and take a look at
> those about by packages and/or architectures I use and somehow know.
> These are already a small subset of all the possibilities.
> But often I discover these happen with toolchains (and probably
> architectures) I don't have an easy access to, so I just go along.
> 
> It would help if the external toolchains used for the builds were
> always available within Buildroot, so we could just apply the
> [def]config, run make, have an icy drink while it downloads and
> fails building and then, happily refreshed, hunt for the bug.
> 
> I'm not saying this would be easy to do, but it would be helpful
> to me.

Yes, I know this is a problem with the current autobuilders. My plan is
to make the tarballs of those external toolchains available somewhere,
so that people can easily install them as well. But that will take a
bit of time, and still leave some work when you want to reproduce a bug
(download the external toolchain, download .config, adjust .config to
match the path of the external toolchain on your local machine, build).
Or maybe, I should put all of them somewhere, and have my defconfig
download them from this common place. This could be a good idea to make
it easier to reproduce the build problems.

Also, there is a problem with BR external toolchains that are not (yet)
relocatable. I can create a tarball for them, but it will force you to
install them to /home/test/toolchains/... which is the location where
they are built on my build server. I guess the best solution for this
is just to make Buildroot toolchains relocatable :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
