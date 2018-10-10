From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Oct 2018 23:13:40 +0200
Subject: [Buildroot] [PATCH 1/4] python-pycryptodomex: new package
In-Reply-To: <20181009201923.GL2869@scaer>
References: <20180922193631.14369-1-asafka7@gmail.com>
 <20181009155633.2ad54938@windsurf> <20181009201923.GL2869@scaer>
Message-ID: <3c49d9fc-33b4-b6a3-22ee-e9285c1733bf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 9/10/18 22:19, Yann E. MORIN wrote:
> Thomas, Asaf, All,
> 
> On 2018-10-09 15:56 +0200, Thomas Petazzoni spake thusly:
>> On Sat, 22 Sep 2018 22:36:28 +0300, Asaf Kahlon wrote:
>>> Cryptographic library for Python
>>> +PYTHON_PYCRYPTODOMEX_LICENSE = Apache-2.0
>>
>> I am not sure this is an accurate description of the license terms.
>> Reading https://pycryptodome.readthedocs.io/en/latest/src/license.html
>> (which is the same as the LICENSE.rst you use as a license file), it
>> says:
>>
>> """
>> The source code in PyCryptodome is partially in the public domain and
>> partially released under the BSD 2-Clause license.
>> """
>>
>> There is also the text of the Apache 2.0 license, but it doesn't say to
>> which part of the code it applies.
> 
> It states:   Apache 2.0 license (Wycheproof)
> And by grepping the source tree, it seems that 'Wycheproof' is the
> slef-test test harness, as we can only find it in lib/Crypto/SelfTest/
> and in setup.py, supposedly to ignore warnign from said test harness, and
> to list it as the data to package.
> 
> So, I think we can ignore the Apache-2.0 license, as it does not cover
> stuff that goes on the target.

 Ack that. Si Apache-2.0 is definitely wrong.


>> And there is a special constraint for the OCB cipher, that it cannot be
>> used for military purposes. I am not sure how Debian accepts that, but
>> they do accept it:
>> https://metadata.ftp-master.debian.org/changelogs/main/p/pycryptodome/pycryptodome_3.6.1-2_copyright.
> 
> In fact, there are 3 licenses under which OCB is made available;
>     http://web.cs.ucdavis.edu/~rogaway/ocb/license.htm
> 
>   * License 1 ? License for Open-Source Software Implementations of OCB
>     (Jan 9, 2013)
> 
>   * License 2 ? General License for Non-Military Software Implementations
>     OCB (Jan 10, 2013).
> 
>   * License 3 ? Patent License for OpenSSL (Nov 13, 2013).

 Note that all three of them are *patent* licenses. That's why Debian doesn't
make a problem of it. Debian only uses license 1.

 The OCB *code* is all under BSD-2-Clause, as far as I can see. There are
actually 2 implementations: one in python that does not come from pycrypto
AFAICS, and one from libtom.

> 
> As far as I understand the licensing terms, OCB is available udner any
> license to the choosing of the user of OCB. The pycryptodome developpers
> have not choosen a license, and instead decided to propagate that choice
> down to the user of pycryptodome.

 Ack.

> 
>> Yann, Arnout, I'm interested by your opinion on this package.
> 
> So, I would state something like:
> 
>     PYTHON_PYCRYPTODOMEX_LICENSE = \
>         BSD-2c, \

 BSD-2-Clause

>         Public Domain (pycrypto original code), \
>         OCB license (OCB cypher)

 I would clarify this as "OCB patent license". The (OCB cypher) is not really
useful IMO. Anyway OCB is not a cipher, it's a mode.

 In terms of license files, in addition to LICENSE.rst, I think we also need
Doc/LEGAL/COPYRIGHT.pycrypto

 Regards,
 Arnout

> 
> Regards,
> Yann E. MORIN.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
