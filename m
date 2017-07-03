From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Jul 2017 17:59:07 +0200
Subject: [Buildroot] [PATCH 2/5] core/pkg-generic: call MESSAGE when
	saving package legal-info
In-Reply-To: <606d7f78d9c7e1af1c1fd1b72ab489853d230f70.1498428166.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 26 Jun 2017 00:03:38 +0200")
References: <cover.1498428166.git.yann.morin.1998@free.fr>
 <606d7f78d9c7e1af1c1fd1b72ab489853d230f70.1498428166.git.yann.morin.1998@free.fr>
Message-ID: <87o9t17bqs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, the per-package legal-info is mostly silent, but we're soon
 > to add a check for the hashes of the license files.

 > In that case, and when there is a hash mis-match, we want a user to know
 > what package had a changed license file.

 > So, we add a call to MESSAGE to display the package we're currently
 > saving the legal-info of, like so:

 >>>> busybox 1.26.2 Collecting legal info

I wonder if we still need the general "Collecting legal info" message,
as it now looks something like:

>>>   Collecting legal info
>>> toolchain-buildroot  Collecting legal info
>>> host-gcc-final 6.3.0 Collecting legal info
>>> host-binutils 2.27 Collecting legal info
>>> host-gmp 6.1.2 Collecting legal info

Though, with the entire patch series applied it might be handy to match
the warnings, E.G.:

>>>   Collecting legal info
WARNING: no hash file for COPYING
>>> toolchain-buildroot  Collecting legal info

Presumably this warning is from legal-info-prepare. I'm not sure exactly
how we should get rid of this warning? A buildroot.hash with an entry
for our COPYING?

That can be fixed later though - Committed, thanks.

-- 
Bye, Peter Korsgaard
