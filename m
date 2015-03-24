From: ir. Tjeerd Pinkert <t.j.pinkert@vu.nl>
Date: Tue, 24 Mar 2015 14:54:46 +0100
Subject: [Buildroot] ipython segfaults on history when no SQLite
	available
In-Reply-To: <5509AA8E.6000409@vu.nl>
References: <1426695479-12524-1-git-send-email-gwenj@trabucayre.com>
 <5509AA8E.6000409@vu.nl>
Message-ID: <55116CA6.5050806@vu.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This appears to be a bug in readline, see:
https://github.com/ipython/ipython/issues/8087#issuecomment-83660592

On 18-03-15 17:40, ir. Tjeerd Pinkert wrote:
> I notice that ipython segfaults on the following conditions:
> - no SQLite
> - a command is not found in the history list when arrow-up is pressed.
>
> The following snapshots apply:
> ------------------------------
> # ipython
> WARNING: IPython History requires SQLite, your history will not be saved
> Python 2.7.9 (default, Mar 17 2015, 11:45:11)
>
>
>
> It crashes in this case nothing with "rela" is found in the history:
> --------------------------------------------------------------------
> In [17]: relapython[1380]: unhandled signal 11 at 00000000 nip b6b10940
> lr b6b10934 code 30001
> Segmentation fault
> #
>
>
> System is MPC8313E, powerpc
> This might be an upstream issue.
>
> Best regards,
>
>
> Tjeerd
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
