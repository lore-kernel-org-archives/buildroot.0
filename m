From: Chris Malarky <chris@malarky.org>
Date: Wed, 20 Jun 2007 11:05:23 +0100
Subject: [Buildroot] buildroot-20070620.tar.bz2 snapshot issue
In-Reply-To: <5d75f4610706200238ud163a2jbe00525e00b274a9@mail.gmail.com>
References: <5d75f4610706200238ud163a2jbe00525e00b274a9@mail.gmail.com>
Message-ID: <1182333923.5719.30.camel@shadow.muzakdomain.imagesound.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, 2007-06-20 at 16:38 +0700, BuraphaLinux Server wrote:
> Hello,
> 
> Using buildroot-20070620.tar.bz2 snapshot on a linux system, when I
> try to compile
> the gettext I get an error.  I used the default gcc and uclibc
> settings.  How can I solve
> this problem?
> 
>< SNIP ><
>
> In file included from plural-eval.c:33:
> ../../gettext-runtime/intl/eval-plural.h:28: error: conflicting types
> for 'plural_eval'
> ../../gettext-runtime/intl/plural-exp.h:115: error: previous
> declaration of 'plural_eval' was here
> make[4]: *** [msgfmt-plural-eval.o] Error 1
> make[4]: Leaving directory
> '/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/gettext-0.14.6/gettext-tools/src'

See: http://bugs.uclibc.org/view.php?id=1300 

This is the first hit in Google for 'gettext plural_eval uclibc'.  I can
definitely recommend having a good search around when you hit a problem
- I have found three fixes so far from notes and patches in the bug
system that haven't yet made it in to SVN.

Regards,
Chris
-- 
Chris Malarky
chris at malarky dot org
