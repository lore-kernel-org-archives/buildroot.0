Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22277C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB0B740A10;
	Wed, 16 Feb 2022 21:07:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C2mkManZfvZ2; Wed, 16 Feb 2022 21:07:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F00A409F6;
	Wed, 16 Feb 2022 21:07:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 95A471BF425
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 817A34013D
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mj0AiixN2oED for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:02:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7736F40108
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:02:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9933:bb4:98b5:c594])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C7C46B0051B;
 Wed, 16 Feb 2022 22:02:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645045376;
 bh=DIxqsuXruKN8zSGf9vyt76WMUxTS+QcbrDsNY7sifnY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=krnIjVrxHu7Q3BqRWuvA8hqvTaDnoc1+gpwbltL1LLFyE16uU34wFZLcDv9FWUrYP
 Pm267M0H9L+Gi+8wzTmtBtecjxfv93w6q2GeBDAC5qg+qt/IGFtFymZ2VfVF1FZQAG
 mNrHZTU4d5J2a1gAxko9oZIqfzR0bd4vzQxaQaLdj9zZMCpG9nqcQQ+MtRW49wpQoR
 C0dMm7j3JxuvfKVGfGGhWRUzolUznoxDyCkjetde9HUhniQMQpG06V77FLlib6LfQe
 XjPKTJD0EgIRkwg9EgQpeMZXOTP42XSXBzKUIo3C7dF1nqxsS21jG19LPRbumyV8Wg
 PDo18zgOejaAg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 16 Feb 2022 22:02:51 +0100
Date: Wed, 16 Feb 2022 22:02:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220216210251.GB522310@scaer>
References: <20220215132909.2360674-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220215132909.2360674-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/python-pycli: fix build with python >= 3.10
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-02-15 14:29 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump of python3 to version
> 3.10.1 in commit 25b1fc2898d68ddf2674b14c738045875fc5a2dc due to the new
> "Multiple Exception types without parentheses" exception
> (https://docs.python.org/3/whatsnew/3.10.html)
> 
> error:   File "/usr/lib/python3.10/site-packages/cli/app.py", line 242
>     except Exception, e:
>            ^^^^^^^^^^^^
> SyntaxError: multiple exception types must be parenthesized
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8d7b0c23472abffc9447e4a6de273bdd04486d39
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>  - Add upstream commits instead of dropping package (even if repository
>    has been archived)
> 
>  ...aise-exceptions-in-wrapped-functions.patch | 26 ++++++++++++
>  ...pt-statement-changed-slightly-in-2-6.patch | 41 +++++++++++++++++++
>  2 files changed, 67 insertions(+)
>  create mode 100644 package/python-pycli/0001-Fix-problem-with-re-raise-exceptions-in-wrapped-functions.patch
>  create mode 100644 package/python-pycli/0002-except-statement-changed-slightly-in-2-6.patch
> 
> diff --git a/package/python-pycli/0001-Fix-problem-with-re-raise-exceptions-in-wrapped-functions.patch b/package/python-pycli/0001-Fix-problem-with-re-raise-exceptions-in-wrapped-functions.patch
> new file mode 100644
> index 0000000000..7ac9d7af9f
> --- /dev/null
> +++ b/package/python-pycli/0001-Fix-problem-with-re-raise-exceptions-in-wrapped-functions.patch
> @@ -0,0 +1,26 @@
> +From 57c563f8b47a56feefc0a8bcbef05f4b54280549 Mon Sep 17 00:00:00 2001
> +From: mmbutter <mario.butter@gmail.com>
> +Date: Tue, 9 Jun 2020 11:50:41 -0500
> +Subject: [PATCH] Fix problem with re-raise exceptions in wrapped functions.
> +
> +[Retrieved from:
> +https://github.com/whilp/cli/commit/57c563f8b47a56feefc0a8bcbef05f4b54280549]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + lib/cli/app.py | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/lib/cli/app.py b/lib/cli/app.py
> +index 7b6db52..f487ab4 100644
> +--- a/lib/cli/app.py
> ++++ b/lib/cli/app.py
> +@@ -240,6 +240,9 @@ def run(self):
> +         try:
> +             returned = self.main(*args)
> +         except Exception, e:
> ++        	elif isinstance(e, self.reraise):
> ++        	    # raising the last exception preserves traceback
> ++        	    raise
> +             returned = e
> + 
> +         return self.post_run(returned)
> diff --git a/package/python-pycli/0002-except-statement-changed-slightly-in-2-6.patch b/package/python-pycli/0002-except-statement-changed-slightly-in-2-6.patch
> new file mode 100644
> index 0000000000..75869d6d23
> --- /dev/null
> +++ b/package/python-pycli/0002-except-statement-changed-slightly-in-2-6.patch
> @@ -0,0 +1,41 @@
> +From 2af95cff5609142ec14efdf13b394f9b0121ab2e Mon Sep 17 00:00:00 2001
> +From: mmbutter <mario.butter@gmail.com>
> +Date: Thu, 11 Jun 2020 15:50:03 -0500
> +Subject: [PATCH] except statement changed slightly in 2.6. This could cause
> + problems in newer versions. Updated to the new format.
> +
> +[Retrieved from:
> +https://github.com/whilp/cli/commit/2af95cff5609142ec14efdf13b394f9b0121ab2e]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + lib/cli/app.py | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/lib/cli/app.py b/lib/cli/app.py
> +index f487ab4..45256b8 100644
> +--- a/lib/cli/app.py
> ++++ b/lib/cli/app.py
> +@@ -239,10 +239,10 @@ def run(self):
> +             args = ()
> +         try:
> +             returned = self.main(*args)
> +-        except Exception, e:
> +-        	elif isinstance(e, self.reraise):
> +-        	    # raising the last exception preserves traceback
> +-        	    raise
> ++        except self.reraise:
> ++            # raising the last exception preserves traceback
> ++            raise
> ++        except Exception as e:
> +             returned = e
> + 
> +         return self.post_run(returned)
> +@@ -420,7 +420,7 @@ def pre_run(self):
> +         """
> +         try:
> +             ns = self.argparser.parse_args()
> +-        except SystemExit, e:
> ++        except SystemExit as e:
> +             if self.exit_after_main:
> +                 raise
> +             else:
> -- 
> 2.34.1
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
