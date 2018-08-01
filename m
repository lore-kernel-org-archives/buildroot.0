From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed,  1 Aug 2018 14:57:17 +0200
Subject: [Buildroot] [PATCH 0/4] minicom: update to use latest git repository
Message-ID: <20180801125721.34654-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Minicom is now available on a git repository at:
https://salsa.debian.org/minicom-team/minicom.git
Lot of fixes has been added since version 2.7-1 and RS485 support has been
added too under serial port configuration.

Git shortlog follows starting from version 2.7 since commit for 2.7-1
debian version is not present.
The only difference between version 2.7-1(debian) and 2.7 seems to be
a coding style change in src/config.c file that breaks every line into a
string like:
(
"aaa"
"bbb"
"ccc"
)
instead of:
(
"aaa\
 bbb\
 ccc"
)
**************************************************************************
Adam Lackorzynski (85):
      Added tag v2.7 for changeset ca0e6c0e1c7d
      Set version to 2.7.90
      Rename configure.in to configure.ac
      Add delta timestamp mode
      Enable SIGALRM signal
      Implement HPA ESC sequence
      Debugging aid (disabled)
      man: add "U" key shortcut description
      Fix filename of non-global config settings.
      Update indonesian translation
      Update french translations
      Use dial_tty in statusline
      Update by french translation team
      Add more TODO/ideas
      musl-libc compile fix
      Change MAXNAMLEN to POSIX's NAME_MAX
      Convert ChangeLog to UTF8
      Add alternative window support
      Remove SMOOTH code blocks
      da.po: Update from translation team
      Add ARRAY_SIZE macro
      Add default for missing function keys
      TODO: move location of config files to ~/.config
      Add F11+F12 for use in macros
      nb.po: Update from translation team
      script: Proper shell exit status handling.
      Add bug description
      Improvement to socket handling code
      autogen.sh: Set to 1.15
      loadconv: Add missing fclose()
      Add DTR toggle via TIOCMBIC+TIOCMBIS
      remove conditional DTR toggle enable
      Add entry
      Discontinue Changelog
      Fix printf warning on 64bit
      Updated swedish translation by Sebastian Rasmussen
      Fix color setting vt_pinit
      Color settings: Simplify same term color message
      Add "bug fixes" entry
      Change mbslen to mbswidth
      Add check_io_input() function
      Fix return value when socket got closed
      Add serbian translation
      TODO: Transmit delay has no influence on macros
      TODO: Need to move .macros location too
      Use vt_send for macros too
      Improve status line redrawing
      Simplify pointer logic in output function
      Fix CVE-2017-7467, a remote exploitalbe out of bound access
      TODO: Add to make literal capture available
      TODO: Add note on not running as root
      Remove absolute paths to called programs
      Make upload/download window wider
      windiv: Add sys/types.h
      Add sys/wait.h include
      Add a missing 'free' for a calloc.
      Fix type of vt_tabs for proper left shift
      Free dialents on exit
      dial: Remove tagged variable and code
      Use ARRAY_SIZE macro
      Zero initialize malloc'ed buffer
      Fix behind-buffer access in input window
      Fix buf size calculation by using ARRAY_SIZE
      Fix value for one mbswidth test
      Fix writing over end of array
      Redraw status line on screen size changes
      Support a second value for the mbswidth check
      Fix build with SVR4_LOCKS
      Fix a -Wformat-truncation warning from gcc7
      Fix -Wformat-truncation warning by gcc7
      Annotate switch-case fall-throughs
      Fix parsing of MINICOM env-var
      Introduce -O option, and add timestamps
      timestamping: Only print if prev time exists
      Add simplified chinese translation
      man: Add current maintainer
      Initial support for TCP connections
      Abstract check_io functionality
      Change return type of check_io_input to bool
      Update spanish translation
      Flush output before delaying output
      ascii-xfr: Put flushing into a function
      ascii-xfr: Apply 'static'
      configure.ac: Add -Wno-format-truncation
      Common FALLTHRU style

Giulio Benetti (4):
      Add RS485 parameters.
      Add RS485 menu entries to "Serial port Setup"
      Handle RS485 low-level
      sysdep1: avoid asserting rts when rs485 enabled

Martin A. Godisch (2):
      fixed text width in history buffer message box
      properly escaped dashes in manual page

Matthias Dieter Walln?fer (1):
      Properly recognise multi-byte characters by introducing

Ond?ej Lyson?k (6):
      Add a missing va_end() call
      Make sure strings copied by strncpy are null-terminated
      Fix file descriptor leaks
      Fix a directory handle leak
      Fix a read past end of buffer
      Fix a warning about an unused variable

Sebastian Rasmussen (3):
      src/man: Fix typos in documentation and comments Fixes #315391
      src: Use gettext in ascii-xfr to make it translatable Fixes #315392
      src: Make various messages/strings translatable Fixes #315392

**************************************************************************

Here is shortlog for Buildroot:

Giulio Benetti (4):
  minicom: update package to use git repository.
  minicom: add pre-configure hook to call autogen.sh
  minicom: delete patches
  minicom: delete hash file.

 .../minicom/0001-musl-libc-compile-fix.patch  | 28 ----------
 ...-change-maxnamlen-to-posixs-name-max.patch | 51 -------------------
 package/minicom/minicom.hash                  |  2 -
 package/minicom/minicom.mk                    | 14 ++++-
 4 files changed, 12 insertions(+), 83 deletions(-)
 delete mode 100644 package/minicom/0001-musl-libc-compile-fix.patch
 delete mode 100644 package/minicom/0002-change-maxnamlen-to-posixs-name-max.patch
 delete mode 100644 package/minicom/minicom.hash

-- 
2.17.1
