From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Oct 2015 11:57:54 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-10-16
In-Reply-To: <20151017063016.8F916101BB3@stock.ovh.net> (Thomas Petazzoni's
 message of "Sat, 17 Oct 2015 08:30:16 +0200 (CEST)")
References: <20151017063016.8F916101BB3@stock.ovh.net>
Message-ID: <87eggtzujh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Build statistics for 2015-10-16
 > ===============================

 >         success : 196
 >        failures : 78 
 >        timeouts : 0  
 >           TOTAL : 274

 > Classification of failures by reason
 > ====================================

 >                 busybox-1.24.0 | 14

Wow!

The problem seems to be that musl doesn't implement the wtmp stuff (and
stubs out the utmp functions):

http://lists.busybox.net/pipermail/busybox/2015-October/083447.html

Should we just disable wtmp and utmp suppert in our defconfig (which
means no last/who applets) or tweak the config when building with musl?

-- 
Bye, Peter Korsgaard
