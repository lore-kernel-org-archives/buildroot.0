From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Jan 2013 21:38:34 +0100
Subject: [Buildroot] RTLD_DEEPBIND and uClibc
In-Reply-To: <50F84751.8090102@petroprogram.com>
References: <50F6A26D.4030607@petroprogram.com>
 <201301171844.27209.yann.morin.1998@free.fr>
 <50F84751.8090102@petroprogram.com>
Message-ID: <201301172138.34789.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On Thursday 17 January 2013 Stefan Fr?berg wrote:
> 17.1.2013 19:44, Yann E. MORIN kirjoitti:
> > The full set of libraries from a full-blown eglibc, for an ARM gnueabihf
> > target, is:
> >                       Unstripped    Stripped
> > Only eglibc libs      3.6MiB         2.3MiB
> > With gcc's libs       8.8MiB         3.0MiB
> >
> > And for a relatively complete uClibc for x86_64 target:
> >                       Unstripped    Stripped
> > Only eglibc libs      2.0MiB         1.0MiB
> > With gcc's libs       6.9MiB         1.9MiB
> >
> > (gcc libs: libstdc++ and libgcc_s)
> > (These are not the same architecture, but I went for the toolchains I have
> > locally)
> >
> > So, typically, speaking only about the C library libs, the gain would be
> > around ~1.5MiB.
> 
> Here's the contents of my target /lib
[--SNIP--]
> As you can see from the top of the line the total sum of uClibc + *all
> the other stuff (pam etc..)* is just
> 1.4 MB (the size of libuClibc-0.9.33.2.so itself is just 690 KB)

uClibc == libuClibc.so + libutil.so + ld-uClibc.so + librt.so + libnsl.so
          + libm.so + libdl.so + libcrypt.so

Which totals around 905KiB in your case. Just about the number I gave
you in my previous mail (mine was exactly 1004KiB). And the eglibc numbers
are for the same set of libraries (plus all the libnss libs uClibc does
not have).

> So uClibc wins this round :-)

Yes, in absolute numbers, uClibc *is* smaller than (e)glibc.
We *never* said it was bigger.

What Thomas and I are saying, is that you gained about 1.5MiB on your
520MiB filesystem. That's about a 0.29% gain. Was that worth the hassle?
(Beside learning, of course.)

At one point, one must must leave the keyboard alone, cross one's arms,
look deeply at the screen, and just ask oneself: "Well, where am I
heading, now?"

  - if the point is to prove how smaller a complete system can be by
    using uClibc instead of (e)glibc, then the answer is "marginaly
    smaller", and "no, I should not bother suferring like in Hell"

  - if the point is to prove that building a complete system using
    uClibc instead of (e)glibc, then the answer is "doable, with some
    gotchas in the corners", and "no, I should not suffer like in Hell"

  - if the point is to learn, then yes, go on, learn; this is of course a
    very valid and respectful reason. But, still, the answer is "Whoa, I
    learned quite a bit!" and "no, I should not bother suferring like in
    Hell".

Well, 0.29% smaller... Damn! That's some kind of an achievment! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
