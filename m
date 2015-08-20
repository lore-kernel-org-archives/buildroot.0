From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Thu, 20 Aug 2015 14:05:02 +0200
Subject: [Buildroot] [PATCH 7/7 v2] mysql: add mariadb galera cluster
 variant
In-Reply-To: <20150808104308.2438494b@free-electrons.com>
References: <1436458921-4199-1-git-send-email-sylvain.raybaud@green-communications.fr>	<1436458921-4199-8-git-send-email-sylvain.raybaud@green-communications.fr>	<CAHXCMMKV79jKA9YcA_f6KxWuivKMjP8_zZKjHjAHDU6hgiiXCg@mail.gmail.com>	<20150710095419.1ec6da31@free-electrons.com>	<55C4B65A.3010804@green-communications.fr>
 <20150808104308.2438494b@free-electrons.com>
Message-ID: <55D5C26E.7040901@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Dear Thomas, Yann and all,

On 08/08/2015 10:43, Thomas Petazzoni wrote:
> Dear Sylvain Raybaud,
> 
> On Fri, 07 Aug 2015 15:44:58 +0200, Sylvain Raybaud wrote:
> 
>>> OK I can make a virtual package, that seems to make sense.
>>> However, according to section 17.11.6, it seems that I'll have
>>> to patch all packages that depend on mysql, because there is
>>> some special magic to add in the depender's Config.in, am I
>>> right? Is this the way to go?
> We could do something like jpeg (virtual), libjpeg and jpeg-turbo.
> This way, dependers can continue to do a "select
> BR2_PACKAGE_MYSQL", and there is a "choice" in mysql/Config.in to
> choose between the original MySQL or MariaDB.

Ok, I'm going that way.

Of course the original MySQL package will have to be
> renamed to some other name than mysql.

Does "original_mysql" sound good to you?

Cheers,

- -- 
Sylvain Raybaud
www.green-communications.fr
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV1cJuAAoJEEkkwl4JtJ9y/UIP/RPchCfWHqMmHhPGE3OwJ44K
4MVLtB3uVTCXOSPktU2dJh/UgUZ231NitQRp3VYXMyPace+2q+wU8ckJUIW5A4tm
BFwBsIEXI0axLUZJkwGFRRm15VGIcBKnYbEXwVay3hYAb2veBY9N2eSGs44CsDjF
Y1boB7mWSf9wJV7JYR3YkwFeNJMYr1G31bKeCCxEEXFRr9Yx7PDZdQZgn5C6osXE
pKJXnX8abrQz8TVRux+o4brUzGuVDYlOo1vdbdB2AMmV81WLqLSQy1c5u+4fwvxT
/LPnI6HcHbjHs6UN47NtorOxkp4qQT1l8G/WDTsopUwlTA5DQRXu9QcNH4dy5JtB
x0/80iV7t3LvrcuNv2y9Pb3BCRq0MRebzzQkz7AIYWzYtwWODzTa3Sxkavkg0yoZ
6ZygDWNNAwE0LYZkAuQZW1UGot63gwJsaGjhi1DdbrcWdbGMviScT2lu/PgEnlS2
QoqFfiU1LF7swrGxSCDQ7zYWif/aUzE+Tk7IjbgUyEJFOJNLHHursRCZkAo67F7F
vln2gpQhavWrCVtq2kqtjJTrqh2r6l3UXmrPXgVFI75YD87FC3P88IcDxYQNJVz9
aoIgXNwXWDI3RRDMOk1Kn01P8k4ymFjyBH3g76j7xPCAL87Zqop0W2+fSH9UYOID
d2IfI5N1VsBbyLfeBy2L
=hT7W
-----END PGP SIGNATURE-----
