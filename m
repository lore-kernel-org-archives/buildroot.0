From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Aug 2016 17:53:56 +0200
Subject: [Buildroot] [PATCH 0/2 v3] toolchain/wrapper: add more paranoid
	checks (branch yem/wrapper)
Message-ID: <cover.1472485693.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This short series introduces more paranoid checks for unsafe paths, and
reports offending options.


Changes v2 -> v3:
  - also handle -idirafter and -iqupte  (Arnout)
  - simplify the code doing the checks  (Thomas)
  - drop stray variables  (Thomas)
  - comment the tricky code  (Thomas)
  - document what unsafe options are; document the checking function

Changes v1 -> v2:
  - don't use a variadic function, use explicit args  (Arnout)
  - -isystem is not always separated from its path  (Arnout)
  - simpler error reporting  (Arnout)
  - add a list of unsafe options and iterate over it; makes it easier to
    handle even more unsafe options


Regards,
Yann E. MORIN.


The following changes since commit 07552de23b95b48412be89ca5c162d8855872206

  tinydtls: fix issue on u_intXX_t being undefined when building with musl (2016-08-29 17:23:41 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 110620526667c2676631a91f4d223e093896bda9

  toolchain/wrapper: extend paranoid check to -isystem (2016-08-29 17:42:13 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      toolchain/wrapper: display options leading to a paranoid failure
      toolchain/wrapper: extend paranoid check to -isystem

 toolchain/toolchain-wrapper.c | 86 ++++++++++++++++++++++++++++++-------------
 1 file changed, 61 insertions(+), 25 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
