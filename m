From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 9 Oct 2018 22:19:23 +0200
Subject: [Buildroot] [PATCH 1/4] python-pycryptodomex: new package
In-Reply-To: <20181009155633.2ad54938@windsurf>
References: <20180922193631.14369-1-asafka7@gmail.com>
 <20181009155633.2ad54938@windsurf>
Message-ID: <20181009201923.GL2869@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Asaf, All,

On 2018-10-09 15:56 +0200, Thomas Petazzoni spake thusly:
> On Sat, 22 Sep 2018 22:36:28 +0300, Asaf Kahlon wrote:
> > Cryptographic library for Python
> > +PYTHON_PYCRYPTODOMEX_LICENSE = Apache-2.0
> 
> I am not sure this is an accurate description of the license terms.
> Reading https://pycryptodome.readthedocs.io/en/latest/src/license.html
> (which is the same as the LICENSE.rst you use as a license file), it
> says:
> 
> """
> The source code in PyCryptodome is partially in the public domain and
> partially released under the BSD 2-Clause license.
> """
> 
> There is also the text of the Apache 2.0 license, but it doesn't say to
> which part of the code it applies.

It states:   Apache 2.0 license (Wycheproof)
And by grepping the source tree, it seems that 'Wycheproof' is the
slef-test test harness, as we can only find it in lib/Crypto/SelfTest/
and in setup.py, supposedly to ignore warnign from said test harness, and
to list it as the data to package.

So, I think we can ignore the Apache-2.0 license, as it does not cover
stuff that goes on the target.

> And there is a special constraint for the OCB cipher, that it cannot be
> used for military purposes. I am not sure how Debian accepts that, but
> they do accept it:
> https://metadata.ftp-master.debian.org/changelogs/main/p/pycryptodome/pycryptodome_3.6.1-2_copyright.

In fact, there are 3 licenses under which OCB is made available;
    http://web.cs.ucdavis.edu/~rogaway/ocb/license.htm

  * License 1 ? License for Open-Source Software Implementations of OCB
    (Jan 9, 2013)

  * License 2 ? General License for Non-Military Software Implementations
    OCB (Jan 10, 2013).

  * License 3 ? Patent License for OpenSSL (Nov 13, 2013).

As far as I understand the licensing terms, OCB is available udner any
license to the choosing of the user of OCB. The pycryptodome developpers
have not choosen a license, and instead decided to propagate that choice
down to the user of pycryptodome.

> Yann, Arnout, I'm interested by your opinion on this package.

So, I would state something like:

    PYTHON_PYCRYPTODOMEX_LICENSE = \
        BSD-2c, \
        Public Domain (pycrypto original code), \
        OCB license (OCB cypher)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
