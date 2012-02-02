From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Feb 2012 23:24:55 +0100
Subject: [Buildroot] [RFC] python bindings handling
In-Reply-To: <878vkk9auh.fsf@macbook.be.48ers.dk>
References: <CAGm1_ksToKWTwgAjys49Nop66WwLSdMi7ztC3Zc=g6QHE-7WbQ@mail.gmail.com>
 <20120127165334.6d1dd39b@skate>
 <878vkk9auh.fsf@macbook.be.48ers.dk>
Message-ID: <20120202232455.03a07aaa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 02 Feb 2012 22:36:22 +0100,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

>  Thomas> I think I would say 2. It's not because you have Python
>  Thomas> *and* you have some library that you necessarily want the
>  Thomas> binding for that lib. Just make those bindings new Python
>  Thomas> packages (in the new Python menu you created!) and that
>  Thomas> should be good. No?
> 
> So you're suggesting to put those BR2_ options in seperate Config.in
> files and source them under the Python menu? Hmm, I'm not sure I like
> that. Aren't most python bindings very small compared to python / the
> libraries they provide bindings for? If so, I think option 1 is nicer
> (similar to how we E.G. handle optional openssl support in lots of
> places).

Ah, then I think I misunderstood. I think those Python bindings were a
*separate* package from the C/C++ library for which the binding is
designed, i.e that you had two packages:

	libfoo
	python-libfoo

In which case I think python-libfoo (which is a separate package)
should go in the Python section.

In the other case (i.e, the binding is directly an option in the C/C++
library itself and both are a single package in terms of upstream
source), then yeah, option 1/ would probably be good.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
