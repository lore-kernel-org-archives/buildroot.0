From: Stephen Rodgers <hwstar@rodgers.sdcoxmail.com>
Date: Sun, 06 Sep 2009 10:05:10 -0700
Subject: [Buildroot] coreutils build failing
Message-ID: <4AA3EBC6.3080306@rodgers.sdcoxmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm having trouble getting coreutils to build correctly. I'm using the
buildroot tarball buildroot-2009.08.tar.gz, and I want to build an X86
uclibc development system. At first, I thought that this issue was
resolved through changes to the coreutils patch file submitted on 7/31,
but those changes are incorporated in the distribution tarball, so there
must be something else going on. Here's the output from the failed build:


rename.c:33:21: error: windows.h: No such file or directory
rename.c: In function 'rpl_rename':
rename.c:46: warning: implicit declaration of function 'MoveFileEx'
rename.c:51: warning: implicit declaration of function 'GetLastError'
rename.c:52: error: 'ERROR_FILE_EXISTS' undeclared (first use in this
function)
rename.c:52: error: (Each undeclared identifier is reported only once
rename.c:52: error: for each function it appears in.)
rename.c:52: error: 'ERROR_ALREADY_EXISTS' undeclared (first use in this
function)
rename.c:54: error: 'MOVEFILE_REPLACE_EXISTING' undeclared (first use in
this function)
rename.c:62: error: 'ERROR_FILE_NOT_FOUND' undeclared (first use in this
function)
rename.c:63: error: 'ERROR_PATH_NOT_FOUND' undeclared (first use in this
function)
rename.c:64: error: 'ERROR_BAD_PATHNAME' undeclared (first use in this
function)
rename.c:65: error: 'ERROR_DIRECTORY' undeclared (first use in this
function)
rename.c:69: error: 'ERROR_ACCESS_DENIED' undeclared (first use in this
function)
rename.c:70: error: 'ERROR_SHARING_VIOLATION' undeclared (first use in
this function)
rename.c:74: error: 'ERROR_OUTOFMEMORY' undeclared (first use in this
function)
rename.c:78: error: 'ERROR_CURRENT_DIRECTORY' undeclared (first use in
this function)
rename.c:82: error: 'ERROR_NOT_SAME_DEVICE' undeclared (first use in
this function)
rename.c:86: error: 'ERROR_WRITE_PROTECT' undeclared (first use in this
function)
rename.c:90: error: 'ERROR_WRITE_FAULT' undeclared (first use in this
function)
rename.c:91: error: 'ERROR_READ_FAULT' undeclared (first use in this
function)
rename.c:92: error: 'ERROR_GEN_FAILURE' undeclared (first use in this
function)
rename.c:96: error: 'ERROR_HANDLE_DISK_FULL' undeclared (first use in
this function)
rename.c:97: error: 'ERROR_DISK_FULL' undeclared (first use in this
function)
rename.c:98: error: 'ERROR_DISK_TOO_FRAGMENTED' undeclared (first use in
this function)
rename.c:107: error: 'ERROR_BUFFER_OVERFLOW' undeclared (first use in
this function)
rename.c:108: error: 'ERROR_FILENAME_EXCED_RANGE' undeclared (first use
in this function)
rename.c:112: error: 'ERROR_INVALID_NAME' undeclared (first use in this
function)
rename.c:113: error: 'ERROR_DELETE_PENDING' undeclared (first use in
this function)
make[5]: *** [rename.o] Error 1

TIA,

Steve.
