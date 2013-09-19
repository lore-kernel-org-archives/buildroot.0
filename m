From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Sep 2013 21:32:16 +0200
Subject: [Buildroot] [PATCH 6/6] luaposix: bump to version 31
In-Reply-To: <1379350375-18843-6-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 16 Sep 2013 13:52:55 -0300")
References: <1379350375-18843-1-git-send-email-gustavo@zacarias.com.ar>
 <1379350375-18843-6-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87y56sehfj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Releases are no longer named 5.1.X, just the X portion remains
 Gustavo> now.  Fixes autoreconf issues with the automake bump, however
 Gustavo> since the patch is no longer required that's not an issue now.

It apparently now needs IPv6:

  CC       ext/posix/ext_posix_posix_c_la-posix.lo
ext/posix/posix.c: In function 'Psetsockopt':
ext/posix/posix.c:3642:10: error: 'IPV6_JOIN_GROUP' undeclared (first use in this function)

Committed with that dependency added, thanks.

-- 
Bye, Peter Korsgaard
