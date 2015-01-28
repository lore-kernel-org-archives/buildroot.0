From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Jan 2015 22:44:22 +0100
Subject: [Buildroot] [PATCHv3] package/openldap: new package
In-Reply-To: <1422224360-13009-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 25 Jan 2015 23:19:20 +0100")
References: <1422224360-13009-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87k306vavd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: David Bender <codehero@gmail.com>
 > Signed-off-by: David Bender <codehero@gmail.com>
 > [yann.morin.1998 at free.fr:
 >   - remove ldaps config option, use build-time dependencies
 >   - add dependencies against openssl/gnutls/libnss as appropriate
 >   - fix mis-detected tls support when openssl is enabled
 >   - fix strip at install time
 >   - cleanup configure arguments
 >   - add hash file
 >   - fix help entry
 > ]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > ---
 > Changes v2 -> v3:
 >   - add hash file

> +++ b/package/openldap/0001-fix_cross_strip.patch
 > @@ -0,0 +1,74 @@
 > +Fix stripping when cross-compiling
 > +
 > +Probably-Signed-off-by: Dave Bender <bender@benegon.com>
 > +[yann.morin.1998 at free.fr: patch was made by Dave, but he
 > + forgot his SoB line, so I added it]
 > +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

It would be simpler to just remove the 'STRIP = -s' from build/top.mk so
the strip stuff wasn't used, but ok - This patch could conceptually get
upstreamed.

Has it been sent upstream?


> +++ b/package/openldap/Config.in
 > @@ -0,0 +1,9 @@
 > +config BR2_PACKAGE_OPENLDAP
 > +	bool "openldap"
 > +	help
 > +	  OpenLDAP Software is an open source implementation of
 > +	  the Lightweight Directory Access Protocol.
 > +
 > +	  This only installs client-side support.
 > +

It needs wchar:

utf-8-conv.c: In function 'ldap_x_utf8_to_mb':
utf-8-conv.c:349:14: error: 'wctomb' undeclared (first use in this function)

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
