From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 20 Nov 2013 09:25:45 +0100
Subject: [Buildroot] [git commit] udisks: only build documentation if
	requested
In-Reply-To: <CAAXf6LU97aF9Fj2a=0XYcCZLnsXWnWJk29bXQRz-5CHEsUa5zQ@mail.gmail.com>
 (Thomas De Schampheleire's message of "Wed, 20 Nov 2013 09:20:29
 +0100")
References: <20131119225051.6B8BB9BD38@busybox.osuosl.org>
 <CAAXf6LU97aF9Fj2a=0XYcCZLnsXWnWJk29bXQRz-5CHEsUa5zQ@mail.gmail.com>
Message-ID: <87hab7v5rq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 >> -UDISKS_CONF_OPT = --disable-remote-access
 >> +UDISKS_CONF_OPT = --disable-remote-access \
 >> +       $(if $(BR2_HAVE_DOCUMENTATION),,--disable-man-pages)

 > Since BR2_HAVE_DOCUMENTATION is deprecated, shouldn't we disable the
 > man pages unconditionally?

We could, but so far we haven't removed BR2_HAVE_DOCUMENTATION, so I
kept it for now.

I'm planning on removing the option very soon in the 2014.02 cycle.

-- 
Bye, Peter Korsgaard
