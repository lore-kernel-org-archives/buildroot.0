From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Oct 2014 15:37:19 +0200
Subject: [Buildroot] [PATCH 1/2] system/skeleton: make nsswitch install
 conditional
In-Reply-To: <54450F51.5050801@zacarias.com.ar>
References: <1413808086-12177-1-git-send-email-gustavo@zacarias.com.ar>
 <20141020150209.5f8b45a5@free-electrons.com>
 <54450BF5.4000202@zacarias.com.ar>
 <20141020152759.4f438890@free-electrons.com>
 <54450F51.5050801@zacarias.com.ar>
Message-ID: <20141020153719.034df3be@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 20 Oct 2014 10:34:09 -0300, Gustavo Zacarias wrote:

> You've got bigger fish to care about before this tiny file, like
> COPY_GCONV_LIBS in toolchain/toolchain.mk, or:

Agreed. COPY_GCONV_LIBS could also be move to glibc +
toolchain-external. But we indeed need a way to share the logic to
avoid duplicating it.

> gustavoz at asgard ~/git/buildroot/package $ find . -name \*.mk -exec grep
> --with-filename TARGET_FINALIZE {} \;
> ./perl/perl.mk:TARGET_FINALIZE_HOOKS += PERL_FINALIZE_TARGET

Only removes stuff.

> ./luarocks/luarocks.mk:TARGET_FINALIZE_HOOKS += LUAROCKS_FINALIZE_TARGET

Only removes stuff.

> ./google-breakpad/google-breakpad.mk:TARGET_FINALIZE_HOOKS +=
> GOOGLE_BREAKPAD_EXTRACT_SYMBOLS

Only adds stuff to $(STAGING_DIR), doesn't touch $(TARGET_DIR)

> ./python/python.mk:TARGET_FINALIZE_HOOKS += PYTHON_FINALIZE_TARGET
> ./python3/python3.mk:TARGET_FINALIZE_HOOKS += PYTHON3_FINALIZE_TARGET

Only removes stuff.

> Besides it's a file that in essence belongs to skeleton, just
> conditional on (e)glibc.
> You'll have to deal with the other skeleton files as well IMHO, just
> treat is as such.
> (negative logic could be used, remove if it's not needed, but i don't
> think it'll change anything WRT your pet project).

The skeleton can be made a package of its own.

See, I'm not too far away :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
