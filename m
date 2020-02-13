From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2020 22:51:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/parted: disable on uclibc
In-Reply-To: <20200118163929.663035-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 18 Jan 2020 17:39:29 +0100")
References: <20200118163929.663035-1-fontaine.fabrice@gmail.com>
Message-ID: <87d0aidul6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Like postgreSQL (and imagemagick), parted does not build against uClibc
 > with locales enabled, due to an uClibc bug, see
 > http://lists.uclibc.org/pipermail/uclibc/2014-April/048326.html:

 > In file included from atari.c:42:
 > atari.c: In function 'atr_part_correct':
 > atari.c:221:9: error: dereferencing pointer to incomplete type 'struct __uclibc_locale_struct'
 >   return isalnum_l(part->id[0], atr_c_locale)
 >          ^~~~~~~~~

 > So disable parted on uclibc

 > Fixes:
 >  - http://autobuild.buildroot.org/results/992518d340a9f32a0721d6e66936850c4c3ef2e4

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

What about the reverse dependencies? E.G. udisks and python-pyparted?

-- 
Bye, Peter Korsgaard
