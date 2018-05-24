From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 May 2018 23:03:29 +0200
Subject: [Buildroot] [PATCH] nasm: Fix compilation with GCC 8
In-Reply-To: <20180505023428.32414-1-casantos@datacom.ind.br> (Carlos Santos's
 message of "Fri, 4 May 2018 23:34:28 -0300")
References: <20180505023428.32414-1-casantos@datacom.ind.br>
Message-ID: <87bmd4davy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

 > host-nasm fails to compile with GCC 8:
 > In file included from ./include/nasm.h:46,
 >                  from asm/nasm.c:47:
 > ./include/nasmlib.h:194:1: error: ?pure? attribute on function returning ?void? [-Werror=attributes]
 >  void pure_func seg_init(void);
 >  ^~~~

 > Pull a patch from upstream that removes the stale declaration of
 > seg_init, which was eliminated a long time ago.

 > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
