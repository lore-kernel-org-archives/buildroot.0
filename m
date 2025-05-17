Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8427C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 10:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D874406E4;
	Sat, 17 May 2025 10:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mx6_I9cXYLOq; Sat, 17 May 2025 10:24:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9480440728
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9480440728;
	Sat, 17 May 2025 10:24:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A13D6223
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9143F40728
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:24:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id okv9kmvdA63P for <buildroot@buildroot.org>;
 Sat, 17 May 2025 10:24:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BF3DD406DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF3DD406DE
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF3DD406DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:24:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B8F291C0D7A; Sat, 17 May 2025 12:24:45 +0200 (CEST)
Message-ID: <447ef018-8c6c-4800-9013-0239886c9da1@rnout.be>
Date: Sat, 17 May 2025 12:24:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1747241900.git.yann.morin.1998@free.fr>
 <cc940dccb8f864ed0718fcc655fd972a49f3c5d4.1747241900.git.yann.morin.1998@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <cc940dccb8f864ed0718fcc655fd972a49f3c5d4.1747241900.git.yann.morin.1998@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747477485; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=TrGgwf6IZE7TRf2eQSFUaCbdPSrBbz1frxTDKokXhbY=;
 b=dipMylX4jqWEA1w1WJgKfZ9+///WV1IYJNjk7pEUmwYgMI9RKkscpLpEnAZ1UErOgmpzvJ
 ue8QEMHtfQtTtCc9jhebZRd8lek8fQmQFfkve9XUhvjKYHtTTnAff6ODT7ibWhIvykQm3F
 M3Ceav79I8RStlU7XgQW+zidlzPSg1gGTKLJC2a4mnEDrc0XNTGIlp2i/w5ALlWX/LOTOU
 5yhKaGzDTjtKlBk2ZnK8uQ10SqCORnkk4QS/KCJJNhn36W9QZ1a1X72XMV0NXSib1jdZSt
 YerCM9r8LZLMR/LdJIiTMSS1C1jk/n2JboaW89/Rgm84R3Pvxp1NyE3Y3mqLEg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=dipMylX4
Subject: Re: [Buildroot] [PATCH 07/13] support/scripts;
 teach check-merged what to check
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/05/2025 18:58, Yann E. MORIN wrote:
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>   Makefile                                   | 10 +++++-----
>   package/skeleton-custom/skeleton-custom.mk |  7 ++++---
>   support/scripts/check-merged               | 19 +++++++++++++++----
>   3 files changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index a5aa1c6553..1248dfb9e0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -780,11 +780,13 @@ endif
>   
>   # For a merged /usr, ensure that /lib, /bin and /sbin and their /usr
>   # counterparts are appropriately setup as symlinks ones to the others.
> -ifeq ($(BR2_ROOTFS_MERGED_USR),y)
> -
>   	$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
>   		@$(call MESSAGE,"Sanity check in overlay $(d)")$(sep) \
> -		$(Q)not_merged_dirs="$$(support/scripts/check-merged $(d))"; \
> +		$(Q)not_merged_dirs="$$(\
> +			support/scripts/check-merged \
> +			$(d) \
> +			$(if $(BR2_ROOTFS_MERGED_USR),merged-usr) \
> +		)"; \
>   		test -n "$$not_merged_dirs" && { \
>   			echo "ERROR: The overlay in $(d) is not" \
>   				"using a merged /usr for the following directories:" \
> @@ -792,8 +794,6 @@ ifeq ($(BR2_ROOTFS_MERGED_USR),y)
>   			exit 1; \
>   		} || true$(sep))
>   
> -endif # merged /usr
> -
>   	$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
>   		@$(call MESSAGE,"Copying overlay $(d)")$(sep) \
>   		$(Q)$(call SYSTEM_RSYNC,$(d),$(TARGET_DIR))$(sep))
> diff --git a/package/skeleton-custom/skeleton-custom.mk b/package/skeleton-custom/skeleton-custom.mk
> index 7d64959711..e583d2d731 100644
> --- a/package/skeleton-custom/skeleton-custom.mk
> +++ b/package/skeleton-custom/skeleton-custom.mk
> @@ -25,10 +25,11 @@ endif
>   
>   # For a merged /usr, ensure that /lib, /bin and /sbin and their /usr
>   # counterparts are appropriately setup as symlinks ones to the others.
> -ifeq ($(BR2_ROOTFS_MERGED_USR),y)
>   SKELETON_CUSTOM_NOT_MERGED_USR_DIRS = \
> -	$(shell support/scripts/check-merged $(SKELETON_CUSTOM_PATH))
> -endif # merged /usr
> +	$(shell support/scripts/check-merged \
> +		$(SKELETON_CUSTOM_PATH) \
> +		$(if $(BR2_ROOTFS_MERGED_USR),merged-usr) \
> +	)

  While you're anyway working on this: I think there's little point of doing 
this as a "preliminary" check, I think it's fine to do this check while 
"building" the custom skeleton (i.e. in SKELETON_CUSTOM_INSTALL_TARGET_CMDS).

  That would allow us to move the error message to the check-merged script 
itself, and let it return 1 in case it's not properly merged. And with that, 
both instances can simply call the script without capturing its output. It's 
going to save +-10 lines of code and make things easier to understand IMHO.


>   
>   ifeq ($(BR2_PACKAGE_SKELETON_CUSTOM)$(BR_BUILDING),yy)
>   ifneq ($(SKELETON_CUSTOM_NOT_MERGED_USR_DIRS),)
> diff --git a/support/scripts/check-merged b/support/scripts/check-merged
> index 9459d975fe..7fea4e1dea 100755
> --- a/support/scripts/check-merged
> +++ b/support/scripts/check-merged
> @@ -11,12 +11,14 @@
>   #
>   # Input:
>   #   $1:     the root directory (skeleton, overlay) to check
> +#   $*:     the list of merged checks to perform: merged-usr

  If you make this an option (i.e. --merged-usr), then we can replace $1 with a 
$* that covers all directories, and we can get rid of the foreach in Makefile's 
check of the overlays, and that code could simplify to:

	@$(call MESSAGE,"Sanity check in overlays)
	support/scripts/check-merged \
		$(if $(BR2_ROOTFS_MERGED_USR),--merged-usr) \
		$(call qstrip,$(BR2_ROOTFS_OVERLAY))


  Of course, there's a risk that I'm overengineering things, so feel free to 
ignore my suggestions.

  Regards,
  Arnout


>   # Output:
>   #   stdout: the list of non-compliant paths (empty if compliant).
>   #
>   
> -# The directory to check for merged-usr
> +# The directory to check for $what
>   root="${1}"
> +shift
>   
>   # Extract the inode numbers for all of those directories. In case any is
>   # a symlink, we want to get the inode of the pointed-to directory, so we
> @@ -46,6 +48,15 @@ test_merged() {
>   	printf '%s\n' "${dir1}"
>   }
>   
> -test_merged "${root}" "/lib" "/usr/lib"
> -test_merged "${root}" "/bin" "/usr/bin"
> -test_merged "${root}" "/sbin" "/usr/sbin"
> +for what; do
> +	case "${what}" in
> +		(merged-usr)
> +			test_merged "${root}" "/lib" "/usr/lib"
> +			test_merged "${root}" "/bin" "/usr/bin"
> +			test_merged "${root}" "/sbin" "/usr/sbin"
> +		;;
> +		(*)
> +			printf 'Error: unknown type of test %s\n' "${what}"
> +		;;
> +	esac
> +done

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
