From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Mon, 28 Jan 2013 08:59:54 +0100 (CET)
Subject: [Buildroot] Linux and busybox-configfiles
In-Reply-To: <5105ABE8.70409@mind.be>
Message-ID: <05c8d4c7-f0f3-4ef2-a0c9-615c16096b73@zimbra2.corp.accelance.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> More generically, I expect I
> can do:
> 
>   make foo_defconfig
>   Do all kinds of weird stuff that completely messes things up
>   make clean
>   make
> 

I'd tend to disagree on that one... 

when using the kernel (or buildroot for that matter) that sequence would use your .config configuration, not the foo_defconfig

to get the foo_defconfig back in place the sequence would be

make foo_defconfig
<weird stuff>
make clean
make foo_defconfig
make

you need that call to override your .config and I think that's the behaviour people would expect i.e the philosophy would be

"make clean doesn't touch your configuration, only explicit make targets are allowed to touch your configuration"

would it make sense to have a "kconfig-target" generic infrastructure in buildroot for all packages that use kconfig like configuration ?



Regards
J?r?my
