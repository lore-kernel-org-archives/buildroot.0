From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Jun 2013 21:00:17 +0200
Subject: [Buildroot] [PATCH] package/libbsd: depends on architectures
	providing a.out.h
In-Reply-To: <1370454724-10594-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 5 Jun 2013 19:52:04 +0200")
References: <1370454724-10594-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87li6ocri6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> libbsd requires a.out.h, which is only available in a select subset
 Yann> of the architectures Buildroot supports.

 Yann> This means libedit can no longer 'select' libbsd, so turn the 'select'
 Yann> into a 'depends on'. And the dependency chain ends there.

Why? You can just propagate the arch dependencies to libedit as well.
I don't like dependencies for libraries, it isn't obvious to people that
we actually have a libedit package.

-- 
Bye, Peter Korsgaard
