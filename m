From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Jan 2015 23:44:25 +0100
Subject: [Buildroot] [PATCH] new package: freeradius-client
In-Reply-To: <1422224173-9479-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 25 Jan 2015 23:16:13 +0100")
References: <1422224173-9479-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87twzbx2ra.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: David Bender <codehero@gmail.com>
 > Signed-off-by: David Bender <codehero@gmail.com>
 > [yann.morin.1998 at free.fr:
 >   - add optional dependency to nettle
 >   - fix build against nettle
 >   - switch to using the ftp for release, instead of github
 >   - add missing dependency to host-pkgconf
 >   - remove extraneous configure options, we already pass them
 >   - drop extraneous ac_cv_func_memcmp_working, we already pass it
 >   - drop extraneous ac_cv_func_uname, it is properly found
 >   - add hash file
 >   - tweak help entry
 > ]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

> +################################################################################
 > +#
 > +# freeradius-client
 > +#
 > +################################################################################
 > +
 > +FREERADIUS_CLIENT_VERSION = 1.1.7
 > +FREERADIUS_CLIENT_SITE = ftp://ftp.freeradius.org/pub/freeradius/
 > +FREERADIUS_CLIENT_LICENSE = BSD-3c
 > +FREERADIUS_CLIENT_LICENSE_FILES = COPYRIGHT

It seems to be BSD-2c, as I don't see the "endorse" part anywhere:

grep -i endorse output/build/freeradius-client-1.1.7/COPYRIGHT

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
