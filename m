From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Nov 2014 23:09:41 +0100
Subject: [Buildroot] [PATCH 1/4] sysv init scripts: fix == bashism
In-Reply-To: <1414345306-27184-1-git-send-email-dywi@mailerd.de>
 (=?utf-8?Q?=22Andr=C3=A9?=
 Erdmann"'s message of "Sun, 26 Oct 2014 18:41:43 +0100")
References: <1414345306-27184-1-git-send-email-dywi@mailerd.de>
Message-ID: <87mw7xl78a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andr?" == Andr? Erdmann <dywi@mailerd.de> writes:

 > test a == b is not available in e.g. dash.
 > Command(s) used for editing:

 >   q=\[\"\'\]
 >   operand="${q}?[$]?[a-zA-Z0-9_\?]+${q}?"  ## doesn't detect ${VAR}
 >   test_expr="(\[\s+${operand}\s+)==(\s+${operand}\s+\])"

 >   find . -type f -name '[SK][0-9][0-9]*' | \
 >      xargs sed -r -e "s@${test_expr}@\1=\2 at g" -i

 > Signed-off-by: Andr? Erdmann <dywi@mailerd.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
