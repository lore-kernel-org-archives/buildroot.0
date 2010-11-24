From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 24 Nov 2010 20:59:11 +0100
Subject: [Buildroot] [PATCH v2] zlib: fix shared lib logic for
	static-only targets
In-Reply-To: <1290624967.12564.5.camel@segulix> (Sergio Monteiro Basto's
	message of "Wed, 24 Nov 2010 18:56:06 +0000")
References: <1290220539-11242-1-git-send-email-vapier@gentoo.org>
	<1290224711-21643-1-git-send-email-vapier@gentoo.org>
	<87k4k268yo.fsf@macbook.be.48ers.dk>
	<1290624967.12564.5.camel@segulix>
Message-ID: <87y68i4ho0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sergio" == Sergio Monteiro Basto <sergio@sergiomb.no-ip.org> writes:

Hi,

 Sergio> hum there is a bug here in git ...

 Sergio> cd /home/sergio/hardware/moviecube/buildroot/output/build/zlib-1.2.5
 Sergio> /usr/bin/make -j1
 Sergio> -C /home/sergio/hardware/moviecube/buildroot/output/build/zlib-1.2.5
 Sergio> DESTDIR=/home/sergio/hardware/moviecube/buildroot/output/target install
 Sergio> make: Entering directory
 Sergio> `/home/sergio/hardware/moviecube/buildroot/output/build/zlib-1.2.5'
 Sergio> cp
 Sergio> libz.a /home/sergio/hardware/moviecube/buildroot/output/target/home/sergio/hardware/moviecube/buildroot/output/staging/usr/lib 

Crap, that's because of the --libdir=$(STAGING_DIR).. I'm afraid I
tested it without that line and added it back later, will fix asap.

-- 
Bye, Peter Korsgaard
