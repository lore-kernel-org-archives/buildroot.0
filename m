From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 31 Jan 2012 17:23:46 +0100
Subject: [Buildroot] problem when using build cache ?
In-Reply-To: <9C7AEB06A00A49B5BC4F3D164ABB579E@JohanW7> (Sagaert Johan's
 message of "Tue, 31 Jan 2012 17:10:46 +0100")
References: <9C7AEB06A00A49B5BC4F3D164ABB579E@JohanW7>
Message-ID: <8739avkfhp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
