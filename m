From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Aug 2015 23:38:20 +0200
Subject: [Buildroot] [PATCH v2] libssh: new package
In-Reply-To: <1440950710-9165-2-git-send-email-fancp2007@gmail.com> (Scott
 Fan's message of "Mon, 31 Aug 2015 00:05:10 +0800")
References: <1440950710-9165-1-git-send-email-fancp2007@gmail.com>
 <1440950710-9165-2-git-send-email-fancp2007@gmail.com>
Message-ID: <87egiktq2b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Scott" == Scott Fan <fancp2007@gmail.com> writes:

 > libssh2 and libssh both implement SSH and provide a library API for apps.
 > Both support SSH, SFTP, auth, channels etc. Both are 25K-30K lines of code.

 > [libssh2 vs libssh - A comparison]
 > http://www.libssh2.org/libssh2-vs-libssh.html

 > Signed-off-by: Scott Fan <fancp2007@gmail.com>

 > ---
 > Changes V1 -> V2:
 >   - fix dependencies

> +config BR2_PACKAGE_LIBSSH
 > +        bool "libssh"
 > +        # Either OpenSSL or libgcrypt are mandatory
 > +        select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
 > +        help
 > +          libssh is a mulitplatform C library implementing the SSHv2

s/mulit/multi/

 > +# from https://red.libssh.org/projects/libssh/files/
 > +md5	bffc9dc548c3bae3a3afc5ac1654b272	libssh-0.7.1.tar.xz

We normally also add a stronger hash so I've added a locally calculated
sha256 hash.

Committed to next with these fixes, thanks.

-- 
Bye, Peter Korsgaard
