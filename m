From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 06 Apr 2015 22:14:39 +0200
Subject: [Buildroot] [PATCH 2/4] package/thrift: fix libtool warning
In-Reply-To: <1428339450-2158-2-git-send-email-romain.naour@openwide.fr>
References: <1428339450-2158-1-git-send-email-romain.naour@openwide.fr>
 <1428339450-2158-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <5522E92F.1070300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/04/15 18:57, Romain Naour wrote:
> Backport an upstream patch.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Minor comments below

> ---
>  ...-check-minimum-required-version-of-automa.patch | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/thrift/0004-THRIFT-3071-check-minimum-required-version-of-automa.patch
> 
> diff --git a/package/thrift/0004-THRIFT-3071-check-minimum-required-version-of-automa.patch b/package/thrift/0004-THRIFT-3071-check-minimum-required-version-of-automa.patch
> new file mode 100644
> index 0000000..2019706
> --- /dev/null
> +++ b/package/thrift/0004-THRIFT-3071-check-minimum-required-version-of-automa.patch
> @@ -0,0 +1,45 @@
> +From 9b03d2b02d32302008d2bd0218b31b9a0ca5a748 Mon Sep 17 00:00:00 2001
> +From: Jens Geyer <jensg@apache.org>
> +Date: Fri, 3 Apr 2015 12:37:03 +0200
> +Subject: [PATCH] THRIFT-3071 check minimum required version of automake in
> + bootstrap.sh Client: Build process Patch: James E. King, III
> + <jim.king@simplivity.com>

 Something went wrong with the subject line here. Upstream has the Client: and
Patch: lines below the subject.

> +
> +This closes #421
> +
> +- remove a warning when using libtool
> +
> +"libtoolize: Consider adding 'AC_CONFIG_MACRO_DIRS([./aclocal])' to configure.ac,"
> +
> +[Romain:
> +  - remove the part for bootstrap.sh which is not
> +    bundled in thrift archive.
> +  - fix the comment]

 Well, that fixing was no success :-) Anyway it should be

- fix the commit log accordingly


 Please also add a reference to the upstream commit, e.g.

4aa95df383bfa13c46a4dc0b41672ec29d476300 upstream

or

https://git-wip-us.apache.org/repos/asf?p=thrift.git;h=4aa95df383bfa13c46a4dc0b41672ec29d476300



 Regards,
 Arnout

> +Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> +---
> + configure.ac | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 5fa611e..8daeb03 100755
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -18,6 +18,7 @@
> + #
> + 
> + AC_PREREQ(2.65)
> ++AC_CONFIG_MACRO_DIR([./aclocal])
> + 
> + AC_INIT([thrift], [0.9.2])
> + 
> +@@ -540,6 +541,7 @@ AC_CHECK_FUNCS([memset])
> + AC_CHECK_FUNCS([mkdir])
> + AC_CHECK_FUNCS([realpath])
> + AC_CHECK_FUNCS([select])
> ++AC_CHECK_FUNCS([setlocale])
> + AC_CHECK_FUNCS([socket])
> + AC_CHECK_FUNCS([strchr])
> + AC_CHECK_FUNCS([strdup])
> +-- 
> +1.9.3
> +
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
