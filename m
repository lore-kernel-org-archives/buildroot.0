From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Jun 2014 09:18:18 +0200
Subject: [Buildroot] [PATCH 5 of 7 v3] toolchain-external: change
 version from 'undefined' to 'virtual'
In-Reply-To: <CAAXf6LX4zN1bYaxdskq9Evc5uT2Rw2ip-U7Dqf78bOOXiQgf4A@mail.gmail.com>
References: <patchbomb.1402085576@localhost>
 <640c5d9c5ac14d442207.1402085581@localhost>
 <20140607105728.469dd87d@free-electrons.com>
 <CAAXf6LX4nfHkyBe_G3eQSBTHr67SWb37TFEOL=0q+vZ1DMmdtA@mail.gmail.com>
 <20140608181033.29a00966@free-electrons.com>
 <CAAXf6LX4zN1bYaxdskq9Evc5uT2Rw2ip-U7Dqf78bOOXiQgf4A@mail.gmail.com>
Message-ID: <20140616091818.034ba824@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 8 Jun 2014 19:23:09 +0200, Thomas De Schampheleire wrote:

> I also think the second approach of creating individual external
> toolchain packages is overkill.

I actually don't know. The current toolchain-external/Config.in and
toolchain-external/toolchain-external.mk are very long, splitting them
wouldn't be that bad. I'd like to think a bit more about this, and see
if a solution with individual packages wouldn't actually be better.

For example, one thing that the external toolchain stuff doesn't handle
today is fetching the source code for the toolchain.

> I don't think that the MESSAGE solution adds a lot of complexity: the
> current definition is:
> MESSAGE     = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION)
> $(1)$(TERM_RESET)"
> and this would become something like:
> MESSAGE     = echo "$(TERM_BOLD)>>> $($(PKG)_NAME)
> $($(PKG)_EXTRA_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)"
> 
> where FOO_EXTRA_NAME is a new variabel (name to be discussed) that can
> be set by any package (not only toolchain-external) if appropriate.
> This variable is default empty.
> 
> This is not too complex, right?

It's not really whether it's complex or not: it's a feature that is
added to the core, common infrastructure, to solve the problem of just
one package. If we do this for each and every need of each single
package, the infrastructure is going to become an awful pile of crap,
and that's what I'd like to avoid.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
