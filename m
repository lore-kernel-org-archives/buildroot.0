From: Michael Fischer <mf@go-sys.de>
Date: Tue, 8 Sep 2020 07:39:33 +0000
Subject: [Buildroot] [PATCH 1/1] package/gnuplot: Add patch to fix
 'undefined reference to gp_read_history'
In-Reply-To: <20200905075158.GU14354@scaer>
References: <20200903133014.19824-1-mf@go-sys.de>,
 <20200905075158.GU14354@scaer>
Message-ID: <0b4c6e5541dd4629b212eb90c10de744@go-sys.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I'm on vacation this week.
So it takes a while.

Regards
Michael.


-------- Urspr?ngliche Nachricht --------
Von: "Yann E. MORIN" <yann.morin.1998@free.fr>
Datum: 05.09.20 09:52 (GMT+01:00)
An: Michael Fischer <mf@go-sys.de>
Cc: buildroot at busybox.net
Betreff: Re: [Buildroot] [PATCH 1/1] package/gnuplot: Add patch to fix 'undefined reference to gp_read_history'

Micheal, All,

On 2020-09-03 15:30 +0200, Michael Fischer spake thusly:
> Signed-off-by: Michael Fischer <mf@go-sys.de>

Thanks for this patch.

This is fixing autobuilder failures, so a reference to at least one
would have been good:

    Fixes:
        http://autobuild.buildroot.org/results/095/0956bc50b9823374254a2032d7897d48aff2d1fa/

> ---
>  package/gnuplot/0002-without-history.patch | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 package/gnuplot/0002-without-history.patch
>
> diff --git a/package/gnuplot/0002-without-history.patch b/package/gnuplot/0002-without-history.patch
> new file mode 100644
> index 0000000000..2ce144eabd
> --- /dev/null
> +++ b/package/gnuplot/0002-without-history.patch
> @@ -0,0 +1,18 @@
> +Patch to solve the 'undefined reference to gp_read_history'
> +
> +Signed-off-by: Michael Fischer <mf@go-sys.de>

Since gnuplot uses git, we need that patch to be git-formatted:

    https://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches

(Yes I know the existing patch does not conform to that requirement, but
that is a old patch, from before we started enforcing any coding style.)

Also, did you send that patch upstream? If so, it would be super nice
that you include the URL to the bug-report, or mailing post, so that we
eventually bump gnuplot, we can get rid of that patch.

Care to rework and respin, please?

Regards,
Yann E. MORIN.

> +diff -Naur a/src/history.c b/src/history.c
> +--- a/src/history.c  2020-09-03 14:48:47.875493026 +0200
> ++++ b/src/history.c  2020-09-03 14:50:39.493972218 +0200
> +@@ -91,7 +91,9 @@
> + void
> + read_history(char *filename)
> + {
> ++#ifdef GNUPLOT_HISTORY
> +     gp_read_history(filename);
> ++#endif
> + }
> +
> +
> --
> 2.28.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

--
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200908/21c704d9/attachment.html>
