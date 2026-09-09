Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A289C79FB6
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 19:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B368A80F17;
	Wed,  9 Sep 2026 19:43:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hsSnJpD9Yli2; Wed,  9 Sep 2026 19:43:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2217180F26
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788983034;
	b=S4GHHRSg92/EhxD1hm96JU6pkl8SUI5/KvpiX92KESUD8PJh+RzSw5Ex+Op9qEHY2XRk
	 mbp4JNj1UDegtlXZ9OijFaCbXtoWoE+E6mJ+cThKZlJSZxMbTErd/yr2Y1WWQkssd3rrK
	 gvYutmgwtBDJs8bZwSFtKbQ9AGOpblYkcUw+e7gvKWjdf1q8T7XqQ4+9uJmcXAOF4NB0A
	 U4dkznRhcfrotcsYKAPlTooq2XKezAtGJR+nsbnHZ38Srkf+pPRPSkyhYjNl5XJ6BdRXW
	 adQxdzEQVB/A1z333SCgYGoGfs/y95mI/rhw7x2zz+gVpIxbNE6N5n0Z3iWF8RlTNHQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788983034;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=7Hl+ucucSLY+vB7YgkGkPqe2e7AriRt+Z7OhwVX6JdE=;
	b=W752SxkJXZUutD9Nu8Omaf/hCx3uV3BWNBku5r4jsGTCe2Ef0DBQB8PC/y+heRou+Q6G
	 g6HRwp+V6eYoAdrqVIqHXv+BrJdqwzo3A6WEvTM9QoA+e2AMaz1fepAF8ZYj0HXCaWTN7
	 EalxX6sEl7Ca50w7OW5DqBPO2wMAPd32xpHzWUvxq0iFtjD+UDXIrHRZWBvVU+gZ/fHXw
	 ATByQ7I0f28HR2inE2njYO55K9p9s+2tBxvtBKoMeHJEaGe2wNO+WCiaMOKdhlyNmgCcG
	 AmQem2LUFoeQQ6n1m5XKqKTcF4W41esPmQCVppWdx4ZWNjKAk168DlcKPelik6CTHrQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788983034;
	bh=7Hl+ucucSLY+vB7YgkGkPqe2e7AriRt+Z7OhwVX6JdE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=coQ+7+L1pu4/nEF4yEKm3RLMX+ubbMVCLjnk1gXSll2cbgXavBnfcI7wo5J2s4jpg
	 IqGzqiHFLGczP0uhFuoHlluqgnvS58LWrkYfQ4ru1mJBb7rZ/O+iVZ/0WOPWsQPLYb
	 c//Jv87dJTOjjaFKlcqevnrKXCu6KXvZEJunKmy6eATe+mkot4shUIqxmnAHy95zt+
	 hC+T1EPFsL5xSENUJIQLzq53MzhboZ+6dHqLY2+XTnt/XJ126yh/N6+s13eNhGdAlA
	 nRmoi5d7hhX3gHc81wk/ON25O3WNndtu+CpoYJM0RiNwxoAE/I2vMherPB9Z1p7SLC
	 wZWCaKf2kmpeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2217180F26;
	Wed,  9 Sep 2026 19:43:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DD8B92D2
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 19:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAE8340411
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 19:43:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kIzCdHoPM6sn for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 19:43:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9A9924039C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788983030;
 b=lTTq6qNZAsvZjHqjEDw21dsjnX1+ByhmJsZmaBnWqbMIKRiSIGSyczwa+Z/SDoSabJRu
 /HZpYVKjo2JBqJyvxgW7gDHtTy44bUUI+B4BIp5odwzq6UcO6kkaDDnXCRDW7BFvfnLlH
 rvdErC6ys6wPhL85l31Jp9sMdtlx86jtoliy7GtHuTs8siUmYFqP5c302L3m9HChNGXBT
 XIPO/u9Fd/2VzL3C3f/tU8P7GG9frV9rtGy5ZQ5CNiFNWQxYaFABqIR1gzA1DuRRE8SIR
 WVMuc1ODYlQZff9B926zM6Kma37mn9UXf7Ynonjarcl0XwBDgyRABdqPnn/6pYeQ4Hg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788983030;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=LQgzTOpzgbPU+10MAje3LbRBzXN8WxpYwu9DfJIXNDs=;
 b=acbZXadDpVQ58vhNkQHnOVoqLsUtg/GpfpzitzPeTkOdWyRTNgDS/jELUQgzx4wsD/kf
 zNHS3uwsbaeE+vhxWqCseBahOjih3rjdtBWZDkWGAmyO7zyQMrF5iaIdUIShJEKZuK7E3
 uY4u9wbcERH828LtXNrmKfg60w6AdpZ58FD8hnpEgZsmxdLf8HwdSXKwZyRlNwmIu9KcB
 2pMyecS2ocuZ7ij2Mg9iN0DrOCgRGV8Bg5kCBcdgwveRV6IpH5Blg8zB6tbhKC1TMRGm9
 Qie9elbDSVV70nZCNZPPd9ZHRrC4YftcC7dKn9K1BBuZtyEvyhJbT5s3IjFkq06WRQg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="WGOcJC/4"; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A9924039C
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 19:43:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4474F13F879;
 Wed,  9 Sep 2026 21:43:44 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 09 Sep 2026 21:43:44 +0200
