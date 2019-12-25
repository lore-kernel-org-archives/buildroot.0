From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 22:32:52 +0100
Subject: [Buildroot] [PATCH v1] package/zip: fix musl compile
In-Reply-To: <20191217221134.2619-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Tue, 17 Dec 2019 23:11:34 +0100")
References: <20191217221134.2619-1-ps.report@gmx.net>
Message-ID: <8736d8rszf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > For musl toolchain timezone.c needs time.h include.
 > Fixes:
 >   http://autobuild.buildroot.net/results/77346a2cdb9eeef661527fb9566019f3cd1b82c9

 >   In file included from util.c:28:
 >   timezone.c: In function 'mktime':
 >   timezone.c:644:18: error: dereferencing pointer to incomplete type 'struct tm'
 >        save_isdst = tm->tm_isdst;

 >   timezone.c:661:11: warning: implicit declaration of function 'localtime'; did you mean 'dostime'? [-Wimplicit-function-declaration]
 >        ltm = localtime(&then);

 >   timezone.c:661:9: warning: assignment to 'struct tm *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
 >        ltm = localtime(&then);

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
