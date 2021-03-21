From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 21 Mar 2021 16:19:52 +0100
Subject: [Buildroot] [PATCH v2] package/transmission: fix sysv init
 script (name vs. exec)
In-Reply-To: <87sg4qu7ef.fsf@dell.be.48ers.dk>
References: <20210310224155.8138-1-ps.report@gmx.net>
 <87sg4qu7ef.fsf@dell.be.48ers.dk>
Message-ID: <20210321161952.447ed460@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Fri, 19 Mar 2021 23:04:56 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:
>
>  > - fix sysv init script in case package start-stop-daemon is
>  >   enabled
>
>  > Fixes:
>
>  >   - https://bugs.busybox.net/show_bug.cgi?id=13576
>
>  >   $ /etc/init.d/S92transmission stop
>  >   Stopping bittorrent client transmission-daemon...
>  >   start-stop-daemon: warning: this system is not able to track process names
>  >   longer than 15 characters, please use --exec instead of --name.
>
>  > Reported-by: ingineru_de_sistem at yahoo.com
>  > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>  > ---
>  > Changes v1 -> v2:
>  >   - add reported-by and reference to bug entry
>
> Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.
>
> grepping the source tree, it looks like we have a similar issue in
> rng-tools:
>
> git grep 'start-stop-daemon.*-K.*-n'
> package/rng-tools/S21rngd:      if start-stop-daemon -K -q -s KILL -p "${PID_FILE}" -n "${NAME}"; then

Did not catch it because I grep'ed only for the long version...

>
> Care to send a fix for that as well?
>

Rngd is not affected as the NAME ('rngd') is below the 15 characters limit...,
should I change to exec anyway?

Regards,
Peter
