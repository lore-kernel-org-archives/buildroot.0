From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Oct 2011 19:17:31 +0200
Subject: [Buildroot] [RFC] Slides "Using Buildroot for real projects"
In-Reply-To: <201110241842.06558.yann.morin.1998@anciens.enib.fr>
References: <20111017184718.71afc290@skate> <20111023123755.GA2455@tarshish>
 <20111024173250.7e598d6f@skate>
 <201110241842.06558.yann.morin.1998@anciens.enib.fr>
Message-ID: <20111024191731.4562621a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 24 Oct 2011 18:42:06 +0200,
"Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> a ?crit :

> The problem is that /bin/sh might be whatever. With a POSIX-conformant
> /bin/sh (eg. dash), this is true. With bash, it is not. Alas, many
> systems still have bash as /bin/sh.
> 
> $ ls -l /bin/sh
> lrwxrwxrwx 1 root root 4 May 17 23:53 /bin/sh -> bash
> $ echo "bli\nbla"
> bli\nbla
> $ /bin/bash
> $ echo "bli\nbla"
> bli\nbla
> $ exit
> $ /bin/dash
> $ echo "bli\nbla"
> bli
> bla
> 
> The answer it to use printf [0].
> 
> I now use printf as much as I can. printf is in POSIX and does not suffer
> from all the discrepancies there are in the many echo implementations.

Ah, nice to know. Thanks!

For the moment, I've been using echo, knowing that its behavior is not
consistent across systems. But indeed printf is much better.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
