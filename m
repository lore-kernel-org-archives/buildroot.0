Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964CFC433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 19:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C93A41722;
	Mon, 30 May 2022 19:02:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rPqo9udw0HFu; Mon, 30 May 2022 19:02:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5D59416D5;
	Mon, 30 May 2022 19:02:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 070FA1BF38A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 19:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7A24607C7
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 19:02:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SfZMcNkvRa1I for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 19:02:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 774DB60760
 for <buildroot@buildroot.org>; Mon, 30 May 2022 19:02:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f587:e70b:15ff:66a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 45C9C5FF9A;
 Mon, 30 May 2022 21:02:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653937340;
 bh=fxJxXOl/LhUT0wsSBPlJOpK+z+lB1dcW0Vj0FczlBU0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C23swziK9Gjv1gT+xWOXfjkQ/sEfE1qoOKbkMLoy4w0agqyejh065IFhPc0ZLs6lW
 45RFVb42Ny4Xa9FVOepgBYyfgTZWaIvZ3bJB8FKxUQtPHACTLualIOE/tfMetJoM2b
 qYXXNAWdDaatQpaPSE54nNa848jNIEIZCUi7Tb+eWm6vieChMeTQQK6zz1HaXCBcWr
 7iLVtVvPfEPG7d1xA7oZSieYSEaAD0YNRo0RzveMoGXMQdwbYpoExdfs2Grm7KQCPl
 D8oGVEWLgTsxuFgnPgsDa4Qmc0oaK2ZeDoe3Id3a5nAM6HJl8IIJAm3mCtpFHeQL5e
 APhlvDsza91AA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 30 May 2022 21:02:16 +0200
Date: Mon, 30 May 2022 21:02:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220530190216.GN993669@scaer>
References: <20220530183516.829602-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220530183516.829602-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/python-crossbar: use escape from
 markupsafe
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2022-05-30 20:35 +0200, Romain Naour spake thusly:
> The last version bump of python-werkzeug v2.1.2 introduced a runtime
> issue in python-crossbar since escape from werkzeug has been removed
> since werkzeug 2.1.0 [1].
> 
> This has been fixed in python-crossbar v24.4.1 but we do not want
> to bump this package for the Buildroot release 2022.05. Instead
> apply the same change as the upstream commit [2] using escape from
> python-markupsafe package.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2520606768
> 
> [1] https://github.com/pallets/werkzeug/commit/22d1e9ac13829b83347107a9b4d77072a8e1af6a
> [2] https://github.com/crossbario/crossbar/commit/ca8d383f01231e2b3f986e791f215f12f2deee5d
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ice-wap-use-markupsafe-instead-of-we.patch | 40 +++++++++++++++++++
>  package/python-crossbar/Config.in             |  1 +
>  2 files changed, 41 insertions(+)
>  create mode 100644 package/python-crossbar/0003-crossbar-webservice-wap-use-markupsafe-instead-of-we.patch
> 
> diff --git a/package/python-crossbar/0003-crossbar-webservice-wap-use-markupsafe-instead-of-we.patch b/package/python-crossbar/0003-crossbar-webservice-wap-use-markupsafe-instead-of-we.patch
> new file mode 100644
> index 0000000000..65ffc508ab
> --- /dev/null
> +++ b/package/python-crossbar/0003-crossbar-webservice-wap-use-markupsafe-instead-of-we.patch
> @@ -0,0 +1,40 @@
> +From ac5fc826e33492bb0c4283a954389d7fd355fa61 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@gmail.com>
> +Date: Mon, 30 May 2022 19:38:11 +0200
> +Subject: [PATCH] crossbar/webservice/wap: use markupsafe instead of werkzeug
> +
> +wap.py use escape from werkzeug but it has been removed since
> +the version 2.1.0 [1].
> +
> +Replace with escape from markupsafe like upstream commit [2]
> +(wihout other changes).
> +
> +[1] https://github.com/pallets/werkzeug/commit/22d1e9ac13829b83347107a9b4d77072a8e1af6a
> +[2] https://github.com/crossbario/crossbar/commit/ca8d383f01231e2b3f986e791f215f12f2deee5d
> +
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + crossbar/webservice/wap.py | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/crossbar/webservice/wap.py b/crossbar/webservice/wap.py
> +index 825558b1..6daa9b21 100644
> +--- a/crossbar/webservice/wap.py
> ++++ b/crossbar/webservice/wap.py
> +@@ -36,7 +36,12 @@ from collections.abc import Mapping, Sequence
> + 
> + from werkzeug.routing import Map, Rule
> + from werkzeug.exceptions import NotFound, MethodNotAllowed
> +-from werkzeug.utils import escape
> ++
> ++try:
> ++    # removed in werkzeug 2.1.0
> ++    from werkzeug.utils import escape
> ++except ImportError:
> ++    from markupsafe import escape
> + 
> + from jinja2 import Environment, FileSystemLoader
> + from jinja2.sandbox import SandboxedEnvironment
> +-- 
> +2.35.3
> +
> diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
> index 9625d9ce8e..60b60b1740 100644
> --- a/package/python-crossbar/Config.in
> +++ b/package/python-crossbar/Config.in
> @@ -15,6 +15,7 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
>  	select BR2_PACKAGE_PYTHON_INCREMENTAL
>  	select BR2_PACKAGE_PYTHON_JINJA2
>  	select BR2_PACKAGE_PYTHON_LMDB
> +	select BR2_PACKAGE_PYTHON_MARKUPSAFE
>  	select BR2_PACKAGE_PYTHON_MISTUNE
>  	select BR2_PACKAGE_PYTHON_NETADDR
>  	select BR2_PACKAGE_PYTHON_PASSLIB
> -- 
> 2.35.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
