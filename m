From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 05 Apr 2012 09:49:17 +0200
Subject: [Buildroot] [git commit] Add libcap-ng package.
In-Reply-To: <20120405092757.585e48c6@skate> (Thomas Petazzoni's message of
 "Thu, 5 Apr 2012 09:27:57 +0200")
References: <20120404200933.2D85596A01@busybox.osuosl.org>
 <20120405092757.585e48c6@skate>
Message-ID: <871uo2ty82.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Le Wed, 4 Apr 2012 21:57:47 +0200,
 Thomas> Peter Korsgaard <jacmet@sunsite.dk> a ?crit :

 >> --- /dev/null
 >> +++ b/package/libcap-ng/Config.in
 >> @@ -0,0 +1,10 @@
 >> +config BR2_PACKAGE_LIBCAP_NG
 >> +	bool "libcap-ng"
 >> +	help
 >> +	  The libcap-ng library is intended to make programming with
 >> +	  posix capabilities much easier than the traditional libcap
 >> +	  library. It includes utilities that can analyse all currently
 >> +	  running applications and print out any capabilities and whether
 >> +	  or not it has an open ended bounding set.
 >> +
 >> +	  http://people.redhat.com/sgrubb/libcap-ng/

 Thomas> This new package should probably depends on BR2_LARGEFILE, or get some
 Thomas> sort of fix for largefile support. See:

Seems like it, but only for the python bindings. The library itself
builds fine without largefile support (I tested that).

It should also ensure it builds after python if enabled for the
bindings.

-- 
Bye, Peter Korsgaard
