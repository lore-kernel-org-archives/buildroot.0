From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Aug 2009 16:29:48 +0200
Subject: [Buildroot] Problem using netsnmp
In-Reply-To: <4A6EE8F1.3060302@tandberg.com>
References: <4A6EE8F1.3060302@tandberg.com>
Message-ID: <20090804162948.255a47df@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 28 Jul 2009 13:02:57 +0100,
Chris Smith <chris.smith@tandberg.com> a ?crit :

> When I build netsnmp the built snmpd doesn't work on the target.  All 
> the other snmp stuff works but I get
> lib.so.6 not found when trying to run snmpd.
> 
> Anyone have any thoughts?  It is as if some linkage to host based 
> libraries has crept in.

I've converted the package to the Makefile.autotools.in infrastructure.
And now it builds for me, with openssl support. However, I've removed
the Perl support since it was broken and took too much time to fix.

Could you test the patch I proposed (available at
http://git.buildroot.net/~tpetazzoni/git/buildroot/patch/?id=d96368ad9339edf62aa87890d5cea79bf7ddfc34) ?

It builds for me, and the snmpd daemon runs. But as I have absolutely
no knowledge about SNMP, you'll probably have more ideas on how to
verify that it is indeed working.

Moreover, I've added a few things in the TODO about netsnmp (see
http://git.buildroot.net/~tpetazzoni/git/buildroot/patch/?id=d7890dd09302bc912cca13d65aa128eb826f9123).
If you're interested in helping for one of them (like telling us how
netsnmp should be packaged, what are the different programs, libraries
and configuration files useful for), don't hesitate!

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