MIME-Version: 1.0
Date: Wed, 09 Sep 2026 21:43:44 +0200
To: Matthew Weber <matt@thewebers.ws>
Cc: buildroot@buildroot.org
In-Reply-To: <20260909124355.32121-1-matt@thewebers.ws>
References: <20260909124355.32121-1-matt@thewebers.ws>
User-Agent: Webmail Free/1.6.19
Message-ID: <46fc834d5fccbea10aa98d9d979016c8@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v2 1/1] docs: add agent guidance
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Matthew,

Thanks for this proposal. I have few comments and suggestions, see 
below.

On 09/09/2026 14:43, Matthew Weber wrote:
> Document Buildroot structure, documentation, build and validation
> workflows, mailing-list submission, Patchwork usage, and AI-assisted
> contribution requirements.
> 
> This specific file was added as most AI will look for it.
> 
> Assisted-by: GitHub Copilot
> Signed-off-by: Matthew Weber <matt@thewebers.ws>
> 
> ---
> 
> v1 -> v2 : I messed up the additional info section and patchwork didn't
>            pick the series up
> 
> This is modeled after similar work I did on another project. I
> tried to keep this simple to start and there are more refs in the
> pull request. 
> https://github.com/elisa-tech/wg-aerospace/pull/234/changes
> 
>  AGENTS.md | 257 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 257 insertions(+)
>  create mode 100644 AGENTS.md
> 
> diff --git a/AGENTS.md b/AGENTS.md
> new file mode 100644
> index 0000000000..e05c87f4fc
> --- /dev/null
> +++ b/AGENTS.md
> @@ -0,0 +1,257 @@
> +# AGENTS.md - Buildroot
> +
> +## Repository purpose
> +
> +Buildroot is a simple, efficient tool for generating embedded Linux 
> systems
> +through cross-compilation.
> +
> +The repository contains:
> +
> +- `package/`: target and host package definitions
> +- `board/`: board-specific support files
> +- `configs/`: predefined board configurations
> +- `boot/`: bootloader and firmware support
> +- `linux/`: Linux kernel integration
> +- `system/`: target system configuration
> +- `toolchain/`: toolchain support
> +- `fs/`: root filesystem image generation
> +- `support/`: infrastructure, scripts, tests, and tooling
> +- `docs/`: the Buildroot user manual and website
> +- `DEVELOPERS`: file ownership and maintainer notification rules
> +
> +Read the relevant package, board, or infrastructure documentation 
> before
> +changing its implementation.
> +
> +## Documentation
> +
> +The primary documentation is in `docs/manual/`.
> +
> +Useful entry points:
> +
> +- `docs/manual/manual.adoc`: manual index and build definition
> +- `docs/manual/quickstart.adoc`: first Buildroot build
> +- `docs/manual/common-usage.adoc`: common make targets and workflows
> +- `docs/manual/contribute.adoc`: contribution and patch-submission 
> process
> +- `docs/manual/adding-packages.adoc`: adding packages
> +- `docs/manual/adding-board-support.adoc`: adding board support
> +- `docs/manual/developers.adoc`: `DEVELOPERS` and `get-developers`
> +- `docs/manual/resources.adoc`: community resources and Patchwork
> +- `docs/manual/prerequisite.adoc`: host requirements
> +
> +Generate the text manual with:
> +
> +```sh
> +make manual-text
> +```
> +
> +The generated text manual is written to 
> `output/docs/manual/manual.text`.
> +Online documentation is available at 
> <https://buildroot.org/docs.html>.
> +
> +## Building Buildroot
> +
> +Build as a normal user. From the repository root:
> +
> +```sh
> +make menuconfig
> +make
> +```
> +
> +The resulting kernel, bootloader, and root filesystem images are 
> placed in
> +`output/images/`.
> +
> +Useful commands include:
> +
> +```sh
> +make list-defconfigs
> +make <boardname>_defconfig
> +make savedefconfig BR2_DEFCONFIG=<path>
> +make source
> +make legal-info
> +```
> +
> +Use `O=<output-directory>` for an out-of-tree output directory:
> +
> +```sh
> +make O=/path/to/output menuconfig
> +make O=/path/to/output
> +```
> +
> +Check `docs/manual/prerequisite.adoc` before diagnosing host 
> dependency
> +problems. Buildroot requires GNU make 3.81 or newer and a Linux host.

