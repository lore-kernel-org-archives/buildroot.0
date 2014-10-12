From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 09:18:18 +0200
Subject: [Buildroot] libdaemons localstatedir /usr/var
In-Reply-To: <5439D19D.2030706@posteo.de>
References: <5439D19D.2030706@posteo.de>
Message-ID: <20141012091818.04db85ae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sun, 12 Oct 2014 02:55:57 +0200, J?rg Krause wrote:
> I have a package which uses libdaemon for running as a daemoon and for 
> creating the pid file. libdaemons default directory for opening the pid 
> file is /usr/var/run. However, buildroot does not create this directory 
> in the output directory by default. The package compiles successfully 
> but fails to run because of the missing directory.
> 
> How should I deal with this?
> 
> 1) patch libdaemon.mk: LIBDAEMON_CONF_OPTS = ... --localstatedir=/var
> 2) add /usr/var/run to my rootfs overlay directory
> 
> What do you think? Any other suggestions?

I'd say (1).

Isn't --localstatedir a common autoconf variable ? I see 26 packages
passing --localstatedir=/var in Buildroot. Maybe it's time to move as a
common definition, like --prefix=/usr ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
