From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Fri, 19 Jun 2015 16:45:25 +0200
Subject: [Buildroot] dependence on bash and coreutils
Message-ID: <55842B05.8050004@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

A script packaged into mariadb galera cluster and necessary for
running a cluster require bash to be run. I was wondering if such a
dependency should be a "select" or a "depends on". What do you think?

Also, the same script calls "sleep" several times with non integer
arguments. The busybox version of sleep will not take such arguments.
There are a few options:

a) patch the script to only pass integer arguments, i.e. replace
"sleep 0.5" with "sleep 1" and "sleep 0.2" also with "sleep 1". I
strongly dislike this alternative.

or

b) make mariadb depend on coreutils, which provides a version of sleep
that takes non floating point arguments.

or

c) somehow patch the busybox package to make available the option to
build sleep with support for floating point arguments and make mariadb
depend on this option.

What do you think is best?

cheers,

- -- 
Sylvain Raybaud
www.green-communications.fr
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVhCsFAAoJEEkkwl4JtJ9yO5EP/jArtDimtgBikZCv5nPWCq3B
NjwPWwadx5zJCcvfaCYz2IC2TRX44cPSSPIAKD2zTGprQDAiir9Fm26AWD3h7MSV
TF5r0ZcPvgH0HMr9ZU5kNh0wA8c1WpZUKrxInEVVmpSe30dkxGwcXId30vYwEoWf
R2AMGUdMfGG11OBmC1rJ8mKQFXMewFPKZ6IR3bP4ECyIvNqA0Lnx5XpnVv9r2LyB
QM33hdLSjTjjD9gOdAQQc2+ZvlkBszsR51SwFHYuGbQz30kgfz6VIW3XgesduKjy
DluVaoi2QhEhQdPM/0IIccj7Ow6jf/WhZ5SAg+OjMMxObwF/t66/6g9JMSN8vRlY
1fQMGzbVoTBBnH0OsY6rXXmzyAre5Zp8d/wfwsb6vTgTpsc76oitEPwcD7CbK4KS
f/0Gzh+ltUK3Hp8j0xLcNiWHbyM1mBpDYcHxwQEQZoQyXc/36jRNCQMMVi9qX8UV
2N7bp6z2e4FwxvIfk21KHa6dInogZJglQYaSI+PUmdhxp9DQ888AftoZs5BuPmrK
3afTuXIfND2X9QuLioY75VmomTAvErDR6cyV7W7c0A4nVUyrLJIjcFfmkiWGCO4a
n0FXKAclukVPY9A4gfQw80AIBt3i8/lkIVZNwn8NaEi5RIuZmHCzWAVOL8ezuBum
rJ2+bpE18Z02z7GjF6gW
=qPmS
-----END PGP SIGNATURE-----
