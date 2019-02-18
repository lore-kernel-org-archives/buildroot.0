From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 18 Feb 2019 20:44:17 +0100
Subject: [Buildroot] minicom aborts
In-Reply-To: <trinity-76e60e04-b256-49e6-9a96-952ff2003124-1550502581474@3c-app-mailcom-bs08>
References: <trinity-76e60e04-b256-49e6-9a96-952ff2003124-1550502581474@3c-app-mailcom-bs08>
Message-ID: <20190218204417.5c943e3c@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello David,

On Mon, 18 Feb 2019 16:09:41 +0100, "David PICARD" <dplamp@gmx.com> wrote:

> Hello,
> ?
> When I try to start minicom, some test fails, and minicom quits straight away :
> 
> # minicom
> minicom: minicom.c: 1041: test_mbswidth: Assertion `mbswidth(e[i].s) == e[i]._mbswidth || mbswidth(e[i].s) == e[i]._mbswidth_kaputt' failed.
> Aborted
> ?
> The minicom.c file can be found here :
> https://salsa.debian.org/minicom-team/minicom/blob/master/src/minicom.c
> ?
> My only locale is "C".
> ?
> I'm not sure if it's a bug in minicom or if something is missing on my system.

Try to run with enabled printf debug output:

1038      if (0)
1039         printf("%d: mbswidth=%zd\n", i, mbswidth(e[i].s));
1040       assert(mbswidth(e[i].s) == e[i]._mbswidth
1041 	     || mbswidth(e[i].s) == e[i]._mbswidth_kaputt);

And take a look which test fails with which value...

And share your .config/defconfig file...

Regards,
Peter
 
> ?
> - David
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
