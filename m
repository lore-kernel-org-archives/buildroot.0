From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Aug 2009 17:01:13 +0200
Subject: [Buildroot] Problem using netsnmp
In-Reply-To: <4A6EE8F1.3060302@tandberg.com>
References: <4A6EE8F1.3060302@tandberg.com>
Message-ID: <20090803170113.6880d673@surf>
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

Could you report a bug for this in our bug tracker
(http://bugs.uclibc.org, product buildroot) ?

I'm currently working on switching this package to
Makefile.autotools.in in order to fix the build issue I have, and I
will also integrate the fix for
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-6123, which
appears to be
http://net-snmp.svn.sourceforge.net/viewvc/net-snmp/branches/V5-4-patches/net-snmp/snmplib/snmpUDPDomain.c?view=patch&r1=17367&r2=17366&pathrev=17367
(thanks to Gustavo for noticing).

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
