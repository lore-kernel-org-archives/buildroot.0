From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 11 Mar 2011 22:45:27 +0100
Subject: [Buildroot] Is PHP download link in php.mk broken?
In-Reply-To: <il8gcq$pqn$1@dough.gmane.org> (Grant Edwards's message of "Wed, 
	9 Mar 2011 18:20:11 +0000 (UTC)")
References: <il8fpe$k15$1@dough.gmane.org> <il8g6t$nke$1@dough.gmane.org>
	<il8gcq$pqn$1@dough.gmane.org>
Message-ID: <87bp1hpc08.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:

 Grant> I found older releases at:

 Grant> http://museum.php.net/php5/php-$(PHP_VERSION).tar.bz2

 Grant> But, that link _won't_ work for the current version.  Is there a way
 Grant> to provide multiple download links in a .mk file?

Not for a specific .mk, but we support primary mirrors
(BR2_PRIMARY_SITE) and fallback mirrors (BR2_BACKUP_SITE). The last one
is normally enough (and set by default), but as php.net claims the
download succeeded we never fall back to the backup site.

-- 
Bye, Peter Korsgaard
