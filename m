From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Apr 2012 09:27:57 +0200
Subject: [Buildroot] [git commit] Add libcap-ng package.
In-Reply-To: <20120404200933.2D85596A01@busybox.osuosl.org>
References: <20120404200933.2D85596A01@busybox.osuosl.org>
Message-ID: <20120405092757.585e48c6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 4 Apr 2012 21:57:47 +0200,
Peter Korsgaard <jacmet@sunsite.dk> a ?crit :

> --- /dev/null
> +++ b/package/libcap-ng/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_LIBCAP_NG
> +	bool "libcap-ng"
> +	help
> +	  The libcap-ng library is intended to make programming with
> +	  posix capabilities much easier than the traditional libcap
> +	  library. It includes utilities that can analyse all currently
> +	  running applications and print out any capabilities and whether
> +	  or not it has an open ended bounding set.
> +
> +	  http://people.redhat.com/sgrubb/libcap-ng/

This new package should probably depends on BR2_LARGEFILE, or get some
sort of fix for largefile support. See:

http://autobuild.buildroot.org/results/7aab0aecc3a49b55d65f168bb2a7165bcfc62acb/build-end.log
http://autobuild.buildroot.org/results/22ec96b9a821c89ebba804f71b97707718038549/build-end.log
http://autobuild.buildroot.org/results/15d94ece63b89517d8d896785fec5085a573e740/build-end.log
http://autobuild.buildroot.org/results/b76c3195656fa96ffa8446ac03bde51690a4dc90/build-end.log

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
