From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2011 00:34:19 +0200
Subject: [Buildroot] libssp still missing from target
In-Reply-To: <j1eiv7$irk$1@dough.gmane.org>
References: <j1eiv7$irk$1@dough.gmane.org>
Message-ID: <20110805003419.4934e4bf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Thu, 4 Aug 2011 16:56:07 +0000 (UTC),
Grant Edwards <grant.b.edwards@gmail.com> a ?crit :

> This has come up before, and IIRC, I ended up tweaking ext-tool.mk to
> work around it.
> 
> I've just upgraded to Buildroot 2011.05, and it seems ext-tool.mk
> still isn't copying libssp to the target. It's need by (among other
> things) ssh:
> 
>   Starting network...
>   ip: RTNETLINK answers: File exists
>   Generating ECDSA Key...
>   THIS CAN TAKE A MINUTE OR TWO DEPENDING ON YOUR PROCESSOR!
> 
>   /usr/bin/ssh-keygen: can't load library 'libssp.so.0'
>   Starting sshd: /usr/sbin/sshd: can't load library 'libssp.so.0'
> 
> Is there some configuration option I've missed?

I guess libssp only exists on toolchains that have stack protection
support enabled. None of my CodeSourcery or Buildroot-built toolchains
have a libssp. I guess I'll have to build a CT-NG toolchain with libssp
support.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
