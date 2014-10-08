From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Oct 2014 12:04:41 +0200
Subject: [Buildroot] [PATCH] ser2net: Add a hash file
In-Reply-To: <543505F5.4080805@imgtec.com> (Markos Chandras's message of "Wed, 
 8 Oct 2014 10:37:57 +0100")
References: <1412692250-13513-1-git-send-email-Vincent.Riera@imgtec.com>
 <1412692250-13513-2-git-send-email-Vincent.Riera@imgtec.com>
 <20141007192331.0908bbcd@free-electrons.com>
 <5434FC83.3070303@imgtec.com>
 <20141008112001.2e0b8b9b@free-electrons.com>
 <543505F5.4080805@imgtec.com>
Message-ID: <87iojuev2e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <Markos.Chandras@imgtec.com> writes:

Hi,

 >> I disagree: more hashes means more work to do when bumping the package.
 >> Either one strong hash, or two weaker hashes should be sufficient IMO.
 >> 
 >> Something to be discussed at the meeting maybe?

 > I am curious, what's the point of supporting more than one hash types?
 > Why not support only the strongest one?

The point is that we want to use the hashes published by upstream if
available, and different projects use different hashes.

We could decide on one specific hash type (the "best one") to use
whenever we calculate a hash ourselves through.

Looking at what we have, that should probably be sha256:

find package -name \*.hash|xargs grep -l Locally|xargs tail -n 1
==> package/gnupg/gnupg.hash <==
sha256  b7b5fdda78849955e0cdbc5a085f3a08f8b7fba126c622085debb62def5d6388        gnupg-1.4.18.tar.bz2

==> package/libksba/libksba.hash <==
sha256  bc96b95516bd2b67f413bc8b5cc5a75a2583c6e666d24dfd0d5bcc6b1aab46f9        libksba-1.3.1.tar.bz2

==> package/libassuan/libassuan.hash <==
sha256  39f8a7c9349aaaf7ccd937b90660153ec4d2d4df2465018754e5bcae5b1db77b        libassuan-2.1.2.tar.bz2

==> package/openssh/openssh.hash <==
sha256  b2f8394eae858dabbdef7dac10b99aec00c95462753e80342e530bbb6f725507        openssh-6.7p1.tar.gz

==> package/dnsmasq/dnsmasq.hash <==
sha256  7d0bd23f5d74b3a6b26a75d5ffcf9db81d461b47cbe578cb65a83a98008600b1        dnsmasq-2.72.tar.xz

==> package/atftp/atftp.hash <==
sha1 fc9e9f821dfd2f257b4a5c32b948ed60b4e31fd1 atftp-0.7.1.tar.gz

==> package/gnupg2/gnupg2.hash <==
sha256  7758e30dc382ae7a7167ed41b7f936aa50af5ea2d6fccdef663b5b750b65b8e0        gnupg-2.0.26.tar.bz2

==> package/dejavu/dejavu.hash <==
sha1 33fa825aa1dd44ce23a11af92b3078e978ff513d dejavu-fonts-ttf-2.34.tar.bz2

==> package/fan-ctrl/fan-ctrl.hash <==
sha1 d8ba5bac15e90c36a4e908ca1c98fac83bf702ea fan-ctrl.c?revision=1.3

==> package/gnutls/gnutls.hash <==
sha256  4762afab5e1b9e829c5f53d2b00cd5e41d43fa6d035efcf239e3fe0459134d45        gnutls-3.2.18.tar.xz

==> package/bash/bash.hash <==
sha256  afc687a28e0e24dc21b988fa159ff9dbcf6b7caa92ade8645cc6d5605cd024d4        bash-4.3.tar.gz

-- 
Bye, Peter Korsgaard
