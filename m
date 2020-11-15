From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Nov 2020 16:09:22 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/linux-backports: use flex
 and bison to generate kconfig parser
In-Reply-To: <20201112120155.333290-1-ju.o@free.fr> (Julien Olivain's message
 of "Thu, 12 Nov 2020 13:01:54 +0100")
References: <20201111162208.362275-1-ju.o@free.fr>
 <20201112120155.333290-1-ju.o@free.fr>
Message-ID: <87361a8xnh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

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

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Changes v1 -> v2:
 >   - Include suggestions from Yann:
 >     Follow the same logic as the Kernel for kconfig flex/bison.

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
