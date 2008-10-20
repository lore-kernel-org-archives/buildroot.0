From: Hai Zaar <haizaar@haizaar.com>
Date: Mon, 20 Oct 2008 03:28:46 +0200
Subject: [Buildroot] build should not depend on user's umask
Message-ID: <76d9e2a30810191828v654590efga2d86f0bb5f5cea6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Good day!

Currently, if the user that performs the build sets its umask to say
027, then some libraries will be installed with 750 permission.
For example - libz.so
This fails php-cgi to load, since it runs under lighttpd which in turn
spawns php-cgi as www-data user, that obviously can not access libz
library due to a bug I've mentioned.

-- 
Zaar
