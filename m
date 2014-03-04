From: Jeremy Kerr <jk@ozlabs.org>
Date: Tue, 04 Mar 2014 09:51:13 +0800
Subject: [Buildroot] [RFC,
 PATCH 2/8] package/dropbear: Add separate configuration options for
 client and server
In-Reply-To: <5315300C.60102@zacarias.com.ar>
References: <1389862338.918265.958087681541.2.gpush@pablo>
 <53151AFC.3010402@zacarias.com.ar> <53152757.2020707@ozlabs.org>
 <5315300C.60102@zacarias.com.ar>
Message-ID: <53153191.9050506@ozlabs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

>> There are some scenarios where there's no point starting a SSH server
>> (in my case, it's because there's no persistent storage, so no
>> persistent host keys). However, I'd still like a ssh/scp client to be
>> available.
> 
> Well you'll want at least one of the options of dropbear, there's no
> point in excluding both.
> My common sense tells me you'll always want the client anyway, it's no
> security threat or space-consuming menace, so why not add just a SERVER
> option maybe?
> BR2_PACKAGE_DROPBEAR -> builds and install the client portion.
> BR2_PACKAGE_DROPBEAR_SERVER -> installs the server bits (default=y for
> compatibility reasons).

That sounds pretty good to me too. I'd be happy to implement whatever
the general consensus is :)

>> But isn't something that will go upstream and be available in a
>> defconfig, right?
> 
> That's still open to debate, until now all defconfigs were supposed to
> be minimal, but there's a growing consensus that featured or demo
> defconfigs are desired and useful.

OK, understood.

If the defconfig isn't upstream, I'd need to provide both a config and a
postinst script, and whoever is replicating the build needs to point the
config to the postinst script correctly. Having the dropbear server
available as a simple config option allows me to either use a defconfig,
or provide a single defconfig file, to allow others to build a
petitboot-compatible builtroot image, without having to mess around too
much.

Cheers,


Jeremy
