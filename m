From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Dec 2016 15:23:02 +0100
Subject: [Buildroot] [PATCH 1/2] dovecot: bump version to 2.2.27
 (security)
In-Reply-To: <20161209151003.49165-1-Vincent.Riera@imgtec.com>
References: <20161209151003.49165-1-Vincent.Riera@imgtec.com>
Message-ID: <20161210152302.07885776@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Adding Bernd in Cc.

On Fri, 9 Dec 2016 15:10:02 +0000, Vicente Olivert Riera wrote:
> Fixes CVE-2016-8652 : http://www.securityfocus.com/bid/94639/
> 
> Release notes:
>   http://www.dovecot.org/list/dovecot-news/2016-December/000333.html
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

This update causes a large number of build failures:

  http://autobuild.buildroot.net/?reason=dovecot-2.2.27

Basically, dovecot no longer builds without OpenSSL support. The
configure error can be fixed by adding the attached patch (+ a
host-gettext dependency + autoreconf + creating m4). But then, the
build fails with:

In file included from test-http-client.c:12:0:
../../src/lib-ssl-iostream/iostream-openssl.h:6:25: fatal error: openssl/ssl.h: No such file or directory
 #include <openssl/ssl.h>

And http://www.mail-archive.com/dovecot at dovecot.org/msg67930.html is
not very encouraging in terms of supporting the build of Dovecot
without OpenSSL.

So could you submit a patch that either fixes the build of Dovecot
without OpenSSL, or makes OpenSSL support mandatory?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
