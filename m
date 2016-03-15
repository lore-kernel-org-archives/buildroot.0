From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Mar 2016 22:07:50 +0100
Subject: [Buildroot] Regarding legal info in package
In-Reply-To: <90B0A5D74F9D1542B45328A4E51B57F0AA591713@PUMAIL01.pu.imgtec.org>
References: <90B0A5D74F9D1542B45328A4E51B57F0AA591713@PUMAIL01.pu.imgtec.org>
Message-ID: <20160315210750.GA5053@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rahul, All,

On 2016-03-15 12:19 +0000, Rahul Bedarkar spake thusly:
> I am updating legal info in some packages. gnutls is licensed under
> LGPLv2.1+ but it depends on gmp package which has LGPLv3+ or GPLv2+
> dual license. That means, gnutls needs to be distributed under
> LGPLv3+ or GPLv2+ dual license. And it's clearly mentioned in README
> file from package source tree.

There's probably a bit of misunderstanding there.

Firts, gnutls is LGPLv2.1+, period. That's the only license that
applies to gnutls. [0]

Second, gmplib is dual-licensed LGPLv3+ or GPLv2+.

Third, the binaries resulting of the combination of gnutls and gmplib
have to be distributed under a license that fullfills all the
requirements of the individual packagees that were combined.

In this case, LGPLv2.1+ is compatible with LGPLv3+, so it is possible to
distibute the binaries resulting of the combination of gnutls and gmplib
under the LGPLv3+ license.

Similarly, LGPLv2.1+ is compatible with the GPLv2+, so it is possible to
distibute the binaries resulting of the combination of gnutls and gmplib
under the GPLv2+ license.

Which means that the binaries resulting of the combination of gnutls and
gmplib may be redistributed under either the LGPLv3+ or the GPLv2+.

Note that what is important in the above is the notion of "binaries
resulting from the combination of". When the packages are considered
separately, they each have their own license. Only when they are
combined (e.g. by way of compilation) does the license compatibility
comes into play.

[0] The library is LGPLv2.1+; the executable are GPLv3+.

> quoting from README file:
> LICENSING
> ---------
> Since GnuTLS version 3.1.10, the core library has been released under
> the GNU Lesser General Public License (LGPL) version 2.1 or later.
> 
> Note, however, that version 6.0.0 and later of the gmplib library used
> by GnuTLS are distributed under a LGPLv3+ or GPLv2+ dual license, and
> as such binaries of this library need to be distributed under either
> LGPLv3+ or GPLv2+ license. If this is undesirable older versions
> of the gmplib which are under LGPLv2.1 (e.g., version 4.2.1) may be
> used instead. (gmplib versions between 4.2.2 through 5.1.3 were
> licensed under LGPLv3+ only).
> 
> In this case, which license <PKG>_LICENSE variable should reflect ?
> Should it be license under which package is released or license under
> which package needs to distributed because of licensing terms of
> dependent packages ?

The former: the license(s) the package is released under.

We can't possibly cover all the possible combinations of packages and
sanely assess the resulting licensing info of the whole. We leave that
to the user to sort out (possibly with his legal team).

For example, what if gnutls is then combined (e.g. by static linking) with
another package that is GPLv3? Surely that is allowed by the license of
gnutls and that package, but we can't account for that in the licensing
information of gnutls, or that would be an endless mess...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
