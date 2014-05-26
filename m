From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 May 2014 21:16:27 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-05-25
In-Reply-To: <39A54937CC95F24AA2F794E2D2B66B1356CD2DCF@de02wembxa.internal.synopsys.com>
 (Anton Kolesov's message of "Mon, 26 May 2014 18:50:24 +0000")
References: <20140526063007.A011F10158F@stock.ovh.net>
 <39A54937CC95F24AA2F794E2D2B66B1356CD2DCF@de02wembxa.internal.synopsys.com>
Message-ID: <8738fwgxkk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Anton" == Anton Kolesov <Anton.Kolesov@synopsys.com> writes:

 > Hi Thomas,
 >> microblazeel | host-gdb-6be65fb56ea6694a92... | NOK |
 >> http://autobuild.buildroot.net/results/95fa2904f81a114abfa337dcce141b7c8
 >> 7d5a52c/

 > Host gdb build fails because it cannot build etc/standards.info from
 > etc/standards.texi. The same is true for any other "texi ->info"
 > compilation. The same problems affects GDB for ARC (based on GDB
 > 7.5). Apparently this is caused by 21aaa85 - "missing makeinfo"
 > causes build failure for docs, and GDB doesn't ignore this error
 > (despite --disable-doc* options to configure). Can this "missing
 > makeinfo" become conditional, so it will be applied only to those
 > cases where it was required (I suppose GDB 7.4, from the commit log)?

Hmm, yes. If that fixes the problem then I'm fine with making it
conditional on !GDB_FROM_GIT.

Can you confirm?

-- 
Bye, Peter Korsgaard
