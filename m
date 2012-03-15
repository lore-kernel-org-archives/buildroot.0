From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 Mar 2012 21:48:50 +0100
Subject: [Buildroot] [PATCH] squashfs3: fix build with uClibc
In-Reply-To: <1331828147-23010-1-git-send-email-markos.chandras@imgtec.com>
 (Markos Chandras's message of "Thu, 15 Mar 2012 16:15:47 +0000")
References: <1331828147-23010-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <87aa3hsi8d.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@imgtec.com> writes:

 Markos> The squashfs3 package uses the old get_nprocs() GNU extension
 Markos> which does not exist in uClibc. This has already been fixed in
 Markos> newer squashfs releases (>=4.0).  The patch is similar to the
 Markos> one committed in dfa2a513e1aa7f6ec47f630c5d31d98cd098f408

Committed, thanks.

 Markos> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
 Markos> ---
 Markos>  package/squashfs3/squashfs3-3.4-get_nprocs.patch |   26 ++++++++++++++++++++++
 Markos>  1 files changed, 26 insertions(+), 0 deletions(-)
 Markos>  create mode 100644 package/squashfs3/squashfs3-3.4-get_nprocs.patch

 Markos> diff --git a/package/squashfs3/squashfs3-3.4-get_nprocs.patch b/package/squashfs3/squashfs3-3.4-get_nprocs.patch
 Markos> new file mode 100644
 Markos> index 0000000..e6901de

For the future, don't forget to add a git-style description of the patch
with your signed-off-by. This time I copied (most of) you commit message
over.

 Markos> --- /dev/null
 Markos> +++ b/package/squashfs3/squashfs3-3.4-get_nprocs.patch
 Markos> @@ -0,0 +1,26 @@
 Markos> +Index: squashfs3-3.4/squashfs-tools/mksquashfs.c
 Markos> +===================================================================
 Markos> +--- squashfs3-3.4.orig/squashfs-tools/mksquashfs.c
 Markos> ++++ squashfs3-3.4/squashfs-tools/mksquashfs.c
 Markos> +@@ -3178,7 +3178,7 @@ void initialise_threads()
 Markos> + 			processors = 1;
 Markos> + 		}
 Markos> + #else
 Markos> +-		processors = get_nprocs();
 Markos> ++		processors = sysconf(_SC_NPROCESSORS_CONF);
 Markos> + #endif
 Markos> + 	}
 Markos> + 

-- 
Bye, Peter Korsgaard
