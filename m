From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Mar 2019 22:29:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/vsftpd: add patch to fix hang
In-Reply-To: <20190305195440.25074-1-abdelmalek.benelouezzane@savoirfairelinux.com>
References: <20190305195440.25074-1-abdelmalek.benelouezzane@savoirfairelinux.com>
Message-ID: <20190307222900.07e5c3be@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Mar 2019 14:54:40 -0500
Abdelmalek Benelouezzane <abdelmalek.benelouezzane@savoirfairelinux.com> wrote:

> This fixes a hang due to SIGCHLD not being handled correctly by
> vsftpd. The patch comes from fedora and didn't make its way to
> upstream yet.
> 
> More information about the bug can be found in:
>  - https://bugzilla.redhat.com/show_bug.cgi?id=1198259
> 
> Signed-off-by: Abdelmalek Benelouezzane <abdelmalek.benelouezzane@savoirfairelinux.com>

Thanks, I've applied, but had to reformat your patch a bit, see below.

> ---
>  ...0004-Prevent-hang-in-SIGCHLD-handler.patch | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 package/vsftpd/0004-Prevent-hang-in-SIGCHLD-handler.patch
> 
> diff --git a/package/vsftpd/0004-Prevent-hang-in-SIGCHLD-handler.patch b/package/vsftpd/0004-Prevent-hang-in-SIGCHLD-handler.patch
> new file mode 100644
> index 0000000000..221720b6e3
> --- /dev/null
> +++ b/package/vsftpd/0004-Prevent-hang-in-SIGCHLD-handler.patch
> @@ -0,0 +1,90 @@
> +Prevent hang in SIGCHLD handler
> +
> +Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1198259
> +
> +Fetch from:
> +https://src.fedoraproject.org/cgit/rpms/vsftpd.git/plain/0026-Prevent-hanging-in-SIGCHLD-handler.patch
> +
> +Signed-off-by: Abdelmalek Benelouezzane <abdelmalek.benelouezzane@savoirfairelinux.com>

Those details....

> +
> +From 1e65a0a15f819b8bf1b551bd84f71d0da1f5a00c Mon Sep 17 00:00:00 2001
> +From: Martin Sehnoutka <msehnout@redhat.com>
> +Date: Thu, 17 Nov 2016 13:02:27 +0100
> +Subject: [PATCH 26/59] Prevent hanging in SIGCHLD handler.
> +
> +vsftpd can now handle pam_exec.so in pam.d config without hanging
> +in SIGCHLD handler.

Should go here. Otherwise the patch is no longer properly formatted to
be applied with "git am".

I've fixed that and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
