From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Mar 2012 20:22:40 +0100
Subject: [Buildroot] Curl : Segmentation Fault
In-Reply-To: <54A0F0B594484527AFD52D676121CFAF@JohanW7>
References: <54A0F0B594484527AFD52D676121CFAF@JohanW7>
Message-ID: <20120314202240.6e90ba86@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 14 Mar 2012 17:02:52 +0100,
"Sagaert Johan" <sagaert.johan@skynet.be> a ?crit :

> I did several rebuilds and the result is the same: when using uclibc-0.9.33 i get a segmentation fault when running the curl binary.
> Did not yet test the lib-curl in a small test program.
> 
> Where to start to solve the issue ?

What is your hardware? What is your Buildroot .config?

You can enable core file generation on the target:
	ulimit -c unlimited

And then feed the core file to your cross-gdb (needs to be selected in
the Buildroot configuration) to see where the crash is happening.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
