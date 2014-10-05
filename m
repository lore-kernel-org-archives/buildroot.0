From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 23:46:37 +0200
Subject: [Buildroot] [PATCH] vsftpd: Add build option to disable utmpx
 update code
In-Reply-To: <1410873450-19158-1-git-send-email-maarten@treewalker.org>
References: <1410873450-19158-1-git-send-email-maarten@treewalker.org>
Message-ID: <20141005234637.715fa4fb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maarten ter Huurne,

On Tue, 16 Sep 2014 15:17:30 +0200, Maarten ter Huurne wrote:
> This was modeled after a similar option for Dropbear.
> 
> The utmpx code is automatically disabled when compiling with musl,
> to avoid a build error due to WTMPX_FILE being undefined.

I find this explanation unclear: when you say "is", I assume it's
*before* this patch is applied, but my understanding is that you mean
*once* the patch is applied, correct?

> Note that
> musl has an empty utmpx implementation, so no functionality is lost
> by not calling it.
> 
> Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
> ---
> Note that previously the utmpx code was being built, so this patch
> changes the default behavior. I think this is not a problem because
> most systems would not have a valid utmpx file, but it might be worth
> mentioning in the release notes.

Then instead of adding yet another new option, what about simply
disabling the utmpx support in vsftpd.mk when the C library is musl,
and keep it enabled otherwise?

> 
>  package/vsftpd/Config.in                        | 12 ++++++
>  package/vsftpd/vsftpd-0001-utmpx-builddef.patch | 49 +++++++++++++++++++++++++
>  package/vsftpd/vsftpd.mk                        |  8 ++++
>  3 files changed, 69 insertions(+)
>  create mode 100644 package/vsftpd/vsftpd-0001-utmpx-builddef.patch

Have you submitted vsftpd-0001-utmpx-builddef.patch upstream? It's kind
of a feature patch, so something we _generally_ don't like to take in
Buildroot.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
