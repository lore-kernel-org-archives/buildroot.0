From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 08 Jul 2008 17:41:33 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <d6cda7730807080621w4f148e4aqc6f8e29b1144ca5b@mail.gmail.com>
References: <20080707232011.1D0473C608@busybox.net>	<878wwdvszs.fsf@macbook.be.48ers.dk>	<20080708071418.GB23887@cloud.net.au>	<87r6a4ssaq.fsf@macbook.be.48ers.dk>
	<d6cda7730807080621w4f148e4aqc6f8e29b1144ca5b@mail.gmail.com>
Message-ID: <48738AAD.8010208@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Thiago A. Corr?a skrev:
> On Tue, Jul 8, 2008 at 5:18 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>  Hamish> Maybe we need to a -include a Makefile.local which would
>>  Hamish> allow Ulf and others to customise the make without changing
>>  Hamish> the master Makefile..
>>
>> Yes, that might be an idea.
> 
> Similarly one in package/Config.in would be nice. I have some custom
> packages that are not meant to be commited, and sometimes I get
> conflicts.

I proposed this two years ago.
The idea was to have a directory "local", which contains
an empty Makefile.in and an empty Config.in

By overwriting these files with something else you
can add your own stuff, by just copying your real
local directory to a new buildroot tree.

This was not well received because it would allow people to
build things not present in the mainstream, and it is good
to make it hard for people to do things which is not supported
by mainstream.

Today buildroot supports storing and retrieving custom
project configurations by "make saveconfig" and this
will create the local directory if not present
and if the BR2_LOCAL environment variable is not set.
If it is set, then the local directory can located elsewhere.

Maybe it is time to add this.



> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIc4qtAyRRH5cXxqwRAr0vAJ42jpxj9lN/t8k64uKlC02N5rvOwQCgn00X
/kCYLxgsJu+91S7MXcZ6MFE=
=ydpb
-----END PGP SIGNATURE-----
