From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 May 2021 16:48:39 +0200
Subject: [Buildroot] [PATCH] package/go: security bump to version 1.16.4
In-Reply-To: <20210507062821.32119-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 7 May 2021 08:28:21 +0200")
References: <20210507062821.32119-1-peter@korsgaard.com>
Message-ID: <87im3twabc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2021-31525: ReadRequest and ReadResponse in net/http can hit an
 >   unrecoverable panic when reading a very large header (over 7MB on 64-bit
 >   architectures, or over 4MB on 32-bit ones).  Transport and Client are
 >   vulnerable and the program can be made to crash by a malicious server.
 >   Server is not vulnerable by default, but can be if the default max header
 >   of 1MB is overridden by setting Server.MaxHeaderBytes to a higher value,
 >   in which case the program can be made to crash by a malicious client.

 >   https://github.com/golang/go/issues/45710

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

For 2021.02.x I have instead bumped to 1.5.12, which includes the same
security fix.

-- 
Bye, Peter Korsgaard
