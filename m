From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 28 Mar 2017 09:34:46 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: remove sha1 external
	dependency
In-Reply-To: <8760it6fof.fsf@dell.be.48ers.dk>
References: <20170326201744.12202-1-romain.naour@gmail.com>
 <8760it6fof.fsf@dell.be.48ers.dk>
Message-ID: <CANLo3Jh+o-QJoDBrMv_C8NzGUaQTZXY7Hg51RrMC+R7P09BYxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,


Le 28 mars 2017 09:09, "Peter Korsgaard" <peter@korsgaard.com> a ?crit :

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > --with-sha1 option was removed since mesa 1.17.0 by commit [1].
 > [1] https://cgit.freedesktop.org/mesa/mesa/commit/?id=d1efa09d34
2bff3e5def2978a0bef748d74f9c82

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/mesa3d/mesa3d.mk | 11 -----------

What about the comment and logic in Config.in?

       # We need a SHA1 implementation. If either openssl or
        # libgcrypt are already part of the build, we'll use one of
        # them, otherwise, use the small libsha1 library.
        select BR2_PACKAGE_LIBSHA1 if (!BR2_PACKAGE_OPENSSL &&
!BR2_PACKAGE_LIBGCRYPT)


I missed it...
It must be removed as well.

Can you fix this ?
Otherwise I will send a patch this evening.

Best regards,
Romain



--
Bye, Peter Korsgaard
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170328/2c05fb94/attachment.html>
