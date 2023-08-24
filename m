Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60318C27C40
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 19:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D101040908;
	Thu, 24 Aug 2023 19:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D101040908
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PfSdQEyXrQjN; Thu, 24 Aug 2023 19:20:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B0A540538;
	Thu, 24 Aug 2023 19:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B0A540538
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0AA8F1BF852
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 19:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D872140538
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 19:20:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D872140538
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cctUiXWTKQ8l for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 19:20:24 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52FB34159D
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 19:20:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52FB34159D
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ced9:48d:9640:c8a7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id D8AE819F5A6;
 Thu, 24 Aug 2023 21:20:16 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 24 Aug 2023 21:20:16 +0200
Date: Thu, 24 Aug 2023 21:20:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230824192016.GA3722679@scaer>
References: <20230814215233.745573-1-gregorhaas1997@gmail.com>
 <20230822214755.1af65bb4@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230822214755.1af65bb4@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692904821;
 bh=YdYCNJhuFIjS1wQ8SaEMPYO7Z8RXhaySHnjaOgBapGs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ALKHz/elLVnQ075XIP/pnulcBJ18ZlE/37pT8BwTH8ZD4or4cKHi2RsCkX8kcOfLQ
 clSONTW8XhydhdeTdvIg02VV4NlKTvJeC36epuqrVGmCtsc6KKld/Rb90ttB6xROk1
 o9FWdl2NLTOL3mCMhE5q+LRWLZvHLq/rTbALk0wR+O7JwnDQOshLkcsOeP09ZVtCVF
 f7Ef3BRDXS1oibh6VQFFcvEwf6On39pG/Fmb9OHawyiYk2eR2+Y+Lc0qTcgTZ4IEis
 4XRhQbIDE3x7Vbg6cbYlDRvAvkBlfHRnZY10IHDiSS+rbtmvJ5M/n/uW3IwdgVf1YY
 3++pEQuq4uxwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ALKHz/el
Subject: Re: [Buildroot] [PATCH 1/1] package/bmap-tools: add dependency on
 python-six
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
Cc: Gregor Haas <gregorhaas1997@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-08-22 21:47 +0200, Thomas Petazzoni spake thusly:
> On Mon, 14 Aug 2023 14:52:33 -0700
> Gregor Haas <gregorhaas1997@gmail.com> wrote:
> For the host package, I can indeed reproduce the problem. But I think
> the issue really is that in the final $(HOST_DIR), we keep the shebang
> of the Python interpreter pointing to the per-package directory.
> Indeed, my reasoning is that otherwise we will have many similar
> problems with other packages, as this is breaking a fundamental
> assumption in Buildroot.
> 
> I'm thinking about something like this:
> 
> diff --git a/Makefile b/Makefile
> index f0ff9a1480..00ce64ab15 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -713,6 +713,15 @@ STAGING_DIR_FILES_LISTS = $(sort $(wildcard $(BUILD_DIR)/*/.files-list-staging.t
>  host-finalize: $(PACKAGES) $(HOST_DIR) $(HOST_DIR_SYMLINK)
>         @$(call MESSAGE,"Finalizing host directory")
>         $(call per-package-rsync,$(sort $(PACKAGES)),host,$(HOST_DIR))
> +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> +       $(Q)grep --binary-files=without-match -lrZ '$(PER_PACKAGE_DIR)/[^/]\+/host' $(HOST_DIR) \
> +       |while read -d '' f; do \
> +               file -b --mime-type "$${f}" | grep -q '^text/' || continue; \
> +               printf '%s\0' "$${f}"; \
> +       done \
> +       |xargs -0 --no-run-if-empty \
> +               $(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/host:$(HOST_DIR):g'
> +endif
>  
>  .PHONY: staging-finalize
>  staging-finalize: $(STAGING_DIR_SYMLINK)
> 
> Yann, what do you think? (Logic is taken from package/pkg-generic.mk,
> which does the conversion from per-package directories of dependencies
> to the per-package directory of the package being built, the logic here
> is similar, but we switch from the per-package directories to the
> global host directory)

Then we want to avoid code duplication, why can't we re-use the existing
PPD_FIXUP_PATHS macro?

It might need a bit of tweaking, though:

  - first, we only need to fixup paths in $(HOST_DIR), and this is
    already what we are doing.

  - second, we only need to fix path for host tools, libs et al., so
    that they can still run, and paths for staging/ libs et al., so that
    we can link against.

However, that second point is not what we are doing, as we are tweaking
everything at the root of the PPD:

    $(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g'

Furthermore, staging/ is a sub-directory of host/ and we already account
for that as we are only grepping in $(HOST_DIR). But with the sed, we
replace a shaloower path than HOST_DIR.

So I think we can change the existing PPD_FIXUP_PATHS to:

     define PPD_FIXUP_PATHS
            $(Q)grep --binary-files=without-match -lrZ '$(PER_PACKAGE_DIR)/[^/]\+/' $(HOST_DIR) \
            |while read -d '' f; do \
                    file -b --mime-type "$${f}" | grep -q '^text/' || continue; \
                    printf '%s\0' "$${f}"; \
            done \
            |xargs -0 --no-run-if-empty \
    -               $(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g'
    +               $(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/host/:$(HOST_DIR)/:g'
     endef

And then, we can expand that macro in both contexts: PPD_rsync and
target-finalize.

Thoughts?

Regards,
Yann E. MORIN.

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
