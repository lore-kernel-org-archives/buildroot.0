From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Aug 2012 14:30:17 +0200
Subject: [Buildroot] Suggestion: increase username buffer size in
 busybox login
In-Reply-To: <CADiAo4Jn7525qF0+_mXhDT2j5-k+W-SCsXf1x8oaAEuNvWz66g@mail.gmail.com>
References: <CADiAo4LZ0e=Goo13SKodFo6PL0iEsVG5tPsdQ6jp6yhOsBX4DQ@mail.gmail.com>
 <201208141907.13002.yann.morin.1998@free.fr>
 <CADiAo4Jn7525qF0+_mXhDT2j5-k+W-SCsXf1x8oaAEuNvWz66g@mail.gmail.com>
Message-ID: <20120817143017.65099bd6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 14 Aug 2012 23:18:16 -0400,
Dmitry Golubovsky <golubovsky@gmail.com> a ?crit :

> Well, the busybox developers stick with the original Unix spec
> limiting username length at 32 chars:
> 
> http://lists.busybox.net/pipermail/busybox/2012-August/078256.html
> 
> So I am repeating my question: is anybody among Buildroot users also
> interested in such patching of busybox: in case longer usernames (like
> firstname.lastname at host.example.org) are desired, increase the
> username buffer in login.c to 256 characters?

This should not be implemented in Buildroot, as we don't want to keep
such "feature" patches on our packages. Make a patch to Busybox that
turns this into a configurable value, so that by default the length of
32 characters is used, but a Busybox configuration option allows to
extend that. Then, Buildroot users interested by this feature can
create a custom Busybox configuration.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
