From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jul 2016 09:02:35 +0200
Subject: [Buildroot] [PATCH] package/systemd: import daemon needs
	headers >= 3.11
In-Reply-To: <20160716182856.GB3882@free.fr> (Yann E. MORIN's message of "Sat, 
 16 Jul 2016 20:28:56 +0200")
References: <1468182896-8355-1-git-send-email-yann.morin.1998@free.fr>
 <87eg709ccd.fsf@dell.be.48ers.dk> <20160711202325.GB5122@free.fr>
 <87r3az6y58.fsf@dell.be.48ers.dk>
 <20160716142624.1e045c31@free-electrons.com>
 <20160716182856.GB3882@free.fr>
Message-ID: <87h9bo4uic.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > So, I built a toolchain with Linux headers 3.10 and glibc 2.18. And
 > systemd-importd does not build:

 >     src/import/export-raw.c: In function 'reflink_snapshot':
 >     src/import/export-raw.c:271:26: error: 'O_TMPFILE' undeclared (first use in this function)
 >              new_fd = open(d, O_TMPFILE|O_CLOEXEC|O_NOCTTY|O_RDWR, 0600);
 >                               ^
 >     src/import/export-raw.c:271:26: note: each undeclared identifier is reported only once for each function it appears in
 >     Makefile:16515: recipe for target 'src/import/systemd_export-export-raw.o' failed

 > O_TMPFILE was added in Linux 3.11; glibc added the corresponding
 > definition in glib-2.19.

 >     glibc \ linux   | <= 3.10   | >= 3.11   |
 >     ----------------+-----------+-----------+
 >     <= 2.18         | No        | No*       |
 >> = 2.19         | Yes       | Yes       |

 > *: headers 3.12

 > So, not sure where to go from there...

 > Note: I have not tested uClibc or musl, because,well, systemd depends on
 > glibc...

I would just go for  >= glibc 2.19. People are unlikely to use old glibc
with new kernel headers (and it cannot be built with buildroot).

-- 
Venlig hilsen,
Peter Korsgaard 
