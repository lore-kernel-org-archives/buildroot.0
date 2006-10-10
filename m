From: Ashok Shankar Das <ashok.s.das@gmail.com>
Date: Tue, 10 Oct 2006 22:22:06 +0530
Subject: [Buildroot] Networking apps not working
In-Reply-To: <FF210576-DA48-4030-A506-686D47F8281C@tutus.se>
References: <8032e0b00609301044s489c6efboc8754ce5309a6a9@mail.gmail.com>
	<FF210576-DA48-4030-A506-686D47F8281C@tutus.se>
Message-ID: <8032e0b00610100952l765a7452kc4def1d23fe01cfa@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

already solved thanks.
The problem is route sets wrong values.

* route del default
*route add -net 0.0.0.0 gw 192.168.0.1 netmask 0.0.0.0

the above 2 lines solved my problem.
If you can investigate why such thing happened then it will be good for all.

Thanks
Ashok.

On 10/8/06, Olof Backing <olof.backing@tutus.se> wrote:
> On 30 sep 2006, at 19.44, Ashok Shankar Das wrote:
>
> > Hi,
> > I am new to uclibc. I downloaded the buildroot,uclibc, then made a
> > rootfilesystem, installed it on a PC. It boots fine even Xorg 6.8.2
> > with gtk2.0 is installed.
> > My problem is I am unable to use any networking applications. as an
> > example ping, mtr etc.
> > Even if they are compiled properly under the uclibc toolchain they
> > don't work as desired.
> > If i give "ping 192.168.0.20" it works but if i give "ping
> > www.google.com" it never works.
> > It throws a error message "Un-reachable network" Where is the "/etc/
> > resolve.conf" shows the proper DNS server ip address.
> >
> > The llinks which is compiled ok also gives error "Un-reachable
> > network"
>
> May this is already being solved, but:
>
> * are the network devices properly setup?
> * are your routing tables correct?
>
> /lof
> --
> Tutus Data AB                             Phone: +46-8-70-995 98 99
> Sv?rdv?gen 11                             Fax:     +46-8-551 102 39
> SE-182 33  DANDERYD
> Sweden
>
>
>
>


-- 
Thanks
Ashok.
-------------
