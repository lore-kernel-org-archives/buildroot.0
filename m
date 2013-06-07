From: Spenser Gilliland <spenser@gillilanding.com>
Date: Fri, 7 Jun 2013 10:08:00 -0500
Subject: [Buildroot] [PATCH v9 03/14] libgtk2: bump to version 2.24.18
In-Reply-To: <87fvwuclnf.fsf@dell.be.48ers.dk>
References: <1369931437-12445-1-git-send-email-spenser@gillilanding.com>
 <1369931437-12445-4-git-send-email-spenser@gillilanding.com>
 <87fvwuclnf.fsf@dell.be.48ers.dk>
Message-ID: <CAEBucnDc7Yv3W4giYsbrjTdTsCwkViA4C9WEddE0+EOpaTKF7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 7, 2013 at 4:31 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Spenser" == Spenser Gilliland <spenser@gillilanding.com> writes:
>
>  Spenser> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
>  Spenser> ---
>  Spenser>  package/libgtk2/Config.in                         |   13 ++----
>  Spenser>  package/libgtk2/libgtk2-reduce-dependencies.patch |   51 +++++++++++----------
>  Spenser>  package/libgtk2/libgtk2.mk                        |    2 +-
>  Spenser>  3 files changed, 32 insertions(+), 34 deletions(-)
>
>  Spenser> +++ b/package/libgtk2/libgtk2-reduce-dependencies.patch
>  Spenser> @@ -3,21 +3,23 @@ dependencies on graphic backends such as X.org or DirectFB. Gtk does
>  Spenser>  not fully build in this mode, but it builds sufficiently to build the
>  Spenser>  host tools that are needed to build the target Gtk.
>
>  Spenser> +Changes:
>  Spenser> +     Ported to 2.24.18
>  Spenser> +
>  Spenser>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Spenser> +Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
>  Spenser>  ---
>  Spenser> - configure.in |   34 +++++++++++++++++++++++++++-------
>  Spenser> - 1 file changed, 27 insertions(+), 7 deletions(-)
>  Spenser> -
>  Spenser> -Index: b/configure.in
>  Spenser> +Index: libgtk2-2.24.18/configure.ac
>  Spenser>  ===================================================================
>  Spenser> ---- a/configure.in
>  Spenser> -+++ b/configure.in
>  Spenser> -@@ -259,12 +259,12 @@
>  Spenser> +--- libgtk2-2.24.18.orig/configure.ac        2013-05-13 07:02:44.000000000 -0500
>  Spenser> ++++ libgtk2-2.24.18/configure.ac     2013-05-27 02:12:09.947030335 -0500
>  Spenser> +@@ -258,12 +258,13 @@
>  Spenser>     gdktarget=x11
>  Spenser>   fi
>
>  Spenser>  -AC_ARG_WITH(gdktarget, [  --with-gdktarget=[[x11/win32/quartz/directfb]] select non-default GDK target],
>  Spenser> -+AC_ARG_WITH(gdktarget, [  --with-gdktarget=[[x11/win32/quartz/directfb/none]] select non-default GDK target],
>  Spenser> ++AC_ARG_WITH(gdktarget,
>  Spenser> ++                            [  --with-gdktarget=[[x11/win32/quartz/directfb/none]] select non-default GDK target],
>
> I see number of white space changes in this patch. Why is that? Could
> you fix and send a v10 including your directfb changed.

As the patch did not apply to the new code. I had to rewrite. It.  I
tried to follow the coding style of the source.

> Thanks!
>
> --
> Bye, Peter Korsgaard

Spenser


--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
