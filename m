From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 May 2014 11:37:00 +0200
Subject: [Buildroot] [PATCH v2] cmake: forward HOST_{C,
	LD}FLAGS as cmake flags
In-Reply-To: <1399626447-2540-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Fri, 9 May 2014 11:07:27 +0200")
References: <1399626447-2540-1-git-send-email-s.martin49@gmail.com>
Message-ID: <87fvkjb8eb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > During the CMake bootstrap phase, the {C,LD}FLAGS set in the bootstrap
 > environment are not forwarded/converted as CMake flags.

 > The CMake build contains a bootstrap phase building a minimal CMake
 > program using a standard Makfile, then reconfigures itself with this
 > minimal program.

 > On system with no ncurses installed, and because the prefix option
 > points to $(HOST_DIR)/usr, if host-cmake was built after host-ncurses,
 > then ncurses libraries and headers are correctly found (in the host
 > tree) during the second configuration (because of the prefix). However,
 > it fails at building ccmake (the curses interface) because the
 > CMAKE_C_FLAGS, CMAKE_CXX_FLAGS and CMAKE_EXE_LINKER_FLAGS do not
 > point to the host tree.

 > Because these flags are needed when running the bootstrap script,
 > this patch makes sure the same flags are set when running the second
 > configuration.

 > Reported-by: Fabio Porcedda <fabio.porcedda@gmail.com>
 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 > Cc: Fabio Porcedda <fabio.porcedda@gmail.com>
 > Cc: Luca Ceresoli <luca@lucaceresoli.net>

 > ---
 > changes v1 -> v2:
 > - use HOST_CXXFLAGS (Fabio)
 > - cut lines at <=80 char. (Fabio)
 > - fix typo in commit log (Luca)

Committed, thanks.

-- 
Bye, Peter Korsgaard