We could also mention that the docker-run script is here to provide a
reference build host environment. For ex:

Host dependency problems can be avoided by using the Buildroot
Docker reference image, by prefixing commands with:

```sh
utils/docker-run
```

> +
> +## Testing and validation
> +
> +Choose validation appropriate to the change:
> +
> +- Run `utils/check-package` on new or modified package files.
> +- Prefer the containerized check for patch preparation:
> +
> +  ```sh
> +  utils/docker-run make check-package
> +  ```
> +
> +- Validate `DEVELOPERS` changes with:
> +
> +  ```sh
> +  ./utils/get-developers -v
> +  ```

The check-symbols script could be cited here. For ex:

Check the validity of Kconfig Config.in files with:

```sh
utils/check-symbols
```

It is used by the CI here:
https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08/support/misc/gitlab-ci.yml.in#L55
It is useful to catch typos or undefined symbols in Kconfig files.
(and yes, this script is not appearing in the Buildroot
documentation at the moment, it could also be added).

> +
> +- Build the affected defconfig, package, board, or test target.

Package can be build tested locally for several toolchain configuration 
with:

```sh
utils/test-pkg -p <packagename>
```

Alternatively,  there is also the Gitlab CI of the patch author account 
which can be used. See:
https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08/docs/manual/contribute.adoc#user-content-runtime-tests-and-gitlab-ci

> +- Use the test infrastructure under `support/testing/` when the change
> +  affects runtime behavior.

Maybe we should mention here the command to run tests is:
```sh
utils/docker-run support/testing/run-tests -d dl -o output_folder 
[testname ...]
```

See:
https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08/docs/manual/contribute.adoc#user-content-using-the-runtime-tests-framework

What do you think?

> +- Generate documentation with `make manual-text` when changing the 
> manual.
> +
> +Do not claim a change is tested unless the relevant command or build 
> was run.

If the public Gitlab CI of the patch author is used, the job link can be
provided. See for example:
https://patchwork.buildroot.org/project/buildroot/patch/20260906215252.499931-1-ju.o@free.fr/
https://patchwork.buildroot.org/project/buildroot/patch/20260907110454.1071513-1-bernd@kuhls.net/
Doing so saves time to maintainers and it is also a good proof of work.

> +
> +## Finding responsible developers
> +
> +`DEVELOPERS` lists developers associated with architectures, packages, 
> boards,
> +and infrastructure. Use `utils/get-developers` to identify 
> notification
> +recipients:
> +
> +```sh
> +./utils/get-developers <patch-files>
> +./utils/get-developers -e
> +./utils/get-developers -c
> +```
> +
> +When adding a new package, board, or significant functionality, update
> +`DEVELOPERS` in the same patch as described in 
> `docs/manual/developers.adoc`.
> +
> +## Contribution workflow
> +
> +Buildroot uses the mailing list for discussion, review, and patch 
> submission.
> +Patches are not submitted through the issue tracker.
> +
> +- Mailing list: `buildroot@buildroot.org`
> +- Subscription: 
> <https://lists.buildroot.org/mailman/listinfo/buildroot>
> +- Archives: <https://lists.buildroot.org/pipermail/buildroot/>
> +- Searchable archives: <https://lore.kernel.org/buildroot/>
> +- Bug tracker: <https://gitlab.com/buildroot.org/buildroot/-/issues>
> +- IRC: `#buildroot` on OFTC
> +- Patchwork: <https://patchwork.buildroot.org/project/buildroot/list/>
> +
> +Read `docs/manual/contribute.adoc` before preparing a patch series.
> +
> +Keep patches focused and complete. Use the affected area as the 
> commit-title
> +prefix, start the description with a lowercase word, explain why the 
> change is
> +needed, and include a `Signed-off-by` line from the human contributor.
> +
> +Typical patch preparation:
> +
> +```sh
> +git fetch --all --tags
> +git rebase upstream/master
> +utils/docker-run make check-package
> +git format-patch -M -n -s -o outgoing upstream/master
> +./utils/get-developers outgoing/*
> +git send-email --to buildroot@buildroot.org --cc-cmd \
> +  './utils/get-developers -e' upstream/master
> +```
> +
> +Use `Tested-by`, `Reviewed-by`, and `Acked-by` only according to the 
> meanings
> +documented in `docs/manual/contribute.adoc`.
> +
> +## Working with Patchwork
> +
> +Use Patchwork to inspect, test, and apply patches submitted to the 
> mailing
> +list. Patchwork is not the submission mechanism.
> +
> +For an individual patch, download its mbox representation and apply it 
> with
> +`git am`:
> +
> +```sh
> +git checkout -b test-patch
> +curl --fail --location \
> +  
> 'https://patchwork.ozlabs.org/project/buildroot/patch/<patch-id>/mbox/' 
> |

The patchwork instance at https://patchwork.ozlabs.org/ is no
longer used and was replace recently. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/2d7d9d8200232bce215d87cadda443ba74308f01

Could you point all patchwork URLs to
https://patchwork.buildroot.org/project/buildroot/
please?

> +  git am
> +```
> +
> +For a patch series, open the series listing in Patchwork and use the 
> series
> +mbox link when available. Apply the complete series in one operation:
> +
> +```sh
> +git checkout -b test-series
> +curl --fail --location '<series-mbox-url>' | git am
> +```
> +
> +A series can also be applied by downloading each patch mbox in order, 
> but the
> +series mbox or a Patchwork bundle is preferred because it preserves 
> ordering
> +and commit metadata.
> +
> +Example series listing:
> +
> +<https://patchwork.ozlabs.org/project/buildroot/list/?series=<series-id>>

