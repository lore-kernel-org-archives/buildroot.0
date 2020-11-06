From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 06 Nov 2020 21:28:42 +0100
Subject: [Buildroot] [PATCH 2/4] pkg-infra: add possiblity to check
 downloaded files against known hashes
References: <cover.1404416102.git.yann.morin.1998@free.fr>
 <3ab303bd4f1ee78900e7fafc90947e30319635b7.1404416102.git.yann.morin.1998@free.fr>
 <retd7hxdrv.ln2@ID-313208.user.individual.net>
 <20201105211232.GO2887157@scaer>
Message-ID: <q8og7hx2p3.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 05 Nov 2020 22:12:32 +0100 schrieb Yann E. MORIN:

> Bernd, All,
> 
> On 2020-11-05 19:38 +0100, Bernd Kuhls spake thusly:
>> Am Thu, 03 Jul 2014 21:36:21 +0200 schrieb Yann E. MORIN: sqlite.org
>> started to release sha3 hashes for their tarballs:
>> https://www.sqlite.org/download.html
>> 
>> Apparently a sha3sum utility is not available so I tried
>> 
>> openssl dgst -sha3-256 dl/sqlite/sqlite-autoconf-3330000.tar.gz
>> 
>> which shows the hash mentioned upstream:
>> 
>> SHA3-256(dl/sqlite/sqlite-autoconf-3330000.tar.gz)=
>> 6e94e9453cedf8f2023e3923f856741d1e28a2271e9f93d24d95fa48870edaad
>> 
>> Should we add the openssl-way to verify sha3 hashes?
> 
> Unfortunately, this is only present in very recent versions of openssl.
> It was missing in Ubuntu 16.04, while it is present in 18.04 (both still
> supported LTS versions)
> 
> So, I am not really sure how we can move forward...

Hi Yann,

what about host-rhash?
http://patchwork.ozlabs.org/project/buildroot/list/?series=212773

$ output/host/bin/rhash --sha3-256 dl/sqlite/sqlite-
autoconf-3330000.tar.gz 
6e94e9453cedf8f2023e3923f856741d1e28a2271e9f93d24d95fa48870edaad  dl/
sqlite/sqlite-autoconf-3330000.tar.gz

Regards, Bernd
