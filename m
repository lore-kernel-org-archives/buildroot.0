From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 May 2017 22:36:31 +0200
Subject: [Buildroot] [PATCH] rpcbind: add upstream security fix for
	CVE-2017-8779
In-Reply-To: <20170515210124.6657-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 15 May 2017 23:01:24 +0200")
References: <20170515210124.6657-1-peter@korsgaard.com>
Message-ID: <87tw4j43w0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > CVE-2017-8779: rpcbind through 0.2.4, LIBTIRPC through 1.0.1 and 1.0.2-rc
 > through 1.0.2-rc3, and NTIRPC through 1.4.3 do not consider the maximum RPC
 > data size during memory allocation for XDR strings, which allows remote
 > attackers to cause a denial of service (memory consumption with no
 > subsequent free) via a crafted UDP packet to port 111, aka rpcbomb.

 > For more details, see:
 > https://guidovranken.wordpress.com/2017/05/03/rpcbomb-remote-rpcbind-denial-of-service-patches/

 > Backport upstream fix to version 0.2.3 and unconditionally include syslog.h
 > to fix a build issue when RPCBIND_DEBUG is disabled (which it is in
 > Buildroot).

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
