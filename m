From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 10 Sep 2018 23:39:24 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/python-cryptography: bump
 version to 2.3.1
References: <20180819184242.21134-1-bernd.kuhls@t-online.de>
 <CAGm1_kvHG2zGtw8U200teJtVnjAOf57t_5XCxRsb3TsBjLi69Q@mail.gmail.com>
 <9fro4fx8c7.ln2@ID-313208.user.individual.net>
 <CAGm1_ktoBnagq89z6WbQcTCB4Fkc5bY2YqEnpy3PeVZbMST_hA@mail.gmail.com>
Message-ID: <ct4j6fxcf3.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 20 Aug 2018 10:05:15 +0200 schrieb Yegor Yefremov:

> I've performed a runtime test and I still get:
[...]
> ImportError:
> /usr/lib/python3.6/site-packages/cryptography/hazmat/bindings/
_openssl.abi3.so:
> undefined symbol: pthread_atfork

Hi,

I did not find the time to do a run-time test yet, sorry, but it seems 
you are not the only one hitting the problem:

https://www.mail-archive.com/yocto at yoctoproject.org/msg38512.html

https://forums.gentoo.org/viewtopic-p-8120220.html?
sid=b50fe8a26a38d18882c5f2915a030408

https://lists.yoctoproject.org/pipermail/yocto/2017-December/039398.html

The solution is to add "-pthread":

https://patchwork.openembedded.org/patch/146240/

https://bugs.gentoo.org/630578

https://gitweb.gentoo.org/repo/gentoo.git/commit/?
id=c824d1c44fcf4556de21d2c8b8ae3732b0fc0c5b

Could you please do another runtime test with this fix added?

Regards, Bernd
