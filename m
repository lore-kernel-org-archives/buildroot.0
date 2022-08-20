Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B848C25B08
	for <buildroot@archiver.kernel.org>; Sat, 20 Aug 2022 08:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F21883299;
	Sat, 20 Aug 2022 08:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F21883299
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wrReUh4mMsjv; Sat, 20 Aug 2022 08:23:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DC138329E;
	Sat, 20 Aug 2022 08:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DC138329E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3EF311BF36A
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 08:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26447402F7
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 08:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26447402F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PfKGrns0KWMX for <buildroot@lists.busybox.net>;
 Sat, 20 Aug 2022 08:23:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D2E74029B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D2E74029B
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 08:23:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:18c4:2559:c4a2:6528])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3867F60132;
 Sat, 20 Aug 2022 10:23:12 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 20 Aug 2022 10:23:11 +0200
Date: Sat, 20 Aug 2022 10:23:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220820082311.GE2167049@scaer>
References: <20220818213936.442912-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220818213936.442912-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660983795;
 bh=DbKjHn81m/rHRX0wR4I0zDkQ6r/Vyj8PJ7/wkX3+42A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KNqYyH68KnfQU6rJMjUwi9tYjcQNfvZe16CCRT1d+lkarxCRHnY8c9ka/IoxRJSbm
 ZfPjDrB4BulxAU4hEKhshwDmIYZjS/rA+xN8ESw8QP2QG/KE+Y+7Yt36l6KhsXmhW6
 gP9kzG2jsPWt8gItjitui7Xm3ALEs9v8KL3IfLOS44iWXjD6fX4Bx1J3YwI6RVYQWJ
 ZG5Xj0HGYhXXLFzHakopTVaCdsFIUbaM+uXyOjw5SAFWQM+Rr6rDxkrbsRy1I/kgE/
 wiQ6yhPbcW5tQKfsQBVNR5dByD7/ZytHI2Zu/LzxK7F8qBQV6D7Q3YD6CS5Z3B+tHZ
 GuCiyAXlahuMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KNqYyH68
