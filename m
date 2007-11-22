From: ing. Federico Fuga <fuga@studiofuga.com>
Date: Thu, 22 Nov 2007 18:50:52 +0100
Subject: [Buildroot] OABI_COMPAT option in kernel missing for arm
Message-ID: <4745C17C.7030609@studiofuga.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am compiling a buildroot on an arm em-x270 board.
The kernel compiled from the buildroot hangs on init because the
Makefile.in.advanced removes the OABI_COMPAT option.
Infact, when compiled with EABI, the buildroot script
target/linux/Makefile.in.advanced removes any OABI_COMPAT options but my
arm target requires that option to work.
I have solved my problem with a simple "#" in the Makefile.in.advanced,
but maybe that should be fixed .
Should I open a bug report?
regards,

ing. Federico Fuga
