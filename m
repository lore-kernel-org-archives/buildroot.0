From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Mar 2015 14:54:01 +0100
Subject: [Buildroot] [PATCH 0/7 v6] package/fftw: add a bunch of
	optimisations (branch yem/fftw)
Message-ID: <cover.1426513949.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series aggregates misc optimisation patches for out fftw package,
based on work by Gwenhael and Guillaume.

Thanks to both for their previous work! :-)


Changes v5 -> v6:
  - architecture optimisations are not available for all precisions
    (Thomas, Gwenhael)

Changes v4 -> v5:
  - use --disable-XXX in first patch
  - add architecture optimisations for x86 and ARM
  - add other optimisations (threads, openMP, fast maths)


Regards,
Yann E. MORIN.


The following changes since commit c511ca937d4627df7d601a999945faa20fe4cc8d:

  network-manager: add hash file (2015-03-16 14:19:30 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/fftw

for you to fetch changes up to 0842316b8be377f09daf4c2f6a8d05fd303237d8:

  package/fftw: add option for fast maths (2015-03-16 14:37:43 +0100)

----------------------------------------------------------------
Gwenhael Goavec-Merou (1):
      fftw: add compile precision option

Yann E. MORIN (6):
      package/fftw: add x86 optimisations
      package/fftw: add ARM optimisations
      package/fftw: disable fortran
      package/fftw: enable threads when the tooclhain has them
      package/fftw: enable OpenMP if the compiler has that
      package/fftw: add option for fast maths

 package/fftw/Config.in | 63 ++++++++++++++++++++++++++++++++++++++++++++++++++
 package/fftw/fftw.mk   | 21 +++++++++++++++++
 2 files changed, 84 insertions(+)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
