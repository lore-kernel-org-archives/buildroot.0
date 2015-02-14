From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Feb 2015 11:52:02 +0100
Subject: [Buildroot] [pull request] buildroot-test: misc enhancenments for
	br-reproduce-build
Message-ID: <cover.1423910953.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series contains a few improvements to the br-reproduce-build script
of the buildroot-test infrastructure:

  - allow specifying the 'configuration' in the environment, rather
    than modifying the script;

  - fix URL where to get files from; there is a redirect that is
    badly handled server-side. This is a quick fix to avoid having
    to twidle with the server;

  - preventively quote variables (in case of weird characters in paths)

Regards,
Yann E. MORIN.


The following changes since commit df8198a69a36e35979e130b383ac6e50a548a32f:

  autobuild-run: Do not build strace with outdated MIPS uClibc toolchains (2015-02-02 12:30:55 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot-test yem/reproduce

for you to fetch changes up to 0b43bc60a4856f45924e3814010dc49d0240b1a4:

  br-reproduce-build: quote all variables (2015-02-14 11:32:56 +0100)

----------------------------------------------------------------
Yann E. MORIN (4):
      br-reproduce-build: accept BASE_GIT and OUTPUT_DIR from the env
      br-reproduce-build: use current directory as the default for outputs
      br-reproduce-build: fix URL of gitid
      br-reproduce-build: quote all variables

 utils/br-reproduce-build | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
