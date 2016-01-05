From: Alex Suykov <alex.suykov@gmail.com>
Date: Tue, 5 Jan 2016 14:51:22 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-01-04
In-Reply-To: <20160105073021.6CB4110127C@stock.ovh.net>
References: <20160105073021.6CB4110127C@stock.ovh.net>
Message-ID: <20160105125122.GA24278@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tue, Jan 05, 2016 at 08:30:21AM +0100, Thomas Petazzoni wrote:

>          arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/199fbe68e11df7fac890b79e774dd0369988c917/
>         bfin | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/786b2d83f7036c41a7e461ce9ab334c2ba0a4820/
>         sh4a | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/f19114c40a4ecd2642e41bba36e97987623b0149/
>         bfin | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/0d9a3693b1f8f9f94640c5d5a7c3aabdee015818/
>      powerpc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/57a45d77cf8549f572579f39c9dba7e31f8f02fd/
>        nios2 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/e058f1d7915e580ffbe1586beac652057e4d8515/
>     mips64el | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/e7ee5dedc4f62d9007875fd47ddc5c2c0d210968/

Looks like a host gcc issue, maybe. I can't reproduce it.
Apparently it comes down to whether this code is correct:

	typedef struct rsa_st RSA;	/* from openssl headers */
	typedef struct rsa_st RSA;	/* from vboot-utils */

and all compilers I can check agree that it is.

host-vboot-utils are built with CC=/usr/bin/gcc
Is there any way to tell which gcc version do the autobuilders use?
