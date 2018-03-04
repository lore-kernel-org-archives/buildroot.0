From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Mar 2018 11:51:41 +0100
Subject: [Buildroot] [PATCH 1/4] support/dependencies: unbreak check for
 UTF-8 locale
In-Reply-To: <33170da034bc7e7d13f68fae924ce2192a11ee36.1520159327.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 4 Mar 2018 11:29:03 +0100")
References: <cover.1520159327.git.yann.morin.1998@free.fr>
 <33170da034bc7e7d13f68fae924ce2192a11ee36.1520159327.git.yann.morin.1998@free.fr>
Message-ID: <87k1us9kqq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Although the UTF-8 locales in mainstream distributions all are suffixed
 > with just 'utf8', the nomenclature is a bit ambiguous with the way they
 > are to be specified with the various LC_* variables, suffixed there with
 > 'UTF-8'.

 > Also, POSIX, ISO, and IEC do not enforce any specific suffix in LC_*
 > variables:
 >     http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap08.html#tag_08_02

 >     """
 >     If the locale value has the form:
 >         language[_territory][.codeset]

 >     it refers to an implementation-provided locale, where settings of
 >     language, territory, and codeset are implementation-defined.
 >     """

 > To avoid any confusion, use a regexp that is a bit more lax when
 > matching locales.

 > Also, quote the regexp, so that the '?' and '$' are not interpreted by
 > the shell.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
