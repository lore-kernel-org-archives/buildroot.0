From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  2 Sep 2017 21:38:43 +0200
Subject: [Buildroot] [PATCH 0/4] arch: not all have support in the internal
	backend
Message-ID: <cover.1504381100.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Not all architectures we support have support in upstream gcc, glibc,
binutils, and/or linux. In some cases, only a few specific cores do not
have that support.

Furthermore, some architecture, specific cores, or core behaviour/setup
(like the MIPS NaN support) got support in a specific gcc version.

Currently, we have to account for this in at least three locations:
  - the toolchain backend choice (internal or externsal)
  - the gcc version choice
  - each external toolchain

This series is a first step, to introduce the possibility for each
architecture, or specific core thereof, to specify that it lacks support
in our internal backend.

The logic is indeed a negative logic, which we usaual try to avoid in
Buildroot. However, the vast majority of architectures and individual
cores do have support with our internal backend; only a few of them
don't, and using positive logic would have meant that that vast majority
would have had to add a new 'select'.

The case for the gcc version will be handled in a follow-up series,
while the MIPS NaN fixes will ber in their own further follow-up.


Regards,
Yann E. MORIN.


The following changes since commit e8bcc8ad93745ea9bdcd13c076fec1f3e27b9dee

  cgilua: bump to version 5.2.1 (2017-09-02 20:17:24 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 8cc068d0be7bb232bfbd3bb3c67dc01b476f3297

  arch/mips: internal backend not suitable for some cores (2017-09-02 21:34:30 +0200)


----------------------------------------------------------------
Yann E. MORIN (4):
      arch: add option to disable internal toolchain backend
      arch/csky: internal backend not suitable
      arch/bfin: internal backend not suitable for some cores
      arch/mips: internal backend not suitable for some cores

 arch/Config.in      | 7 +++++++
 arch/Config.in.bfin | 4 ++++
 arch/Config.in.mips | 2 ++
 toolchain/Config.in | 8 +-------
 4 files changed, 14 insertions(+), 7 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
