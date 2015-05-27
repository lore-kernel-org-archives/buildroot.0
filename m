From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Wed, 27 May 2015 18:46:37 +0200
Subject: [Buildroot] scons and check
In-Reply-To: <CAHXCMMJEh45R-78biuCVpGF2QxLD5FYEEuw=tmkndzKuCJNmew@mail.gmail.com>
References: <5565DCA4.5040002@green-communications.fr>
 <CAHXCMMJEh45R-78biuCVpGF2QxLD5FYEEuw=tmkndzKuCJNmew@mail.gmail.com>
Message-ID: <5565F4ED.8070705@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Samuel

On 27/05/2015 17:41, Samuel Martin wrote:
> According to [1], you need to package check [2] in buildroot as
> well
> 

Yes, I did that. Check is building and installing just fine in buildroot.

>>> 
>>> Now the disturbing thing is that it only happens when I build
>>> on a system on which check is not installed system-wise. If the
>>> build host has check installed, galera builds. Does this mean
>>> that scons uses host haeders instead of those provided by
>>> buildroot packages? Any idea how to make it behave properly?
> It certainly means that galera will depend on host-check; I let
> you check about the dependency on (target-) check.

I made galera dependent on host-check. As a result check is built and
installed. The header is present in output/host/usr/include/check.h
and the .pc file in output/host/usr/lib/pkgconfig/check.pc.

Just to be sure I tried to also make it dependent on target check, it
didn't work either (check is installed on target but scons cannot find
it).

Cheers,

Sylvain

> 
> [1] https://github.com/codership/galera/blob/3.x/README [2]
> http://check.sourceforge.net/

- -- 
Sylvain Raybaud
www.green-communications.fr
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVZfTtAAoJEEkkwl4JtJ9y6/wP/RRj5N5oPsfzP3tdi1fBceh6
SiyzeU4UkpW0UncJ7hAcIONA+cL3+hhxsBe3HKcyaOxyDWNw8Fo26H+Xht3AHQSf
ezQl0L6xwPDT/T8FLqmdnVmYFFzI/ueXZqb+BF8bSK32AaYBcqwRbXOGLUYlVduT
w+7aT5c6xd+j7qX9tm4iwJMdtHVAhZU1bfTl8xzQa0P6M++AJcqzOIMcE7/JKCc2
J/eDfVD7ejg+dhCSgyV0pRzx7grxtmv5lCTtnnXmKGwXuNbYt/YQ8voqXGVM7X/a
SM+8PHJOIL6MmrFkxI4xYMJ7aGlL7lIDbV8dJWLebMFF5RucQZAClhTfr0dzV82g
OSR0ZjFboezkUG0GtbB5dPUIXiCdtptGiiao7NxZxKTwN2mNfHWitOAojmQtZCpH
1J30KRrHqW/Yxpz7qi1pyF6V/H7SXa08XmtzReHXZDqnLelQJvhfm67Va5JUpV8o
pSmF/3uwpVW6Gni+F7/+N9Ko2pVTDQftKeyr3lYy/oYqNI74QYk5FVvoaPdvgt1e
u+6k54Qd1Q5gwFjkx2P+ogf5wC9NWI0beBUqd7uEh63RCOHbmO4M4/Jv3WYpGQRe
zq7zWEItIuRbRkAgyFVLHeqbQKhSG4sts1c9HFKPyknwGkuufFtZiiHLouGzc24B
XDq1vhD6wde2GW+fxmcd
=jHSY
-----END PGP SIGNATURE-----
