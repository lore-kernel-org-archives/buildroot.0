From: Lucas R. Magasweran <external+buildroot.org@magasweran.com>
Date: Wed, 19 Oct 2011 18:46:35 -0700
Subject: [Buildroot] sed errors with "no input files" and "-e expression #1,
 char 1: unknown command `-'" when configuring host libtool
Message-ID: <1319075195.28308.90.camel@engws02.econolite.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Buildroot users,

I have not seen this issue until I upgraded to Ubuntu 11.10 64-bit. When
configuring host-libtool 2.2.10 I see the following errors from sed.

## -------------------------- ##
## Configuring libtool 2.2.10 ##
## -------------------------- ##
...
checking for a sed that does not truncate output... /bin/sed -i -e
...
checking command to parse /usr/bin/nm output from /usr/bin/gcc
object... /bin/sed: no input files
ok
...
checking for objdir... .libs
/bin/sed: no input files
/bin/sed: no input files
/bin/sed: no input files
checking if /usr/bin/gcc supports -fno-rtti -fno-exceptions... /bin/sed:
-e expression #1, char 1: unknown command: `-'
no
checking for /usr/bin/gcc option to produce PIC... -fPIC -DPIC
checking if /usr/bin/gcc PIC flag -fPIC -DPIC works... /bin/sed: -e
expression #1, char 1: unknown command: `-'
no
...

Afterwards I see many sed errors that repeat "no input files" and
"unknown command". In my research I found that this could happen if the
-e and -i options are reversed but I am not sure how to edit the
configure script to determine if this is happening.

I am running GNU sed version 4.2.1 and GNU gcc (Ubuntu/Linaro
4.6.1-9ubuntu3) 4.6.1.

Can anyone running Ubuntu 11.10 confirm this?

Thanks for your time,

Lucas
