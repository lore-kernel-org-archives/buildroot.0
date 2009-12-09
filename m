From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Dec 2009 21:04:59 +0100
Subject: [Buildroot] RTNETLINK error
In-Reply-To: <4B2CB099CF3D4F40B1B1442281CA94FFC4C929@EXCHANGEVS01.appsig.com>
	(RYAN NEAL's message of "Wed, 9 Dec 2009 11:20:12 -0800")
References: <4B2CB099CF3D4F40B1B1442281CA94FFC4C929@EXCHANGEVS01.appsig.com>
Message-ID: <87vdgfx6ac.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == NEAL, RYAN <RYAN_NEAL@appsig.com> writes:

Hi,

 Ryan> Starting network...

 Ryan> ip: RTNETLINK answers: File exists

  Ryan> And then it hangs.  I looked through the inittab -> rcS -> S40network to find
 Ryan> that it is coming from the ifup call (on the loopback interface?). 

How does your /etc/network/interfaces file look? Do you have an entry
for eth0?

From the above I assume you're booting from NFS? Reconfiguring eth0
while you're trying to read from NFS isn't a good thing.

-- 
Bye, Peter Korsgaard
