From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Fri, 11 Mar 2011 21:57:47 +0000 (UTC)
Subject: [Buildroot] Is PHP download link in php.mk broken?
References: <il8fpe$k15$1@dough.gmane.org> <il8g6t$nke$1@dough.gmane.org>
	<87fwqtpc3y.fsf@macbook.be.48ers.dk>
Message-ID: <ile5sr$oh9$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2011-03-11, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:
>
> Grant> On 2011-03-09, Grant Edwards <grant.b.edwards@gmail.com> wrote:

> >> I enabled the php package today, and it appears that the download
> >> link used by buildroot is invalid.  It's using
> >> 
> >> /home/nextgen/buildroot/downloads/php-$(PHP_VERSION).tar.bz2
>
> Grant> Pasted the wrong thing.  That's
>
> Grant> http://www.php.net/distributions/php-$(PHP_VERSION).tar.bz2
>
> Yeah, The php developers afaik use some magic download script to for
> load balancing / stats. The problem is that this script is broken, so
> instead of returning an error when the file isn't there it instead
> "helpfully" sends you a HTML file informing about it.

Sort of like DNS servers that "helpfully" direct you to some bogus
ad-filled website when you type in an invalid hostname.

> Now, buildroot thinks the download went fine, so it doesn't fallback
> to the sources.buildroot.net mirror and the build then later breaks
> when it tries to extract the tarball (which instead is a HTML file).
>
> There's not much we can do about it besides complain to the PHP devs,
> but you can download the tarball from our mirror and stick in your dl
> dir so the build works.
>
> http://sources.buildroot.net/php-5.2.12.tar.bz2

It turns out you can get old versions from

  http://museum.php.net/php5/php-$(PHP_VERSION).tar.bz2

However, you can't get the current version from there.  But, asking
for the current version with that URL _does_ fail with a 404, so I
think that using http://museum.php.net/php5/php-$(PHP_VERSION).tar.bz2
as the primary and http://www.php.net/distributions/php-$(PHP_VERSION).tar.bz2
as the backup might work.

In any case, I did find the version I was looking for and it's working
fine.

[I really need to update my buildroot snaphost, but there are other
things that need to get done before that...]

-- 
Grant Edwards               grant.b.edwards        Yow! Look DEEP into the
                                  at               OPENINGS!!  Do you see any
                              gmail.com            ELVES or EDSELS ... or a
                                                   HIGHBALL?? ...
