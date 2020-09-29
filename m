From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 29 Sep 2020 22:40:09 +0000
Subject: [Buildroot] [Bug 13216] [Documentation] 2020.02.6 requires GNU find
 utils
In-Reply-To: <bug-13216-163@https.bugs.busybox.net/>
References: <bug-13216-163@https.bugs.busybox.net/>
Message-ID: <bug-13216-163-13aU0AwjeM@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13216

--- Comment #4 from Waitman Gobble <waitman@waitman.net> ---
It's Alpine Linux (edge) 

default 'find' is busybox. help doesn't mention printf. But can install
findutils and it's GNU find with -printf





find 
BusyBox v1.32.0 () multi-call binary.

Usage: find [-HL] [PATH]... [OPTIONS] [ACTIONS]

Search for files and perform actions on them.
First failed action stops processing of current file.
Defaults: PATH is current directory, action is '-print'

        -L,-follow      Follow symlinks
        -H              ...on command line only
        -xdev           Don't descend directories on other filesystems
        -maxdepth N     Descend at most N levels. -maxdepth 0 applies
                        actions to command line arguments only
        -mindepth N     Don't act on first N levels
        -depth          Act on directory *after* traversing it

Actions:
        ( ACTIONS )     Group actions for -o / -a
        ! ACT           Invert ACT's success/failure
        ACT1 [-a] ACT2  If ACT1 fails, stop, else do ACT2
        ACT1 -o ACT2    If ACT1 succeeds, stop, else do ACT2
                        Note: -a has higher priority than -o
        -name PATTERN   Match file name (w/o directory name) to PATTERN
        -iname PATTERN  Case insensitive -name
        -path PATTERN   Match path to PATTERN
        -ipath PATTERN  Case insensitive -path
        -regex PATTERN  Match path to regex PATTERN
        -type X         File type is X (one of: f,d,l,b,c,s,p)
        -executable     File is executable
        -perm MASK      At least one mask bit (+MASK), all bits (-MASK),
                        or exactly MASK bits are set in file's mode
        -mtime DAYS     mtime is greater than (+N), less than (-N),
                        or exactly N days in the past
        -mmin MINS      mtime is greater than (+N), less than (-N),
                        or exactly N minutes in the past
        -newer FILE     mtime is more recent than FILE's
        -inum N         File has inode number N
        -user NAME/ID   File is owned by given user
        -group NAME/ID  File is owned by given group
        -size N[bck]    File size is N (c:bytes,k:kbytes,b:512 bytes(def.))
                        +/-N: file size is bigger/smaller than N
        -links N        Number of links is greater than (+N), less than (-N),
                        or exactly N
        -empty          Match empty file/directory
        -prune          If current file is directory, don't descend into it
If none of the following actions is specified, -print is assumed
        -print          Print file name
        -print0         Print file name, NUL terminated
        -exec CMD ARG ; Run CMD with all instances of {} replaced by
                        file name. Fails if CMD exits with nonzero
        -exec CMD ARG + Run CMD with {} replaced by list of file names
        -delete         Delete current file/directory. Turns on -depth option
        -quit           Exit




#apk add findutils

# find 
find (GNU findutils) 4.7.0
Copyright (C) 2019 Free Software Foundation, Inc.

Usage: find [-H] [-L] [-P] [-Olevel] [-D debugopts] [path...] [expression]

default path is the current directory; default expression is -print
expression may consist of: operators, options, tests, and actions:
operators (decreasing precedence; -and is implicit where no others are given):
      ( EXPR )   ! EXPR   -not EXPR   EXPR1 -a EXPR2   EXPR1 -and EXPR2
      EXPR1 -o EXPR2   EXPR1 -or EXPR2   EXPR1 , EXPR2
positional options (always true): -daystart -follow -regextype

normal options (always true, specified before other expressions):
      -depth --help -maxdepth LEVELS -mindepth LEVELS -mount -noleaf
      --version -xdev -ignore_readdir_race -noignore_readdir_race
tests (N can be +N or -N or N): -amin N -anewer FILE -atime N -cmin N
      -cnewer FILE -ctime N -empty -false -fstype TYPE -gid N -group NAME
      -ilname PATTERN -iname PATTERN -inum N -iwholename PATTERN -iregex
PATTERN
      -links N -lname PATTERN -mmin N -mtime N -name PATTERN -newer FILE
      -nouser -nogroup -path PATTERN -perm [-/]MODE -regex PATTERN
      -readable -writable -executable
      -wholename PATTERN -size N[bcwkMG] -true -type [bcdpflsD] -uid N
      -used N -user NAME -xtype [bcdpfls]      -context CONTEXT

actions: -delete -print0 -printf FORMAT -fprintf FILE FORMAT -print 
      -fprint0 FILE -fprint FILE -ls -fls FILE -prune -quit
      -exec COMMAND ; -exec COMMAND {} + -ok COMMAND ;
      -execdir COMMAND ; -execdir COMMAND {} + -okdir COMMAND ;

Valid arguments for -D:
exec, opt, rates, search, stat, time, tree, all, help
Use '-D help' for a description of the options, or see find(1)

Please see also the documentation at http://www.gnu.org/software/findutils/.
You can report (and track progress on fixing) bugs in the "find"
program via the GNU findutils bug-reporting page at
https://savannah.gnu.org/bugs/?group=findutils or, if
you have no web access, by sending email to <bug-findutils@gnu.org>.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
