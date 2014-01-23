From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 23 Jan 2014 22:31:14 +0100
Subject: [Buildroot] [PATCH] tcpreplay: cross-compile with tcpdump
	support
In-Reply-To: <52E176D9.6040101@barkynet.com> (Martin Bark's message of "Thu,
 23 Jan 2014 20:08:57 +0000")
References: <87txcvb13p.fsf@dell.be.48ers.dk>
 <1390468034-7430-1-git-send-email-judge.packham@gmail.com>
 <87ppnjaqam.fsf@dell.be.48ers.dk> <52E176D9.6040101@barkynet.com>
Message-ID: <87zjmm9yhp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:

Hi,

 >> > +ifeq ($(BR2_PACKAGE_TCPDUMP),y)
 >> > +TCPREPLAY_CONF_ENV += ac_cv_path_tcpdump_path=/usr/sbin/tcpdump
 >> 
 >> The problem here is that the configure script checks if /usr/bin/tcpdump
 >> (on the build machine) is executable, and otherwise errors out - So this
 >> breaks if you try to build it on a machine without tcpdump.

 > I think the patch is actually OK.  Looking at the configure script
 > when ac_cv_path_tcpdump_path is set it does not check if the
 > executable exists.  It only checks when using the --with-tcpdump
 > option.

 > I tested the patch and choose tcpdump and tcpreplay with no
 > /usr/sbin/tcpdump on the host.  The code builds and I see in the
 > configure output the lines

 > checking for tcpdump... (cached) /usr/sbin/tcpdump

 > and

 > tcpdump binary path:        /usr/sbin/tcpdump

 > So i think this patch will work.

Ups, you're right - Sorry.

Committed patch, thanks.

-- 
Bye, Peter Korsgaard
