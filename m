From: Mauro Condarelli <mc5686@mclink.it>
Date: Thu, 26 May 2016 14:11:05 +0200
Subject: [Buildroot] auto login
In-Reply-To: <CAG7w3y=RoEyLovRoYeNjf1uhRw3TZrVZdyNEFMQan4T99GQwyg@mail.gmail.com>
References: <CAG7w3y=RoEyLovRoYeNjf1uhRw3TZrVZdyNEFMQan4T99GQwyg@mail.gmail.com>
Message-ID: <0ddfa798-219c-bc26-d5be-75623c30529c@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gdbabu.

Il 26/05/2016 11:53, gdbabu Krishnan ha scritto:
> HI,
>
> i am working with buildroot for raspberry pi, i have successfully  build image for pi board, i have some doubts,
>
>
> 1. how can i do  auto login
>
> 2.run X11 after boot completed by "startx" command.
It depends on which kind od startup (/sbin/init) You are using.
Assuming You are using the basic Busybox init (or any kind of sysV init) you have
to modify /etc/inittab.

This is normal *nix administration and has nothing to do with Buildroot.
Notice "init" service provided by Busybox is rather limited compared to standard
sysV init; see https://git.busybox.net/busybox/tree/examples/inittab

For Your problems make sure You have something like:|

::askfirst:-/bin/sh|
|||::respawn:/usr/bin/startx|
||

|Regards Mauro |
