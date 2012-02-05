From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 05 Feb 2012 11:11:09 +0100
Subject: [Buildroot] [PATCH 2/7] lttng-tools: fix build on uClibc due to
	sync_file_range()
In-Reply-To: <cd91ba13b014d9e86a017ab35858badd0a4b69cb.1328366921.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 4 Feb 2012 15:48:43 +0100")
References: <cover.1328366921.git.thomas.petazzoni@free-electrons.com>
 <cover.1328366921.git.thomas.petazzoni@free-electrons.com>
 <cd91ba13b014d9e86a017ab35858badd0a4b69cb.1328366921.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87pqdtsi82.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Add a patch to use fdatasync() instead of sync_file_range() when the
 Thomas> latter is not available.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  ...ls-2.0-pre15-no-sync-file-range-in-uclibc.patch |   87 ++++++++++++++++++++
 Thomas>  package/lttng-tools/lttng-tools.mk                 |    2 +
 Thomas>  2 files changed, 89 insertions(+), 0 deletions(-)
 Thomas>  create mode 100644 package/lttng-tools/lttng-tools-2.0-pre15-no-sync-file-range-in-uclibc.patch

 Thomas> diff --git a/package/lttng-tools/lttng-tools-2.0-pre15-no-sync-file-range-in-uclibc.patch b/package/lttng-tools/lttng-tools-2.0-pre15-no-sync-file-range-in-uclibc.patch
 Thomas> new file mode 100644
 Thomas> index 0000000..861686b
 Thomas> --- /dev/null
 Thomas> +++ b/package/lttng-tools/lttng-tools-2.0-pre15-no-sync-file-range-in-uclibc.patch
 Thomas> @@ -0,0 +1,87 @@
 Thomas> +Make sync_file_range() usage optional
 Thomas> +
 Thomas> +Under uClibc, sync_file_range() is not available under all
 Thomas> +architectures, so we fall back to fdatasync() in this case.

And as far as I can see, it's also only available if LFS support is
present.

Committed, thanks. Don't forget to send patch upstream.

-- 
Bye, Peter Korsgaard
