From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 12 Nov 2020 21:53:24 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/linux-backports: use flex
 and bison to generate kconfig parser
In-Reply-To: <20201112120155.333290-1-ju.o@free.fr>
References: <20201111162208.362275-1-ju.o@free.fr>
 <20201112120155.333290-1-ju.o@free.fr>
Message-ID: <20201112205324.GA60815@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

> Upstream backports package does not define the LEX/YACC Makefile
> variables, contrary to the Kernel which is defining those in [1]. The
> default "lex" and "yacc" are then used. On some systems, "yacc" is
> Berkeley Yacc. Kconfig parser files are using non-Posix Bison
> constructs.

> Attempting to generate the parser with byacc fails with error:

>     yacc: e - line 97 of "zconf.y", syntax error
>     %destructor {
>     ^

> This patch defines the LEX and YACC Makefile variable to use flex and
> bison, to fix this issue. The host-bison and host-flex dependencies are
> added only if the host does not have them, following the same logic of
> the Kernel.

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=73a4f6dbe70a1b93c11e2d1d6ca68f3522daf434

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Thank you!

Kind regards,
Petr
