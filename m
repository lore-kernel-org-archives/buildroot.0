From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 Feb 2012 22:36:22 +0100
Subject: [Buildroot] [RFC] python bindings handling
In-Reply-To: <20120127165334.6d1dd39b@skate> (Thomas Petazzoni's message of
 "Fri, 27 Jan 2012 16:53:34 +0100")
References: <CAGm1_ksToKWTwgAjys49Nop66WwLSdMi7ztC3Zc=g6QHE-7WbQ@mail.gmail.com>
 <20120127165334.6d1dd39b@skate>
Message-ID: <878vkk9auh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Fri, 27 Jan 2012 16:02:54 +0100,
 Thomas> Yegor Yefremov <yegorslists@googlemail.com> a ?crit :

 >> How should we handle Python and other bindings?
 >> 
 >> 1. check if Python etc is selected and enable them automatically?
 >> 2. make an option per package containing bindings
 >> 3. something else

 Thomas> I think I would say 2. It's not because you have Python *and* you have
 Thomas> some library that you necessarily want the binding for that lib. Just
 Thomas> make those bindings new Python packages (in the new Python menu you
 Thomas> created!) and that should be good. No?

So you're suggesting to put those BR2_ options in seperate Config.in
files and source them under the Python menu? Hmm, I'm not sure I like
that. Aren't most python bindings very small compared to python / the
libraries they provide bindings for? If so, I think option 1 is nicer
(similar to how we E.G. handle optional openssl support in lots of
places).


-- 
Bye, Peter Korsgaard
