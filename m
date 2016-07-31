From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 31 Jul 2016 22:06:14 +0200
Subject: [Buildroot] Analysis of build results for 2016-07-29
In-Reply-To: <20160730232322.4eca1a53@free-electrons.com>
References: <20160730063032.3A6FE10161A@stock.ovh.net>
 <20160730232322.4eca1a53@free-electrons.com>
Message-ID: <e7d1f683-c220-4609-26a4-464fffb11798@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

Le 30/07/2016 ? 23:23, Thomas Petazzoni a ?crit :
> Hello,
> 
> We've got lots of failures, so your need is definitely needed to fix
> some of them. Waldemar, Maxime (Hadjinlian and Ripard), Olivier
> (Schonken and Singla), Gustavo, Romain, Alexey, Vlad, Yann, Frank,
> Angelo, Fabrice, Bernd, Julien, Dagg, Vicente, Baruch, Peter, please
> look below, there are lots of things for you! :-)
> 
> Thanks for your participation!
> 

> 
>> microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/871c93da958e5014a9f77212bec89047d4ada6f3/
>> microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/06998c35e0aae47f03f82b150c6824e06e768550/
>> microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/d8987371bef51567afbd60674b9aa36bb1399481/
> 
> BFD (GNU Binutils) 2.25.1 assertion fail elf32-microblaze.c:1491
> 
> Romain, would you have the time to see if binutils 2.26 still has the
> issue, and see what is the proper approach (exclude bluez_utils from
> Microblaze, backport a patch, etc.) ?
> 

Same issue with Binutils 2.26.

I think this may be a uClibc-ng issue :
Scrt1.o: probably compiled without -fPIC? (Waldemar?)

> 
>> microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/a5848753eb0e2b0ddf55e226c45b85fd3a1c84f3/
> 
> Romain, same issue as bluez_utils. Try with binutils 2.26 ?

[snip]

> 
>> microblazeel |                 iproute2-4.5.0 | NOK | http://autobuild.buildroot.net/results/118c92055daca52d9b10d764835c0d0c0b24fdc2/
> 
> cannot find -lpthread
> 
> Not sure what happens here :-/
> 
The microblaze internal toolchain is build without thread support
(BR2_PTHREADS_NONE=y), also there is the same issue on arm [1]

I'm not sure about the required thread support (w/ NPTL ?)

[1] http://autobuild.buildroot.net/?reason=iproute2-4.5.0

Best regards,
Romain


> 
>> microblazeel |                  lvm2-2.02.161 | NOK | http://autobuild.buildroot.net/results/2897a2fa72b98736333fe0c2fa9da802ba982e32/
>> microblazeel |                  lvm2-2.02.161 | NOK | http://autobuild.buildroot.net/results/e260a992d4ca29a55e356b81d81d44bdafb7fe14/
> 
> Yet another:
> 
>    BFD (GNU Binutils) 2.25.1 assertion fail elf32-microblaze.c:1491
> 
> Romain ?
> 
[snip]
> 
> Thanks a lot!
> 
> Thomas
> 
