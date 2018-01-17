From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 13:55:23 +0100
Subject: [Buildroot] [PATCH] selinux-python: add patch to make the build
 process more standard
In-Reply-To: <20180117093134.18230-1-marcus.folkesson@gmail.com>
References: <20180117093134.18230-1-marcus.folkesson@gmail.com>
Message-ID: <20180117135523.4728bcad@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Jan 2018 10:31:34 +0100, Marcus Folkesson wrote:
> Patch the Makefiles to make PREFIX and DESTDIR follow standard
> semantics to get rid of DESTDIR during compile time in
> selinux-python.mk.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Thanks for this patch. However...

> ---
>  ...build-follow-standard-semantics-for-DESTD.patch | 113 +++++++++++++++++++++
>  package/selinux-python/selinux-python.mk           |   2 +-
>  2 files changed, 114 insertions(+), 1 deletion(-)
>  create mode 100644 package/selinux-python/0001-python-build-follow-standard-semantics-for-DESTD.patch
> 
> diff --git a/package/selinux-python/0001-python-build-follow-standard-semantics-for-DESTD.patch b/package/selinux-python/0001-python-build-follow-standard-semantics-for-DESTD.patch
> new file mode 100644
> index 0000000000..82c3b06086
> --- /dev/null
> +++ b/package/selinux-python/0001-python-build-follow-standard-semantics-for-DESTD.patch
> @@ -0,0 +1,113 @@
> +diff -durN python.orig/audit2allow/Makefile python/audit2allow/Makefile
> +--- python.orig/audit2allow/Makefile	2017-08-04 15:31:00.000000000 +0200
> ++++ python/audit2allow/Makefile	2018-01-17 09:44:35.659573123 +0100

.. this patch lacks a description and Signed-off-by, and should be
Git-formatted.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
