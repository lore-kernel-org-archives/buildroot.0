From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Tue, 13 Mar 2012 01:12:41 +0200
Subject: [Buildroot] Busybox df, ls and ash applet small improvements
Message-ID: <4F5E82E9.1020605@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.


It seems that busybox df and ls applets don't respect BLOCK_SIZE=human
environment variable.
With that variable there is no need to always use df -h or ls -h (or
even any aliases for them).

Also the ash applet does not seem to respect the following
backslash-escaped special characters in PS1 environment variable:

\d: the date in "Weekday Month Date" format (e.g., "Tue May 26")
\t:  the current time in 24-hour HH:MM:SS format
\T: the current time in 12-hour HH:MM:SS format
\@: the current time in 12-hour am/pm format
\A: the current time in 24-hour HH:MM format


Best regards:
Stefan
