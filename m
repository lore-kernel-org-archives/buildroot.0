From: ir. Tjeerd Pinkert <t.j.pinkert@vu.nl>
Date: Wed, 18 Mar 2015 17:40:46 +0100
Subject: [Buildroot] ipython segfaults on history when no SQLite available
In-Reply-To: <1426695479-12524-1-git-send-email-gwenj@trabucayre.com>
References: <1426695479-12524-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <5509AA8E.6000409@vu.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I notice that ipython segfaults on the following conditions:
- no SQLite
- a command is not found in the history list when arrow-up is pressed.

The following snapshots apply:
------------------------------
# ipython
WARNING: IPython History requires SQLite, your history will not be saved
Python 2.7.9 (default, Mar 17 2015, 11:45:11)



It crashes in this case nothing with "rela" is found in the history:
--------------------------------------------------------------------
In [17]: relapython[1380]: unhandled signal 11 at 00000000 nip b6b10940 
lr b6b10934 code 30001
Segmentation fault
#


System is MPC8313E, powerpc
This might be an upstream issue.

Best regards,


Tjeerd
