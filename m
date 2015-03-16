From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Mar 2015 17:31:20 +0100
Subject: [Buildroot] [PATCH 0/7 v7] package/fftw: add a bunch of
	optimisations (branch yem/fftw)
Message-ID: <cover.1426523417.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series aggregates misc optimisation patches for out fftw package,
based on work by Gwenhael and Guillaume.

Thanks to both for their previous work! :-)


Changes v6 -> v7:
  - re-order patches
  - reword promopts ('none' -> 'double')
  - fix SSE2 (not available for long-double, only 'double')  (Gwenhael)
  - force use of NEON when available, not when suer-selected  (Thomas)
  - generate a single library with threads

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

for you to fetch changes up to d316f0f87e1a502eef6d85b9a4d515ad1da8c5ae:

  package/fftw: enable OpenMP if the compiler has that (2015-03-16 17:26:49 +0100)

----------------------------------------------------------------
Gwenhael Goavec-Merou (1):
      fftw: add compile precision option

Yann E. MORIN (6):
      package/fftw: add option for fast maths
      package/fftw: add x86 optimisations
      package/fftw: add ARM optimisations
      package/fftw: disable fortran
      package/fftw: enable threads when the toolchain has them
      package/fftw: enable OpenMP if the compiler has that

 package/fftw/Config.in | 67 ++++++++++++++++++++++++++++++++++++++++++++++++++
 package/fftw/fftw.mk   | 29 ++++++++++++++++++++++
 2 files changed, 96 insertions(+)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
