From: Andrew Webster <Awebster@arcx.com>
Date: Tue, 7 Jun 2016 20:37:51 +0000
Subject: [Buildroot] [PATCH v6 3/3] docker-engine: new package
In-Reply-To: <CA+h8R2oZypDvm65RVp3fNX1MYCxSWqX95MxLW-q-K25d4tNccg@mail.gmail.com>
References: <1464475578-22239-1-git-send-email-christian@paral.in>
 <1464475578-22239-4-git-send-email-christian@paral.in>
 <f27fd228ed034bc499fe1c69ac9a3980@WEBMAIL.arcx.com>
 <20160607215439.76ad85ee@free-electrons.com>
 <CA+h8R2oZypDvm65RVp3fNX1MYCxSWqX95MxLW-q-K25d4tNccg@mail.gmail.com>
Message-ID: <59dc9de3a6b14bf5be1c61368dc0cbde@WEBMAIL.arcx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: Christian Stewart [mailto:christian at paral.in] 
> Sent: Tuesday, June 07, 2016 4:18 PM

> > Does it makes sense to also add selects for BR2_PACKAGE_IPTABLES and
> > BR2_PACKAGE_CA_CERTIFICATES here?? They are not build dependencies,
> > but run-time dependencies.? It may be possible to do some things
> > without the certificates, but I think iptables is always required.

> Not sure if these are actually required. The iptables calls are direct, not through calling a cli.

On my system, if I don't have the iptables executable in the path, docker fails to start with the following:

FATA[0001] Error starting daemon: Error initializing network controller: error obtaining controller instance: failed to create NAT chain: Iptables not found

Have I misconfigured something?

> Certs are a different story but that might be out of the scope of the Docker package. It can run stuff locally without hitting the internet at all.

Yup.  I guess there's no formal way to "recommend" a package.

> > On a similar topic, docker expects a bunch of cgroup mounts to exist
> > somewhere on the system.? Is this something that should be left up to
> > the rootfs author (in which case maybe the help could be extended to
> > explain this), or should the docker-engine recipe attempt to modify
> > fstab somehow?? I'm not sure if there is a way to actually do that
> > though.

> This is unnecessary. On all of the systems I'm running, with NO fstab modifications or really anything but enabling the Docker package, it works fine. Docker might be doing the mounting automatically.

You are correct.  This was my fault, I missed doing the mounts in the init.  Let me correct it, then I'll send it out.

Andrew
