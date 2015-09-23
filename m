From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Sep 2015 23:25:17 +0200
Subject: [Buildroot] [PATCH] rtptools: needs RPC support
In-Reply-To: <1443009479-8481-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Wed, 23 Sep 2015 12:57:59 +0100")
References: <1443009479-8481-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87pp18q14y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > rtptools needs a toolchain with RPC support, otherwise it will fail with
 > an error message like this one:

 > host2ip.c:13:38: fatal error: rpcsvc/ypclnt.h: No such file or directory
 >  #include <rpcsvc/ypclnt.h>   /* YP */

Hmm, are you sure?

I just did a test build here with a toolchain without RPC support:

find output/staging/usr -name ypclnt.h

But it still built. I do see that rpctools itself contain that header
file:

find output/build/rtptools-1.20 -name ypclnt.h
output/build/rtptools-1.20/nt/include/ypclnt.h
output/build/rtptools-1.20/nt/include/rpcsvc/ypclnt.h

-- 
Bye, Peter Korsgaard
