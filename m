From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 05 Nov 2020 19:38:51 +0100
Subject: [Buildroot] [PATCH 2/4] pkg-infra: add possiblity to
 check	downloaded files against known hashes
References: <cover.1404416102.git.yann.morin.1998@free.fr>
 <3ab303bd4f1ee78900e7fafc90947e30319635b7.1404416102.git.yann.morin.1998@free.fr>
Message-ID: <retd7hxdrv.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Am Thu, 03 Jul 2014 21:36:21 +0200 schrieb Yann E. MORIN:

> +    # Note: sha3 is not supported, since there is currently no 
implementation
> +    #       (the NIST has yet to publish the parameters).

sqlite.org started to release sha3 hashes for their tarballs:
https://www.sqlite.org/download.html

Apparently a sha3sum utility is not available so I tried

openssl dgst -sha3-256 dl/sqlite/sqlite-autoconf-3330000.tar.gz

which shows the hash mentioned upstream:

SHA3-256(dl/sqlite/sqlite-autoconf-3330000.tar.gz)= 
6e94e9453cedf8f2023e3923f856741d1e28a2271e9f93d24d95fa48870edaad

Should we add the openssl-way to verify sha3 hashes?

Should our hash files support different sha3 methods?
Openssl support sha3-224, sha3-256, sha3-384 & sha3-512.

Regards, Bernd
