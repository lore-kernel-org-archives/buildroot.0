From: Stephan Hoffmann <sho@relinux.de>
Date: Mon, 01 Oct 2012 10:29:04 +0200
Subject: [Buildroot] Fwd: Re:  Basic questions about using BuildRoot
In-Reply-To: <506950E1.5050709@ronetix.at>
References: <CAAXf6LVtXq=OhWvqL27SzQjxUjOvd4yoisp1aAOUtqNSYJ1G0Q@mail.gmail.com>
 <5055A940.7070802@ronetix.at>
 <CAAXf6LXt1+Ee4B9BDE2ocj=6MqY0QdV5gMhn0x9JyTXR3zfyEw@mail.gmail.com>
 <5055C935.3050108@ronetix.at>
 <CAAXf6LUrzxDXUmLdwkKZFaB-H_q_XC+ybkt+_bBZO=0EgfbffA@mail.gmail.com>
 <5058F058.1020806@mind.be> <505AB58C.3030805@ronetix.at>
 <50641497.3030800@ronetix.at> <20120927115321.73a0e2b4@skate>
 <50643F2A.3010500@ronetix.at> <20120927142124.6abf0a75@skate>
 <5065ADE0.2030801@ronetix.at> <5066F4F9.7080201@ronetix.at>
 <5066FE59.9060600@relinux.de> <50670128.7090203@ronetix.at>
 <5067024A.9010609@relinux.de> <506950E1.5050709@ronetix.at>
Message-ID: <50695450.1010704@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 01.10.2012 10:14, schrieb Martin Peevski:
> On 29/09/12 17:14, Stephan Hoffmann wrote:
>> Am 29.09.2012 16:09, schrieb Martin Peevski:
>>
>> # ifconfig eth0 <IP-Adress> up
>> Probably, you do not have the correct entry in /etc/network/interfaces
>>
>>
> You are great! Now my Ethernet is working! It only need to be set with
> ifconfig eth0 <xx.xx.xx.xx> up end begin works!
>
> Thank a lot for the help;
>
> Now I need dhcp support to my board be possible get its IP from our
> tftp server. I can't found dhclient command on the target board. Also
> search for appropriate network package to be installed via make
> menuconfig but was impossible to find such a packet. Can you help me
> again?
Try udhcpc, that should be available from busybox. if not: make
busybox-menuconfig

You should add

> auto eth0
> iface eth0 inet dhcp

to your /etc/network/interfaces file.

Hope it helps

Stephan

-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
