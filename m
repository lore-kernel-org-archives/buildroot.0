From: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
Date: Thu, 26 Jul 2007 15:41:36 +0200
Subject: [Buildroot] bash-3.2 segfaults during init
Message-ID: <1185457296.1044.30.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have a weird issue with bash 3.2 and the buildroot snapshot from
20070718. When Linux runs init, which in my system points
to /etc/init.d/rcS it segfaults.

Freeing init memory: 60K (90000000 - 9000f000)
rcS[108]: segfault at 7fc11000 pc 2ab1e6be sp 7fc0fb58 ecr 24

I have narrowed it down to a patch in bash, more specific "bash32-011",
which can be seen here
http://ftp.gnu.org/pub/gnu/bash/bash-3.2-patches/bash32-011

Does anybody else see anything similar?

I build for AVR32 AT32AP7000 and the ATSTK1000 kit, so a bit not
reproducible, sorry :/

-- 
Mvh
Hans-Christian Egtvedt
