From: Romain Izard <romain.izard.pro@gmail.com>
Date: Wed,  3 Feb 2016 12:14:48 +0100
Subject: [Buildroot] [PATCH v1 1/1] coreutils: allow selection of installed
	programs
Message-ID: <1454498088-20233-1-git-send-email-romain.izard.pro@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As the recent revisions of coreutils use a single multi-call executable,
it is not possible to reduce the installed size of coreutils by removing
the unused programs. But the list of installed programs can be passed
when configuring the package, and it is possible ensure that only
required programs are embedded into the multi-call executable.

A global configuration option selects either the default set of
programs, or a configurable set. In the latter case, each coreutil
program has its own option.

Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
---
 package/coreutils/Config.in    | 539 +++++++++++++++++++++++++++++++++++++++++
 package/coreutils/coreutils.mk |  64 ++++-
 2 files changed, 600 insertions(+), 3 deletions(-)

diff --git a/package/coreutils/Config.in b/package/coreutils/Config.in
index d9f614a..2e0038e 100644
--- a/package/coreutils/Config.in
+++ b/package/coreutils/Config.in
@@ -14,6 +14,545 @@ config BR2_PACKAGE_COREUTILS
 
 	  http://www.gnu.org/software/coreutils/
 
+menuconfig BR2_PACKAGE_COREUTILS_SELECT
+	bool "Override the default set of installed coreutils"
+	depends on BR2_PACKAGE_COREUTILS
+
+if BR2_PACKAGE_COREUTILS_SELECT
+
+config BR2_PACKAGE_COREUTILS_SELECT_SQUARE_BRACKET
+	bool "["
+	help
+	  check file types and compare values
+
+config BR2_PACKAGE_COREUTILS_SELECT_ARCH
+	bool "arch"
+	help
+	  print machine hardware name (same as uname -m)
+
+config BR2_PACKAGE_COREUTILS_SELECT_BASE32
+	bool "base32"
+	help
+	  base32 encode/decode data and print to standard output
+
+config BR2_PACKAGE_COREUTILS_SELECT_BASE64
+	bool "base64"
+	help
+	  base64 encode/decode data and print to standard output
+
+config BR2_PACKAGE_COREUTILS_SELECT_BASENAME
+	bool "basename"
+	help
+	  strip directory and suffix from filenames
+
+config BR2_PACKAGE_COREUTILS_SELECT_CAT
+	bool "cat"
+	help
+	  concatenate files and print on the standard output
+
+config BR2_PACKAGE_COREUTILS_SELECT_CHCON
+	bool "chcon"
+	help
+	  change file security context
+
+config BR2_PACKAGE_COREUTILS_SELECT_CHGRP
+	bool "chgrp"
+	help
+	  change group ownership
+
+config BR2_PACKAGE_COREUTILS_SELECT_CHMOD
+	bool "chmod"
+	help
+	  change file mode bits
+
+config BR2_PACKAGE_COREUTILS_SELECT_CHOWN
+	bool "chown"
+	help
+	  change file owner and group
+
+config BR2_PACKAGE_COREUTILS_SELECT_CHROOT
+	bool "chroot"
+	help
+	  run command or interactive shell with special root directory
+
+config BR2_PACKAGE_COREUTILS_SELECT_CKSUM
+	bool "cksum"
+	help
+	  checksum and count the bytes in a file
+
+config BR2_PACKAGE_COREUTILS_SELECT_COMM
+	bool "comm"
+	help
+	  compare two sorted files line by line
+
+config BR2_PACKAGE_COREUTILS_SELECT_CP
+	bool "cp"
+	help
+	  copy files and directories
+
+config BR2_PACKAGE_COREUTILS_SELECT_CSPLIT
+	bool "csplit"
+	help
+	  split a file into sections determined by context lines
+
+config BR2_PACKAGE_COREUTILS_SELECT_CUT
+	bool "cut"
+	help
+	  remove sections from each line of files
+
+config BR2_PACKAGE_COREUTILS_SELECT_DATE
+	bool "date"
+	help
+	  print or set the system date and time
+
+config BR2_PACKAGE_COREUTILS_SELECT_DD
+	bool "dd"
+	help
+	  convert and copy a file
+
+config BR2_PACKAGE_COREUTILS_SELECT_DF
+	bool "df"
+	help
+	  report file system disk space usage
+
+config BR2_PACKAGE_COREUTILS_SELECT_DIR
+	bool "dir"
+	help
+	  list directory contents
+
+config BR2_PACKAGE_COREUTILS_SELECT_DIRCOLORS
+	bool "dircolors"
+	help
+	  color setup for ls
+
+config BR2_PACKAGE_COREUTILS_SELECT_DIRNAME
+	bool "dirname"
+	help
+	  strip last component from file name
+
+config BR2_PACKAGE_COREUTILS_SELECT_DU
+	bool "du"
+	help
+	  estimate file space usage
+
+config BR2_PACKAGE_COREUTILS_SELECT_ECHO
+	bool "echo"
+	help
+	  display a line of text
+
+config BR2_PACKAGE_COREUTILS_SELECT_ENV
+	bool "env"
+	help
+	  run a program in a modified environment
+
+config BR2_PACKAGE_COREUTILS_SELECT_EXPAND
+	bool "expand"
+	help
+	  convert tabs to spaces
+
+config BR2_PACKAGE_COREUTILS_SELECT_EXPR
+	bool "expr"
+	help
+	  evaluate expressions
+
+config BR2_PACKAGE_COREUTILS_SELECT_FACTOR
+	bool "factor"
+	help
+	  factor numbers
+
+config BR2_PACKAGE_COREUTILS_SELECT_FALSE
+	bool "false"
+	help
+	  do nothing, unsuccessfully
+
+config BR2_PACKAGE_COREUTILS_SELECT_FMT
+	bool "fmt"
+	help
+	  simple optimal text formatter
+
+config BR2_PACKAGE_COREUTILS_SELECT_FOLD
+	bool "fold"
+	help
+	  wrap each input line to fit in specified width
+
+config BR2_PACKAGE_COREUTILS_SELECT_GROUPS
+	bool "groups"
+	help
+	  print the groups a user is in
+
+config BR2_PACKAGE_COREUTILS_SELECT_HEAD
+	bool "head"
+	help
+	  output the first part of files
+
+config BR2_PACKAGE_COREUTILS_SELECT_HOSTID
+	bool "hostid"
+	help
+	  print the numeric identifier for the current host
+
+config BR2_PACKAGE_COREUTILS_SELECT_HOSTNAME
+	bool "hostname"
+	help
+	  set or print the name of the current host system
+
+config BR2_PACKAGE_COREUTILS_SELECT_ID
+	bool "id"
+	help
+	  print real and effective user and group IDs
+
+config BR2_PACKAGE_COREUTILS_SELECT_INSTALL
+	bool "install"
+	help
+	  copy files and set attributes
+
+config BR2_PACKAGE_COREUTILS_SELECT_JOIN
+	bool "join"
+	help
+	  join lines of two files on a common field
+
+config BR2_PACKAGE_COREUTILS_SELECT_KILL
+	bool "kill"
+	help
+	  send signals to processes, or list signals
+
+config BR2_PACKAGE_COREUTILS_SELECT_LINK
+	bool "link"
+	help
+	  call the link function to create a link to a file
+
+config BR2_PACKAGE_COREUTILS_SELECT_LN
+	bool "ln"
+	help
+	  make links between files
+
+config BR2_PACKAGE_COREUTILS_SELECT_LOGNAME
+	bool "logname"
+	help
+	  print user's login name
+
+config BR2_PACKAGE_COREUTILS_SELECT_LS
+	bool "ls"
+	help
+	  list directory contents
+
+config BR2_PACKAGE_COREUTILS_SELECT_MD5SUM
+	bool "md5sum"
+	help
+	  compute and check MD5 message digest
+
+config BR2_PACKAGE_COREUTILS_SELECT_MKDIR
+	bool "mkdir"
+	help
+	  make directories
+
+config BR2_PACKAGE_COREUTILS_SELECT_MKFIFO
+	bool "mkfifo"
+	help
+	  make FIFOs (named pipes)
+
+config BR2_PACKAGE_COREUTILS_SELECT_MKNOD
+	bool "mknod"
+	help
+	  make block or character special files
+
+config BR2_PACKAGE_COREUTILS_SELECT_MKTEMP
+	bool "mktemp"
+	help
+	  create a temporary file or directory
+
+config BR2_PACKAGE_COREUTILS_SELECT_MV
+	bool "mv"
+	help
+	  move (rename) files
+
+config BR2_PACKAGE_COREUTILS_SELECT_NICE
+	bool "nice"
+	help
+	  run a program with modified scheduling priority
+
+config BR2_PACKAGE_COREUTILS_SELECT_NL
+	bool "nl"
+	help
+	  number lines of files
+
+config BR2_PACKAGE_COREUTILS_SELECT_NOHUP
+	bool "nohup"
+	help
+	  run a command immune to hangups, with output to a non-tty
+
+config BR2_PACKAGE_COREUTILS_SELECT_NPROC
+	bool "nproc"
+	help
+	  print the number of processing units available
+
+config BR2_PACKAGE_COREUTILS_SELECT_NUMFMT
+	bool "numfmt"
+	help
+	  Convert numbers from/to human-readable strings
+
+config BR2_PACKAGE_COREUTILS_SELECT_OD
+	bool "od"
+	help
+	  dump files in octal and other formats
+
+config BR2_PACKAGE_COREUTILS_SELECT_PASTE
+	bool "paste"
+	help
+	  merge lines of files
+
+config BR2_PACKAGE_COREUTILS_SELECT_PATHCHK
+	bool "pathchk"
+	help
+	  check whether file names are valid or portable
+
+config BR2_PACKAGE_COREUTILS_SELECT_PINKY
+	bool "pinky"
+	help
+	  lightweight finger
+
+config BR2_PACKAGE_COREUTILS_SELECT_PR
+	bool "pr"
+	help
+	  convert text files for printing
+
+config BR2_PACKAGE_COREUTILS_SELECT_PRINTENV
+	bool "printenv"
+	help
+	  print all or part of environment
+
+config BR2_PACKAGE_COREUTILS_SELECT_PRINTF
+	bool "printf"
+	help
+	  format and print data
+
+config BR2_PACKAGE_COREUTILS_SELECT_PTX
+	bool "ptx"
+	help
+	  produce a permuted index of file contents
+
+config BR2_PACKAGE_COREUTILS_SELECT_PWD
+	bool "pwd"
+	help
+	  print name of current/working directory
+
+config BR2_PACKAGE_COREUTILS_SELECT_READLINK
+	bool "readlink"
+	help
+	  print resolved symbolic links or canonical file names
+
+config BR2_PACKAGE_COREUTILS_SELECT_REALPATH
+	bool "realpath"
+	help
+	  print the resolved path
+
+config BR2_PACKAGE_COREUTILS_SELECT_RM
+	bool "rm"
+	help
+	  remove files or directories
+
+config BR2_PACKAGE_COREUTILS_SELECT_RMDIR
+	bool "rmdir"
+	help
+	  remove empty directories
+
+config BR2_PACKAGE_COREUTILS_SELECT_RUNCON
+	bool "runcon"
+	help
+	  run command with specified security context
+
+config BR2_PACKAGE_COREUTILS_SELECT_SEQ
+	bool "seq"
+	help
+	  print a sequence of numbers
+
+config BR2_PACKAGE_COREUTILS_SELECT_SHA1SUM
+	bool "sha1sum"
+	help
+	  compute and check SHA1 message digest
+
+config BR2_PACKAGE_COREUTILS_SELECT_SHA224SUM
+	bool "sha224sum"
+	help
+	  compute and check SHA224 message digest
+
+config BR2_PACKAGE_COREUTILS_SELECT_SHA256SUM
+	bool "sha256sum"
+	help
+	  compute and check SHA256 message digest
+
+config BR2_PACKAGE_COREUTILS_SELECT_SHA384SUM
+	bool "sha384sum"
+	help
+	  compute and check SHA384 message digest
+
+config BR2_PACKAGE_COREUTILS_SELECT_SHA512SUM
+	bool "sha512sum"
+	help
+	  compute and check SHA512 message digest
+
+config BR2_PACKAGE_COREUTILS_SELECT_SHRED
+	bool "shred"
+	help
+	  overwrite a file to hide its contents, and optionally delete it
+
+config BR2_PACKAGE_COREUTILS_SELECT_SHUF
+	bool "shuf"
+	help
+	  generate random permutations
+
+config BR2_PACKAGE_COREUTILS_SELECT_SLEEP
+	bool "sleep"
+	help
+	  delay for a specified amount of time
+
+config BR2_PACKAGE_COREUTILS_SELECT_SORT
+	bool "sort"
+	help
+	  sort lines of text files
+
+config BR2_PACKAGE_COREUTILS_SELECT_SPLIT
+	bool "split"
+	help
+	  split a file into pieces
+
+config BR2_PACKAGE_COREUTILS_SELECT_STAT
+	bool "stat"
+	help
+	  display file or file system status
+
+config BR2_PACKAGE_COREUTILS_SELECT_STDBUF
+	bool "stdbuf"
+	depends on !BR2_STATIC_LIBS
+	help
+	  run command with specified buffering settings
+
+config BR2_PACKAGE_COREUTILS_SELECT_STTY
+	bool "stty"
+	help
+	  change and print terminal line settings
+
+config BR2_PACKAGE_COREUTILS_SELECT_SUM
+	bool "sum"
+	help
+	  checksum and count the blocks in a file
+
+config BR2_PACKAGE_COREUTILS_SELECT_SYNC
+	bool "sync"
+	help
+	  Synchronize cached writes to persistent storage
+
+config BR2_PACKAGE_COREUTILS_SELECT_TAC
+	bool "tac"
+	help
+	  concatenate and print files in reverse
+
+config BR2_PACKAGE_COREUTILS_SELECT_TAIL
+	bool "tail"
+	help
+	  output the last part of files
+
+config BR2_PACKAGE_COREUTILS_SELECT_TEE
+	bool "tee"
+	help
+	  read from standard input and write to standard output and files
+
+config BR2_PACKAGE_COREUTILS_SELECT_TEST
+	bool "test"
+	help
+	  check file types and compare values
+
+config BR2_PACKAGE_COREUTILS_SELECT_TIMEOUT
+	bool "timeout"
+	help
+	  run a command with a time limit
+
+config BR2_PACKAGE_COREUTILS_SELECT_TOUCH
+	bool "touch"
+	help
+	  change file timestamps
+
+config BR2_PACKAGE_COREUTILS_SELECT_TR
+	bool "tr"
+	help
+	  translate or delete characters
+
+config BR2_PACKAGE_COREUTILS_SELECT_TRUE
+	bool "true"
+	help
+	  do nothing, successfully
+
+config BR2_PACKAGE_COREUTILS_SELECT_TRUNCATE
+	bool "truncate"
+	help
+	  shrink or extend the size of a file to the specified size
+
+config BR2_PACKAGE_COREUTILS_SELECT_TSORT
+	bool "tsort"
+	help
+	  perform topological sort
+
+config BR2_PACKAGE_COREUTILS_SELECT_TTY
+	bool "tty"
+	help
+	  print the file name of the terminal connected to standard input
+
+config BR2_PACKAGE_COREUTILS_SELECT_UNAME
+	bool "uname"
+	help
+	  print system information
+
+config BR2_PACKAGE_COREUTILS_SELECT_UNEXPAND
+	bool "unexpand"
+	help
+	  convert spaces to tabs
+
+config BR2_PACKAGE_COREUTILS_SELECT_UNIQ
+	bool "uniq"
+	help
+	  report or omit repeated lines
+
+config BR2_PACKAGE_COREUTILS_SELECT_UNLINK
+	bool "unlink"
+	help
+	  call the unlink function to remove the specified file
+
+config BR2_PACKAGE_COREUTILS_SELECT_UPTIME
+	bool "uptime"
+	help
+	  tell how long the system has been running
+
+config BR2_PACKAGE_COREUTILS_SELECT_USERS
+	bool "users"
+	help
+	  print the user names of users currently logged in to the current host
+
+config BR2_PACKAGE_COREUTILS_SELECT_VDIR
+	bool "vdir"
+	help
+	  list directory contents
+
+config BR2_PACKAGE_COREUTILS_SELECT_WC
+	bool "wc"
+	help
+	  print newline, word, and byte counts for each file
+
+config BR2_PACKAGE_COREUTILS_SELECT_WHO
+	bool "who"
+	help
+	  show who is logged on
+
+config BR2_PACKAGE_COREUTILS_SELECT_WHOAMI
+	bool "whoami"
+	help
+	  print effective userid
+
+config BR2_PACKAGE_COREUTILS_SELECT_YES
+	bool "yes"
+	help
+	  output a string repeatedly until killed
+
+endif
+
 comment "coreutils needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 0d7b782..d03120a 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -103,21 +103,79 @@ ifeq ($(BR2_ROOTFS_MERGED_USR),)
 define COREUTILS_CLEANUP_BIN
 	# some things go in root rather than usr
 	for f in $(COREUTILS_BIN_PROGS); do \
