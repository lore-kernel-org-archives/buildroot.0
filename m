From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 May 2020 22:52:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/audit: fix -fno-common build
 failure
In-Reply-To: <20200518054331.5106-1-heiko.thiery@gmail.com>
References: <20200518054331.5106-1-heiko.thiery@gmail.com>
Message-ID: <20200526205207.GG8737@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2020-05-18 07:43 +0200, Heiko Thiery spake thusly:
> Added upstream patch for fixing build failure when using GCC10 as a host
> compiler (-fno-common is now default).
> 
> Fixes:
> http://autobuild.buildroot.net/results/c4b/c4bba80e9fc476247c7ba28850831c6a8edd559f/build-end.log
> 
> Cc: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ns-need-to-be-external-when-building.patch | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/audit/0003-Header-definitions-need-to-be-external-when-building.patch
> 
> diff --git a/package/audit/0003-Header-definitions-need-to-be-external-when-building.patch b/package/audit/0003-Header-definitions-need-to-be-external-when-building.patch
> new file mode 100644
> index 0000000000..9a546261df
> --- /dev/null
> +++ b/package/audit/0003-Header-definitions-need-to-be-external-when-building.patch
> @@ -0,0 +1,28 @@
> +From 017e6c6ab95df55f34e339d2139def83e5dada1f Mon Sep 17 00:00:00 2001
> +From: Steve Grubb <sgrubb@redhat.com>
> +Date: Fri, 10 Jan 2020 21:13:50 -0500
> +Subject: [PATCH] Header definitions need to be external when building with
> + -fno-common (which is default in GCC 10) - Tony Jones
> +
> +Patch taken from upstream: https://github.com/linux-audit/audit-userspace/commit/017e6c6ab95df55f34e339d2139def83e5dada1f
> +Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> +---
> + src/ausearch-common.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/ausearch-common.h b/src/ausearch-common.h
> +index 6669203..3040547 100644
> +--- a/src/ausearch-common.h
> ++++ b/src/ausearch-common.h
> +@@ -50,7 +50,7 @@ extern pid_t event_pid;
> + extern int event_exact_match;
> + extern uid_t event_uid, event_euid, event_loginuid;
> + extern const char *event_tuid, *event_teuid, *event_tauid;
> +-slist *event_node_list;
> ++extern slist *event_node_list;
> + extern const char *event_comm;
> + extern const char *event_filename;
> + extern const char *event_hostname;
> +-- 
> +2.20.1
> +
> -- 
> 2.20.1
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
