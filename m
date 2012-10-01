From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 1 Oct 2012 10:40:34 +0200
Subject: [Buildroot] Fwd: Re: Basic questions about using BuildRoot
In-Reply-To: <506950E1.5050709@ronetix.at>
References: <CAAXf6LVtXq=OhWvqL27SzQjxUjOvd4yoisp1aAOUtqNSYJ1G0Q@mail.gmail.com>
 <5055A940.7070802@ronetix.at>
 <CAAXf6LXt1+Ee4B9BDE2ocj=6MqY0QdV5gMhn0x9JyTXR3zfyEw@mail.gmail.com>
 <5055C935.3050108@ronetix.at>
 <CAAXf6LUrzxDXUmLdwkKZFaB-H_q_XC+ybkt+_bBZO=0EgfbffA@mail.gmail.com>
 <5058F058.1020806@mind.be> <505AB58C.3030805@ronetix.at>
 <50641497.3030800@ronetix.at>
 <20120927115321.73a0e2b4@skate> <50643F2A.3010500@ronetix.at>
 <20120927142124.6abf0a75@skate> <5065ADE0.2030801@ronetix.at>
 <5066F4F9.7080201@ronetix.at> <5066FE59.9060600@relinux.de>
 <50670128.7090203@ronetix.at> <5067024A.9010609@relinux.de>
 <506950E1.5050709@ronetix.at>
Message-ID: <CAHXCMMJZVe_jTF8GNeTXdJG9PYt77C+Rk5YxXqUT8DnuxMGbuA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/10/1 Martin Peevski <martin@ronetix.at>:
[...]
> Now I need dhcp support to my board be possible get its IP from our tftp
> server. I can't found dhclient command on the target board. Also search for
> appropriate network package to be installed via make menuconfig but was
> impossible to find such a packet. Can you help me again?

To enable a dhcp client, you can:
- either look at the busybox-menuconfig and make sure 'udhcp client'
is selected:
make busybox-menuconfig
After that, rebuild busybox.
- or, in buildroot menuconfig: allow to 'Show packages that are also
provided by busybox', then select 'isc dhcp' and finally run 'make'.

It's up to you, depends on what you want ;)

Anyway, for further details, don't hesitate to look at:
http://buildroot.org/downloads/manual/manual.html

and give us your feedback.


Regards.

-- 
Sam