-		mv -f $(TARGET_DIR)/usr/bin/$$f $(TARGET_DIR)/bin/$$f || exit 1; \
+		if [ -e $(TARGET_DIR)/usr/bin/$$f]; then \
+			mv -f $(TARGET_DIR)/usr/bin/$$f $(TARGET_DIR)/bin/$$f || exit 1; \
+		fi; \
 	done
 endef
 COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CLEANUP_BIN
 endif
 
+ifeq ($(BR2_PACKAGE_COREUTILS_SELECT),y)
+
+# List of all programs in coreutils
+
+# For install and [, as the Kconfig and autotool names do not match,
+# the different names are separated with ':'
+
+COREUTILS_ALL_PROGS := square_bracket:[ arch base32 base64 basename cat    \
+  chcon chgrp chmod chown chroot cksum comm cp csplit cut date dd df dir   \
+  dircolors dirname du echo env expand expr factor false fmt fold groups   \
+  head hostid hostname id install:ginstall join kill link ln logname ls    \
+  md5sum mkdir mkfifo mknod mktemp mv nice nl nohup nproc numfmt od paste  \
+  pathchk pinky pr printenv printf ptx pwd readlink realpath rm rmdir      \
+  runcon seq sha1sum sha224sum sha256sum sha384sum sha512sum shred shuf    \
+  sleep sort split stat stdbuf stty sum sync tac tail tee test timeout     \
+  touch tr true truncate tsort tty uname unexpand uniq unlink uptime users \
+  vdir wc who whoami yes
+
+define COREUTILS_REAL_OPTNAME
+$(word 2,$(subst :,$(space),$(1)))
+endef
+
+define COREUTILS_OPTNAME
+$(if $(call COREUTILS_REAL_OPTNAME,$(1)),$(call COREUTILS_REAL_OPTNAME,$(1)),$(1))
+endef
+
+define COREUTILS_BR2NAME
+$(call UPPERCASE,$(word 1,$(subst :,$(space),$(1))))
+endef
+
+define COREUTILS_DO_SELECT_NAME
+$(if $(BR2_PACKAGE_COREUTILS_SELECT_$(1)),$(2),$(3))
+endef
+
+define COREUTILS_IS_SELECTED
+$(call COREUTILS_DO_SELECT_NAME,$(call COREUTILS_BR2NAME,$(1)),$(call COREUTILS_OPTNAME,$(1)),,)
+endef
+
+define COREUTILS_IS_NOT_SELECTED
+$(call COREUTILS_DO_SELECT_NAME,$(call COREUTILS_BR2NAME,$(1)),,$(call COREUTILS_OPTNAME,$(1)),)
+endef
+
+COREUTILS_DO_INSTALL := $(foreach a,$(COREUTILS_ALL_PROGS),$(call COREUTILS_IS_SELECTED,$(a)))
+COREUTILS_DO_INSTALL := --enable-install-program=$(subst $(space),$(comma),$(strip $(COREUTILS_DO_INSTALL)))
+
+COREUTILS_NO_INSTALL := $(foreach a,$(COREUTILS_ALL_PROGS),$(call COREUTILS_IS_NOT_SELECTED,$(a)))
+COREUTILS_NO_INSTALL := --enable-no-install-program=$(subst $(space),$(comma),$(strip $(COREUTILS_NO_INSTALL)))
+
+COREUTILS_CONF_OPTS += $(COREUTILS_DO_INSTALL) $(COREUTILS_NO_INSTALL)
+
+else
 ifeq ($(BR2_STATIC_LIBS),y)
 COREUTILS_CONF_OPTS += --enable-no-install-program=stdbuf
 endif
+endif
 
 define COREUTILS_CLEANUP
 	# link for archaic shells
-	ln -fs test $(TARGET_DIR)/usr/bin/[
+	if ! [ -e "$(TARGET_DIR)/usr/bin/[" ]; then \
+		ln -fs test "$(TARGET_DIR)/usr/bin/["; \
+	fi
 	# gnu thinks chroot is in bin, debian thinks it's in sbin
-	mv -f $(TARGET_DIR)/usr/bin/chroot $(TARGET_DIR)/usr/sbin/chroot
+	if [ -e "$(TARGET_DIR)/usr/bin/chroot" ]; then \
+		mv -f "$(TARGET_DIR)/usr/bin/chroot" "$(TARGET_DIR)/usr/sbin/chroot"; \
+	fi
 endef
 
 COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CLEANUP
-- 
2.5.0
