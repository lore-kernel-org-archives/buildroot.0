From: =?ISO-8859-1?Q?J=FCrgen?= Benjamin Ronshausen <b.r@rie.eu>
Date: Tue, 06 Nov 2012 20:48:35 +0100
Subject: [Buildroot] how does udhcpc print messages to console
Message-ID: <1352231315.3710.6.camel@debian.fritz.box>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi,

i am trying to print message from my program which is called in a shell
script.

problem is the shell script collects all the output from my program and
doesn't print it immediately.

i noticed, that udhcpc print its messages immediately by calling syslog.

from debug.h

# define LOG_EMERG	"EMERGENCY!"
# define LOG_ALERT	"ALERT!"
# define LOG_CRIT	"critical!"
# define LOG_WARNING	"warning"
# define LOG_ERR	"error"
# define LOG_INFO	"info"
# define LOG_DEBUG	"debug"
# define LOG(level, str, args...) do { printf("%s, ", level); \
				printf(str, ## args); \
				printf("\n"); } while(0)
# define OPEN_LOG(name) do {;} while(0)
#define CLOSE_LOG() do {;} while(0)

from dhcpc.c

OPEN_LOG("udhcpc");
LOG(LOG_INFO, "udhcp client (v%s) started", VERSION);

is there more than this to do?

thx J?rgen
