From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 23 Feb 2010 23:25:21 +0100
Subject: [Buildroot] make -C <buildroot_directory> failed
In-Reply-To: <4f6b.4b844ff0.25c53@getafix.xdna.net>
References: <8128F0FD6C26E14C8EB4BFDB92B8D6B2134B26@2putt.int.lantronix.com>
	<4f6b.4b844ff0.25c53@getafix.xdna.net>
Message-ID: <201002232325.21156.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cameron, All,

On Tuesday 23 February 2010 23:00:16 Cameron Hutchison wrote:
> >Attempting to invoke the top level buildroot makefile from a higher
> >level Makefile or simply with make -C <buildroot_directory> fails during
> >the kernel build. This is even true if 'make -C .' is invoked from the
> >top level buildroot directory, as long as a kernel build is enabled. It
> >appears that the problem has something to do with make's
> >"Entering/Leaving directory" messages, as the output below suggests.

Yes, this is expected behavior:
http://www.gnu.org/software/make/manual/make.html#g_t_002dw-Option

Basically, using $(MAKE) has special behavior, which is fortunate most
os the time, but fails for this specific case, where the second 'make'
is completely decorelated (Makefile-wise) from the calling 'make'.

> >When I passed the --no-print-directory option to make, I was able to
> >build without problems.
> I think I see the problem. See if this patch fixes it. I haven't tested
> this, but this looks right.

I'd say that is the correct fix.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
`------------------------------^-------^------------------^--------------------'
