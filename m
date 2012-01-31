From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 31 Jan 2012 20:38:51 +0100
Subject: [Buildroot] problem when using build cache ?
In-Reply-To: <8739avkfhp.fsf@macbook.be.48ers.dk>
References: <9C7AEB06A00A49B5BC4F3D164ABB579E@JohanW7>
 <8739avkfhp.fsf@macbook.be.48ers.dk>
Message-ID: <3DA04F4AA8F24A45B49F31E8169AE50E@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

After some search i found that if you create a directory under /lib/udev/devices/pts  then udev will create(copy) this directory
under /dev so I think its not needed to do it in inittab.

Johan

-----Oorspronkelijk bericht-----
Van: Peter Korsgaard [mailto:jacmet at gmail.com] Namens Peter Korsgaard
Verzonden: dinsdag 31 januari 2012 17:24
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: problem when using build cache ?

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi
 Sagaert> Using 2011.11 :

 

 Sagaert> The udev version in 2011.11 (v1.73) does not  generate the /dev/pts nodes  and
 Sagaert> as result there is no devpts in the mounts.

No, but the default /etc/inittab has a mkdir -p /dev/pts
 
 Sagaert> Has this something to do with the fact that the udev 1.14
 Sagaert> package makefile is different in structure then the structure
 Sagaert> used in 2011.11 ?

Perhaps.
 

 Sagaert> If you check the udev doc, it states that udev 1.73 only works with kernels >=
 Sagaert> 2.6.34

 Sagaert> But I was using 2.6.36.1 and there where no /dev/pts nodes

  Sagaert> So there is a tight connection between udev versions and the
 Sagaert> kernel versions.

The /dev/pts issue isn't directly related to udev or the kernel, simply
that devtmpfs doesn't create that mount point (and it shouldn't as no
device drivers tells it to do so).

-- 
Bye, Peter Korsgaard
