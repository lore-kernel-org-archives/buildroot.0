From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 07 Jul 2008 15:25:27 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <873aml7ru0.fsf@macbook.be.48ers.dk>
References: <20080704222950.E76B63C61F@busybox.net>
	<873aml7ru0.fsf@macbook.be.48ers.dk>
Message-ID: <48721947.9020804@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Peter Korsgaard skrev:
>>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2008-07-04 15:29:50 -0700 (Fri, 04 Jul 2008)
>  ulf> New Revision: 22640
> 
>  ulf> Log:
>  ulf> Add 'build with log'
> 
> Do we need this in buildroot? What's the advantage of doing this in
> buildroot instead of in an external wrapper?

Mainly that you get the project name automatically as the name of the log.
Also typing is minimal.

There is a counter maintained, which gets incremented
once per log, so you do not overwrite the old log, but
that can be implemented in an external wrapper.


> 
> As mentioned earlier, it doesn't work with Makefile.autotools.in using
> packages.
> 

Yes, but that is really not a good implementation.
The MAKELEVEL has really nothing to do with what you
want to use it for, it just happens to work, but
this implementation is easily broken.

BR
Ulf Samuelsson.



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIchlHAyRRH5cXxqwRAohoAJ9xmlF+jiphUs5wKGF57nytcf/9ZgCeMWL9
DMoEtSb6vthz4OP/s+gjs9A=
=0+V9
-----END PGP SIGNATURE-----
