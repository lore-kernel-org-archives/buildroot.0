From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jan 2014 18:33:40 +0100
Subject: [Buildroot] Configuring the gpsd package
In-Reply-To: <20140106155637.GA4503@tarshish>
References: <858B5C1843112849BC285F6BF91A22640EB1B569@VF2WDEXMB1.verifone.com>
 <20140101162040.GJ4470@tarshish>
 <858B5C1843112849BC285F6BF91A22640EB1BADB@VF2WDEXMB1.verifone.com>
 <20140102080145.GL6589@tarshish>
 <858B5C1843112849BC285F6BF91A22640EB1BB09@VF2WDEXMB1.verifone.com>
 <20140102084544.GN6589@tarshish>
 <858B5C1843112849BC285F6BF91A22640EB1BBA1@VF2WDEXMB1.verifone.com>
 <20140102100454.GS6589@tarshish>
 <858B5C1843112849BC285F6BF91A22640EB1BBD1@VF2WDEXMB1.verifone.com>
 <858B5C1843112849BC285F6BF91A22640EB2B042@VF2WDEXMB1.verifone.com>
 <20140106155637.GA4503@tarshish>
Message-ID: <20140128183340.410169ce@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon, 6 Jan 2014 17:56:37 +0200, Baruch Siach wrote:

> > Anyway, I was able to run the gpsd and use the it in spite of probably not 
> > having the two dependencies. My questions are:
> > 1. What is the purpose of the two dependencies?
> 
> As the comment above the MMU dependency says, the gpsd code uses fork(). This 
> system call is not available on non-MMU systems. The same goes for threads 
> support. The package uses the pthreads API, and doesn't build without it.
> 
> > 2. How come I was able to use the daemon anyway?
> 
> Apparently you are using an external toolchain. When using an external 
> toolchain you need to explicitly tell Buildroot whether you toolchain includes 
> threading supports.

Correct, but Buildroot checks the selection the user has made in
menuconfig against the real configuration of the toolchain, and if they
don't match, the Buildroot build doesn't even start. Therefore, there
is normally no way to do an incorrect configuration here.

> As to MMU, for some reason this is option is disabled on your configuration, 
> although clearly your target has MMU enabled.

Where have you seen Gabi's .config ? I've gone through this thread
again, and I haven't seen his .config.

That being said, Gabi uses a 3+ years old Buildroot, and refuses to
share his changes, so I must say that the incentive to provide some
free support in such a situation is fairly low.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
