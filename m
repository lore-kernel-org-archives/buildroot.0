From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 11 Mar 2011 22:43:13 +0100
Subject: [Buildroot] Is PHP download link in php.mk broken?
In-Reply-To: <il8g6t$nke$1@dough.gmane.org> (Grant Edwards's message of "Wed, 
	9 Mar 2011 18:17:01 +0000 (UTC)")
References: <il8fpe$k15$1@dough.gmane.org> <il8g6t$nke$1@dough.gmane.org>
Message-ID: <87fwqtpc3y.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:

 Grant> On 2011-03-09, Grant Edwards <grant.b.edwards@gmail.com> wrote:
 >> I enabled the php package today, and it appears that the download
 >> link used by buildroot is invalid.  It's using
 >> 
 >> /home/nextgen/buildroot/downloads/php-$(PHP_VERSION).tar.bz2

 Grant> Pasted the wrong thing.  That's

 Grant> http://www.php.net/distributions/php-$(PHP_VERSION).tar.bz2

Yeah, The php developers afaik use some magic download script to for
load balancing / stats. The problem is that this script is broken, so
instead of returning an error when the file isn't there it instead
"helpfully" sends you a HTML file informing about it.

Now, buildroot thinks the download went fine, so it doesn't fallback to
the sources.buildroot.net mirror and the build then later breaks when it
tries to extract the tarball (which instead is a HTML file).

There's not much we can do about it besides complain to the PHP devs,
but you can download the tarball from our mirror and stick in your dl
dir so the build works.

http://sources.buildroot.net/php-5.2.12.tar.bz2

-- 
Bye, Peter Korsgaard
