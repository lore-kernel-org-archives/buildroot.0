From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 May 2011 19:49:33 +0200
Subject: [Buildroot] [PATCH 1/2] package: add jimtcl support
In-Reply-To: <20110501164314.GE1212@game.jcrosoft.org> (Jean-Christophe
	PLAGNIOL-VILLARD's message of "Sun, 1 May 2011 18:43:14 +0200")
References: <1304170969-30138-1-git-send-email-plagnioj@jcrosoft.com>
	<87vcxuv2c6.fsf@macbook.be.48ers.dk>
	<20110501164314.GE1212@game.jcrosoft.org>
Message-ID: <87ei4iux8y.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jean-Christophe" == Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> writes:

Hi,

 >> Is there really a need to support anything else than 0.70? We prefer to
 >> only have 1 version as that simplified implementation and testing.

 Jean-Christophe> I do use the the HEAD personally

 Jean-Christophe> but the 0.70 is the last release I see project still
 Jean-Christophe> using the previous one

What does openocd need? I would prefer to only have 0.70.

 Jean-Christophe> I do not known yet how to implement it but, I get in
 Jean-Christophe> my mind the idea to add for the scm the same idea as
 Jean-Christophe> for http download, the mirror mecanism When you work
 Jean-Christophe> offline or on slow internet network it's really good

That should work today - E.G. the git support creates a tarball which
will be reused next time you build or can be put on a mirror server.

 Jean-Christophe> +JIMTCL_INSTALL_STAGING = YES
 Jean-Christophe> +JIMTCL_INSTALL_TARGET = NO
 >> 
 >> Why no installation on target?
 Jean-Christophe> no need of it for openocd we just link link to it staticly

Ok, but we want a generic package. What does it install? Just a
shared/static library or also some tools?

 >> Does it really use autotools and have broken DESTDIR support?

 Jean-Christophe> yeah the --prefix is ignore, even if you pass
 Jean-Christopha> --prefix=/usr it will install in /include

That sound like something to fix upstream then.

-- 
Bye, Peter Korsgaard
