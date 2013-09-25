From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 25 Sep 2013 00:19:11 +0000 (UTC)
Subject: [Buildroot] [Bug 6500] php fails to build for armel.
In-Reply-To: <bug-6500-163@https.bugs.busybox.net/>
References: <bug-6500-163@https.bugs.busybox.net/>
Message-ID: <20130925001911.C71B29B866@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6500

--- Comment #2 from twobob <seetwobob@live.co.uk> 2013-09-25 00:19:11 UTC ---
okay...

perhaps it is this?

cc1: warning: include location "/usr/include" is unsafe for cross-compilation
[-Wpoison-system-directories]
In file included from /usr/include/features.h:389:0,
                 from /usr/include/stdlib.h:25,
                 from
/home/me/GIT/buildroot-13-08/output/build/php-5.3.27/include/../main/php_config.h:2458,
                 from
/home/me/GIT/buildroot-13-08/output/build/php-5.3.27/Zend/zend_config.h:1,
                 from
/home/me/GIT/buildroot-13-08/output/build/php-5.3.27/Zend/zend.h:51,
                 from
/home/me/GIT/buildroot-13-08/output/build/php-5.3.27/main/php.h:34,
                 from
/home/me/GIT/buildroot-13-08/output/build/php-5.3.27/ext/iconv/iconv.c:27:
/usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such file or
directory
compilation terminated.
make[1]: *** [ext/iconv/iconv.lo] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory
`/home/me/GIT/buildroot-13-08/output/build/php-5.3.27'
make: *** [/home/me/GIT/buildroot-13-08/output/build/php-5.3.27/.stamp_built]
Error 2


Hope this helps.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
