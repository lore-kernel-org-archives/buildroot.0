From: =?iso-8859-1?Q?Mikael_=C5sberg?= <mikael.asberg@mdh.se>
Date: Fri, 13 Apr 2012 11:06:45 +0200
Subject: [Buildroot] Kernel does not boot on I.MX28
In-Reply-To: <20120413103108.508e66796f1ca89823168bd0@kinali.ch>
References: <63D6870D443E63419AC4A0C97B86C0920D358F816B@MBXCLUSTER.mdh.local>
 <20120413095603.b65508a9d94d73d3a694c2ed@kinali.ch>
 <63D6870D443E63419AC4A0C97B86C0920D358F816C@MBXCLUSTER.mdh.local>,
 <20120413103108.508e66796f1ca89823168bd0@kinali.ch>
Message-ID: <63D6870D443E63419AC4A0C97B86C0920D358F816D@MBXCLUSTER.mdh.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

>I dont understand what you mean here? Why, and how should the compiler
>be included in the kernel?

For example, I have developed a new scheduler for Linux which is a kernel module.
If I want to run this scheduler in the Linux kernel on my I.MX28 board, I need to compile this kernel module.
Do I compile this module on my host machine with (arm-linux-gcc) and then transfer this binary to the board?
Or do I compile the module on the target board?

--------------------------------------------------------------
Mikael ?sberg
PhD student (Doktorand), Computer Engineering
School of Innovation, Design and Engineering
M?lardalen University, V?ster?s Sweden
Phone: +46(0)21 101502
Room nr: U1-145
Mail: mikael.asberg at mdh.se
--------------------------------------------------------------
________________________________________
Fr?n: Attila Kinali [attila at kinali.ch]
Skickat: den 13 april 2012 10:31
Till: Mikael ?sberg
Kopia: buildroot at busybox.net
?mne: Re: SV: [Buildroot] Kernel does not boot on I.MX28

On Fri, 13 Apr 2012 10:21:11 +0200
Mikael ?sberg <mikael.asberg@mdh.se> wrote:

> I saw this (ttyAMA0) on a post in I.MX Community just before I read your e-mail =) and it works now!
> But thx anyway!!

NP. I had the same problem and it took me a while to figure it out.


> However, I'm very confused with one thing.
> I have tried LTIB kernel as well, but I cannot get the gcc compiler (package) included in that kernel.

I dont understand what you mean here? Why, and how should the compiler
be included in the kernel?

> I just noticed that gcc is not included in the Buildroot kernel either?
> I feel a bit stupid asking this but how do I include the gcc compiler package in the kernel configuration??

Buildroot builds either its own cross compile gcc or you can use
an external cross compiler. The first one can be found under
output/host/.../bin/, the later, where you specified it.

                        Attila Kinali

--
The trouble with you, Shev, is you don't say anything until you've saved
up a whole truckload of damned heavy brick arguments and then you dump
them all out and never look at the bleeding body mangled beneath the heap
                -- Tirin, The Dispossessed, U. Le Guin