Subject: Re: [Buildroot] [PATCH 1/1] package/strongswan: fix wolfssl build
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
Cc: =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-18 23:39 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure with BR2_PACKAGE_WOLFSSL_ALL raised
> since bump to version 5.9.0 in commit
> da912a3d2abe2eb2b338c03ec56c7e39a4d640f9:
> 
> In file included from ../../../../src/libstrongswan/utils/utils.h:59,
>                  from ../../../../src/libstrongswan/library.h:101,
>                  from wolfssl_common.h:29,
>                  from wolfssl_aead.c:23:
> wolfssl_aead.c:90:16: error: conflicting types for 'encrypt'; have '_Bool(union <anonymous>,  chunk_t,  chunk_t,  chunk_t,  chunk_t *)'
>    90 | METHOD(aead_t, encrypt, bool,
>       |                ^~~~~~~
> ../../../../src/libstrongswan/utils/utils/object.h:99:20: note: in definition of macro 'METHOD'
>    99 |         static ret name(union {iface *_public; this;} \
>       |                    ^~~~
> In file included from /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/wolfssl/wolfcrypt/wc_port.h:573,
>                  from /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/wolfssl/wolfcrypt/types.h:35,
>                  from /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/wolfssl/wolfcrypt/logging.h:33,
>                  from /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/wolfssl/ssl.h:35,
>                  from wolfssl_common.h:64,
>                  from wolfssl_aead.c:23:
> /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/unistd.h:149:6: note: previous declaration of 'encrypt' with type 'void(char *, int)'
>   149 | void encrypt(char *, int);
>       |      ^~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/02f080c2f6d8272cb8cc1de66e058d66fb7499bc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...gswan-plugins-wolfssl-rename-encrypt.patch | 150 ++++++++++++++++++
>  1 file changed, 150 insertions(+)
>  create mode 100644 package/strongswan/0001-src-libstrongswan-plugins-wolfssl-rename-encrypt.patch
> 
> diff --git a/package/strongswan/0001-src-libstrongswan-plugins-wolfssl-rename-encrypt.patch b/package/strongswan/0001-src-libstrongswan-plugins-wolfssl-rename-encrypt.patch
> new file mode 100644
> index 0000000000..7b47b3278b
> --- /dev/null
> +++ b/package/strongswan/0001-src-libstrongswan-plugins-wolfssl-rename-encrypt.patch
> @@ -0,0 +1,150 @@
> +From 5900426a710eaa65a27784687775e331bcb0489b Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Mon, 8 Aug 2022 09:52:19 +0200
> +Subject: [PATCH] wolfssl: Rename `encrypt` methods to avoid conflicts with
> + system headers
> +
> +Rename `encrypt` methods to avoid the following build failure when wolfSSL
> +is built with --enable-opensslextra:
> +
> +In file included from ../../../../src/libstrongswan/utils/utils.h:59,
> +                 from ../../../../src/libstrongswan/library.h:101,
> +                 from wolfssl_common.h:29,
> +                 from wolfssl_aead.c:23:
> +wolfssl_aead.c:90:16: error: conflicting types for 'encrypt'; have '_Bool(union <anonymous>,  chunk_t,  chunk_t,  chunk_t,  chunk_t *)'
> +   90 | METHOD(aead_t, encrypt, bool,
> +      |                ^~~~~~~
> +../../../../src/libstrongswan/utils/utils/object.h:99:20: note: in definition of macro 'METHOD'
> +   99 |         static ret name(union {iface *_public; this;} \
> +      |                    ^~~~
> +In file included from /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/wolfssl/wolfcrypt/wc_port.h:573,
> +                 from /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/wolfssl/wolfcrypt/types.h:35,
> +                 from /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/wolfssl/wolfcrypt/logging.h:33,
> +                 from /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/wolfssl/ssl.h:35,
> +                 from wolfssl_common.h:64,
> +                 from wolfssl_aead.c:23:
> +/home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/unistd.h:149:6: note: previous declaration of 'encrypt' with type 'void(char *, int)'
> +  149 | void encrypt(char *, int);
> +      |      ^~~~~~~
> +
> +Closes strongswan/strongswan#1201
> +[Retrieved from:
> +https://github.com/strongswan/strongswan/commit/5900426a710eaa65a27784687775e331bcb0489b]
> +---
> + src/libstrongswan/plugins/wolfssl/wolfssl_aead.c           | 4 ++--
> + src/libstrongswan/plugins/wolfssl/wolfssl_crypter.c        | 4 ++--
> + src/libstrongswan/plugins/wolfssl/wolfssl_ec_public_key.c  | 4 ++--
> + src/libstrongswan/plugins/wolfssl/wolfssl_ed_public_key.c  | 4 ++--
> + src/libstrongswan/plugins/wolfssl/wolfssl_rsa_public_key.c | 4 ++--
> + 5 files changed, 10 insertions(+), 10 deletions(-)
> +
> +diff --git a/src/libstrongswan/plugins/wolfssl/wolfssl_aead.c b/src/libstrongswan/plugins/wolfssl/wolfssl_aead.c
> +index 2ea7c94cd65..44f054916cf 100644
> +--- a/src/libstrongswan/plugins/wolfssl/wolfssl_aead.c
> ++++ b/src/libstrongswan/plugins/wolfssl/wolfssl_aead.c
> +@@ -87,7 +87,7 @@ struct private_aead_t {
> + 	encryption_algorithm_t alg;
> + };
> + 
> +-METHOD(aead_t, encrypt, bool,
> ++METHOD(aead_t, encrypt_, bool,
> + 	private_aead_t *this, chunk_t plain, chunk_t assoc, chunk_t iv,
> + 	chunk_t *encrypted)
> + {
> +@@ -323,7 +323,7 @@ aead_t *wolfssl_aead_create(encryption_algorithm_t algo,
> + 
> + 	INIT(this,
> + 		.public = {
> +-			.encrypt = _encrypt,
> ++			.encrypt = _encrypt_,
> + 			.decrypt = _decrypt,
> + 			.get_block_size = _get_block_size,
> + 			.get_icv_size = _get_icv_size,
> +diff --git a/src/libstrongswan/plugins/wolfssl/wolfssl_crypter.c b/src/libstrongswan/plugins/wolfssl/wolfssl_crypter.c
> +index cffe7ba2375..085a912404c 100644
> +--- a/src/libstrongswan/plugins/wolfssl/wolfssl_crypter.c
> ++++ b/src/libstrongswan/plugins/wolfssl/wolfssl_crypter.c
> +@@ -230,7 +230,7 @@ METHOD(crypter_t, decrypt, bool,
> + 	return success;
> + }
> + 
> +-METHOD(crypter_t, encrypt, bool,
> ++METHOD(crypter_t, encrypt_, bool,
> + 	private_wolfssl_crypter_t *this, chunk_t data, chunk_t iv, chunk_t *dst)
> + {
> + 	u_char *out;
> +@@ -578,7 +578,7 @@ wolfssl_crypter_t *wolfssl_crypter_create(encryption_algorithm_t algo,
> + 	INIT(this,
> + 		.public = {
> + 			.crypter = {
> +-				.encrypt = _encrypt,
> ++				.encrypt = _encrypt_,
> + 				.decrypt = _decrypt,
> + 				.get_block_size = _get_block_size,
> + 				.get_iv_size = _get_iv_size,
> +diff --git a/src/libstrongswan/plugins/wolfssl/wolfssl_ec_public_key.c b/src/libstrongswan/plugins/wolfssl/wolfssl_ec_public_key.c
> +index d8a1ededb06..110543762f2 100644
> +--- a/src/libstrongswan/plugins/wolfssl/wolfssl_ec_public_key.c
> ++++ b/src/libstrongswan/plugins/wolfssl/wolfssl_ec_public_key.c
> +@@ -193,7 +193,7 @@ METHOD(public_key_t, verify, bool,
> + 	}
> + }
> + 
> +-METHOD(public_key_t, encrypt, bool,
> ++METHOD(public_key_t, encrypt_, bool,
> + 	private_wolfssl_ec_public_key_t *this, encryption_scheme_t scheme,
> + 	void *params, chunk_t crypto, chunk_t *plain)
> + {
> +@@ -324,7 +324,7 @@ static private_wolfssl_ec_public_key_t *create_empty()
> + 			.key = {
> + 				.get_type = _get_type,
> + 				.verify = _verify,
> +-				.encrypt = _encrypt,
> ++				.encrypt = _encrypt_,
> + 				.get_keysize = _get_keysize,
> + 				.equals = public_key_equals,
> + 				.get_fingerprint = _get_fingerprint,
> +diff --git a/src/libstrongswan/plugins/wolfssl/wolfssl_ed_public_key.c b/src/libstrongswan/plugins/wolfssl/wolfssl_ed_public_key.c
> +index f423d8d5691..ea0fb3dfc77 100644
> +--- a/src/libstrongswan/plugins/wolfssl/wolfssl_ed_public_key.c
> ++++ b/src/libstrongswan/plugins/wolfssl/wolfssl_ed_public_key.c
> +@@ -111,7 +111,7 @@ METHOD(public_key_t, verify, bool,
> + 	return ret == 0 && res == 1;
> + }
> + 
> +-METHOD(public_key_t, encrypt, bool,
> ++METHOD(public_key_t, encrypt_, bool,
> + 	private_public_key_t *this, encryption_scheme_t scheme,
> + 	void *params, chunk_t crypto, chunk_t *plain)
> + {
> +@@ -368,7 +368,7 @@ static private_public_key_t *create_empty(key_type_t type)
> + 		.public = {
> + 			.get_type = _get_type,
> + 			.verify = _verify,
> +-			.encrypt = _encrypt,
> ++			.encrypt = _encrypt_,
> + 			.get_keysize = _get_keysize,
> + 			.equals = public_key_equals,
> + 			.get_fingerprint = _get_fingerprint,
> +diff --git a/src/libstrongswan/plugins/wolfssl/wolfssl_rsa_public_key.c b/src/libstrongswan/plugins/wolfssl/wolfssl_rsa_public_key.c
> +index 72df115fe90..da8899c2d8c 100644
> +--- a/src/libstrongswan/plugins/wolfssl/wolfssl_rsa_public_key.c
> ++++ b/src/libstrongswan/plugins/wolfssl/wolfssl_rsa_public_key.c
> +@@ -216,7 +216,7 @@ METHOD(public_key_t, verify, bool,
> + 	}
> + }
> + 
> +-METHOD(public_key_t, encrypt, bool,
> ++METHOD(public_key_t, encrypt_, bool,
> + 	private_wolfssl_rsa_public_key_t *this, encryption_scheme_t scheme,
> + 	void *params, chunk_t plain, chunk_t *crypto)
> + {
> +@@ -440,7 +440,7 @@ static private_wolfssl_rsa_public_key_t *create_empty()
> + 			.key = {
> + 				.get_type = _get_type,
> + 				.verify = _verify,
> +-				.encrypt = _encrypt,
> ++				.encrypt = _encrypt_,
> + 				.equals = public_key_equals,
> + 				.get_keysize = _get_keysize,
> + 				.get_fingerprint = _get_fingerprint,
> -- 
> 2.35.1
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
