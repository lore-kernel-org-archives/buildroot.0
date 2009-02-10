From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 10 Feb 2009 10:00:32 +0100
Subject: [Buildroot] Easy Upgrade Path?
In-Reply-To: <d6cda7730902091413h5e7cbd21ra41d7154ca60909e@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Mon\, 9 Feb 2009
	20\:13\:37 -0200")
References: <49907BAE.3020509@ethertek.ca>
	<d6cda7730902091413h5e7cbd21ra41d7154ca60909e@mail.gmail.com>
Message-ID: <87d4dq7jkf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

Hi,

 >> What is the recommended method to upgrade to the newest build
 >> environment so we don't have to re-do everything? Is this
 >> possible?

 Thiago> I don't know if there is any recommended way. None is
 Thiago> documented, and I guess each one does whatever they see best.

 Thiago> I had the same problem as you, and after some thought I
 Thiago> decided the best approach would be to "fork" from buildroot
 Thiago> svn to my own private svn server (svn export) and do my
 Thiago> changes there. I've also added a file upstream.rev which only
 Thiago> contains the last revision from svn that I have merged from
 Thiago> upstream (svn diff -r last:current > upstream-rev.patch &&
 Thiago> patch -p0 < upstream-rev.patch).

There's an easier way - Take a look@vendor branches and the
svn_load_dirs.pl in the svn book.

 Thiago> Also, generic changes/development, I try to push upstream
 Thiago> whenever possible. This both benefits other users and also
 Thiago> helps us keeping the differences smaller, so merges with
 Thiago> upstream are a bit easier.

Exactly.

 Thiago> This is far from a good solution, but has worked so far.

We do something similar (using vendor branches though), and it works
pretty well. We might want to do something to make it easier to keep
the project/device specific stuff seperate though.

-- 
Bye, Peter Korsgaard
