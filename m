From: NEAL, RYAN <RYAN_NEAL@appsig.com>
Date: Wed, 9 Dec 2009 13:20:48 -0800
Subject: [Buildroot] RTNETLINK error
In-Reply-To: <87vdgfx6ac.fsf@macbook.be.48ers.dk>
References: <4B2CB099CF3D4F40B1B1442281CA94FFC4C929@EXCHANGEVS01.appsig.com>
	<87vdgfx6ac.fsf@macbook.be.48ers.dk>
Message-ID: <4B2CB099CF3D4F40B1B1442281CA94FFC4C92A@EXCHANGEVS01.appsig.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am actually not trying to boot from an NFS.  I just want to use an
initramfs.

output/target% cat etc/network/interfaces
# Configure Loopback
auto lo
iface lo inet loopback

that all seems reasonable?  I thought I turned off NFS as an option in
buildroot.

Thanks!

::Ryan
-----Original Message-----
From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter
Korsgaard
Sent: Wednesday, December 09, 2009 12:05 PM
To: NEAL, RYAN
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] RTNETLINK error

>>>>> "Ryan" == NEAL, RYAN <RYAN_NEAL@appsig.com> writes:

Hi,

 Ryan> Starting network...

 Ryan> ip: RTNETLINK answers: File exists

  Ryan> And then it hangs.  I looked through the inittab -> rcS ->
S40network to find
 Ryan> that it is coming from the ifup call (on the loopback
interface?). 

How does your /etc/network/interfaces file look? Do you have an entry
for eth0?

From the above I assume you're booting from NFS? Reconfiguring eth0
while you're trying to read from NFS isn't a good thing.

-- 
Bye, Peter Korsgaard
