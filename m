From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 19:16:21 +0100
Subject: [Buildroot] [PATCH 2/2] lightning: Added package
In-Reply-To: <1407279610-15589-2-git-send-email-paul@crapouillou.net>
References: <1407279610-15589-1-git-send-email-paul@crapouillou.net>
 <1407279610-15589-2-git-send-email-paul@crapouillou.net>
Message-ID: <20150102191621.49641fd6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Paul Cercueil,

On Wed,  6 Aug 2014 01:00:10 +0200, Paul Cercueil wrote:
> GNU lightning is a library that generates assembly language code
> at run-time.
> 
> https://www.gnu.org/software/lightning/
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  package/Config.in              |  1 +
>  package/lightning/Config.in    |  8 ++++++++
>  package/lightning/lightning.mk | 18 ++++++++++++++++++
>  3 files changed, 27 insertions(+)
>  create mode 100644 package/lightning/Config.in
>  create mode 100644 package/lightning/lightning.mk

Applied, after doing a number of changes. Note that this package was
not compiling properly with a uClibc toolchain with the disassembler
enabled.

The changes I made:

[Thomas:
 - Wrap list of architectures in Config.in
 - Introduce an explicit Config.in option for the disassembler
   support, since it needs both binutils and zlib, which may not be
   easy to guess.
 - Add hash file.
 - Bump to version 2.0.5.
 - Add patch to fix cross-compilation issues on ARM and x86 due to
   AC_RUN_IFELSE() tests.
 - Adjust license information: the library is actually under LGPLv3+,
   not GPLv3. There is a COPYING file with the text of the GPLv3 in
   the code base, but this license doesn't seem to be used in anything
   that is actually installed.
 - Add AUTORECONF = YES since we're now patching configure.ac.
 - Add missing dependency on zlib for the disassembler support.
 - Add a special LIBS=-lintl when enabling the disassembler support
   because binutils libraries use gettext functions, but they are not
   linked against libintl.]

See
http://git.buildroot.net/buildroot/commit/?id=952391db0477d1baa9c451fe0b3dabbfaef5a9b7
for the final commit.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