Also update here to:
https://patchwork.buildroot.org/project/buildroot/

> +
> +Example individual-patch mbox:
> +
> +<https://patchwork.ozlabs.org/project/buildroot/patch/<patch-id>/mbox/>

Also update here to:
https://patchwork.buildroot.org/project/buildroot/

> +
> +After applying a series, inspect the resulting commits and run 
> validation for
> +the affected area:
> +
> +```sh
> +git log --oneline --decorate -n <number-of-patches>
> +make <affected-target>
> +utils/docker-run make check-package
> +```
> +
> +Patchwork's REST API may be used for searching or inspecting patch 
> metadata,
> +but do not assume that API URLs provide an mbox download. Use the mbox 
> link
> +provided by the Patchwork interface for applying patches, and verify 
> the
> +downloaded content before running `git am`.
> +
> +## AI-assisted contributions
> +
> +AI tools may assist with code, documentation, analysis, and other 
> meaningful
> +content.
> +
> +When AI-assisted work is committed or prepared for submission, follow 
> the
> +commit-message and patch-formatting requirements in
> +[`docs/manual/contribute.adoc`](docs/manual/contribute.adoc#submitting-patches),
> +including the subject and body wrapping rules, required trailers, and 
> human
> +sign-off.
> +
> +Meaningful AI-generated content must be attributed with an 
> `Assisted-by` trailer
> +in the commit message:
> +
> +    Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]
> +
> +Trivial completions, spelling corrections, and common boilerplate do 
> not require
> +attribution. For substantial AI-generated content, summarize the 
> relevant
> +prompts or session context in the commit message or patch description.
> +
> +AI tools must not add `Signed-off-by` trailers. The human contributor 
> must:
> +
> +- review and understand all AI-assisted changes;
> +- run and assess appropriate validation;
> +- verify licensing and provenance;
> +- add their own `Signed-off-by` trailer;
> +- take responsibility for the submitted contribution.
> +
> +AI-assisted changes must not introduce license-incompatible material. 
> Generated
> +content must be checked for factual correctness, appropriate 
> attribution, and
> +compatibility with Buildroot and any affected package's license.
> +
> +AI-generated content should receive review proportional to its 
> significance and
> +the degree of AI involvement. Do not submit generated output without 
> human
> +understanding and validation.
> +
> +AI tools must not invoke `git send-email`, upload patches, or 
> otherwise submit
> +patches on the contributor's behalf. When a patch is ready to submit, 
> present
> +the proposed command sequence, including `git format-patch`,
> +`utils/get-developers`, and `git send-email`, for the contributor to 
> review and
> +run themselves. Do not execute the sending or submission command.
> +
> +AI tools must not autonomously commit or push changes without explicit 
> human
> +review and direction.
> +
> +### Local agent behavior
> +
> +Keep changes narrowly scoped to the requested behavior. Follow 
> existing
> +Buildroot conventions and documentation. Preserve unrelated user 
> changes.
> +Do not create commits or branches unless explicitly requested.
> +
> +### Further reading
> +
> +- [Linux Foundation Generative AI 
> Policy](https://www.linuxfoundation.org/legal/generative-ai)
> --
> 2.39.5

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
