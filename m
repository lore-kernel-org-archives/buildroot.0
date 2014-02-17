From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Feb 2014 11:44:37 +0100
Subject: [Buildroot] [PATCH 04/10] toolchain/external: add choice to
 select 'AT_LEAST_XXX' header version
In-Reply-To: <CAAXf6LVfv7WWYMykb_FC_BRJxkNxabOJRTPxh-m+vuJSH6rG=w@mail.gmail.com>
References: <cover.1392571021.git.yann.morin.1998@free.fr>
 <74d76e7816e2de0eccb9a24acd0b768c22078dfa.1392571021.git.yann.morin.1998@free.fr>
 <8fdcf8b3-c275-4250-be9c-11bcf4feaa11@email.android.com>
 <20140216204721.GD3417@free.fr>
 <CAAXf6LVOiOQ1jwWX4wT-NjB3gnE=YrroKMhjwsn9Cxa4F=9o5Q@mail.gmail.com>
 <20140217113023.7e5a0845@skate>
 <CAAXf6LVfv7WWYMykb_FC_BRJxkNxabOJRTPxh-m+vuJSH6rG=w@mail.gmail.com>
Message-ID: <20140217114437.06ee9758@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Mon, 17 Feb 2014 11:32:14 +0100, Thomas De Schampheleire wrote:

> >> Maybe you could also add that if the user is unsure about the exact
> >> version, it's 'safer' to specify an older version than a newer one.
> >> And maybe a way of determining the header version used in a toolchain,
> >> in case the user does not know it.
> >
> > We should simply have a check that ensures the selection is correct.
> 
> This was probably answered before, but if we can detect that the
> selection is incorrect, why don't we set the right value
> automatically?

Because we need the values within Kconfig, to show/not show the
different packages. And while we are in Kconfig, we cannot run commands
to test the toolchain that has just been selected by the user. So we
need to ask the user what his toolchain looks like, in order to have
the correct dependencies for packages. And then at build time, we can
check that the configuration selected for the toolchain actually
matches the provided toolchain.

This has already been discussed a million times I guess :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
