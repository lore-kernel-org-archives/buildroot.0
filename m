Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D899CA1013
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C77058069B;
	Thu,  4 Sep 2025 16:05:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TyRTjf6ilXuc; Thu,  4 Sep 2025 16:05:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 015C080698
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 015C080698;
	Thu,  4 Sep 2025 16:05:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CBD25106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD827605C7
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:05:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HY5UhSe8-ouK for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:05:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BEFBA605CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEFBA605CA
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BEFBA605CA
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:05:12 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1131975576; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 04 Sep 2025 16:05:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uuCST-002e2c-1C;
 Thu, 04 Sep 2025 18:05:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
References: <20250811205938.784904-1-thomas.perale@mind.be>
Date: Thu, 04 Sep 2025 18:05:09 +0200
In-Reply-To: <20250811205938.784904-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Mon, 11 Aug 2025 22:59:38 +0200")
Message-ID: <87plc6i4p6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=pFLnvUP4WxCGbl5qR0ybBNkE16mF5ZKN6Pu5a+RAfD6aiD3RctwdHfWNExVeX1DoDOHckubIQrT49EDdsYDNK8iRPIOstlF1mG9Oec2uSftke2pUUy0MfMDu/ENrmZ4lnKZDQp9gojuQPo79Hq/zo+Yk23KDXrcZlgNdS9CzUzn09vjtNgkyIO6g26WfT+qcGcR1zitIqnhCD5JitdI/niq6/uGn9VSdzIJjQ434TVO9aL86K0Jk1ISUqosH6ZQ3Lv9QhGgkvmIVR+BFcaiV6OFRxikfhcPYW2NskcdrdXB6i4UUECvUgU7h4DQfJqdRBhomLLM+hajZs5tJUjbIZw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=E+fXfCqNNU61+SJDUBJBa1n/6SJp4cf4GkivHFmjDDI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=pFLnvUP4
Subject: Re: [Buildroot] [PATCH] package/mariadb: fix openssl RMD160
 requirement
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > On the autobuilder the mariadb package fails to build when the
 > BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 variable is not set.

 > See the following autobuilder error:

 > ```
 > /workdir/instance-0/output-1/build/mariadb-10.11.11/libmariadb/libmariadb/secure/openssl_crypt.c:
 > In function 'ma_hash_get_algorithm':
 > /workdir/instance-0/output-1/build/mariadb-10.11.11/libmariadb/libmariadb/secure/openssl_crypt.c:40:12:
 > error: implicit declaration of function 'EVP_ripemd160'; did you mean
 > 'LN_ripemd160'? [-Wimplicit-function-declaration]
 >    40 |     return EVP_ripemd160();
 >       |            ^~~~~~~~~~~~~
 >       |            LN_ripemd160
 > /workdir/instance-0/output-1/build/mariadb-10.11.11/libmariadb/libmariadb/secure/openssl_crypt.c:40:12:
 > error: returning 'int' from a function with return type 'const EVP_MD
 > *' {aka 'const struct evp_md_st *'} makes pointer from integer without
 > a cast [-Wint-conversion]
 >    40 |     return EVP_ripemd160();
 >       |            ^~~~~~~~~~~~~~~
 > ```

 > This error can be reproduced with the following config:

 > ```
 > cat <<EOF >.config
 > BR2_arm=y
 > BR2_cortex_a7=y
 > BR2_TOOLCHAIN_EXTERNAL=y
 > BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 > BR2_PACKAGE_LIBOPENSSL=y
 > # BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 is not set
 > BR2_PACKAGE_MARIADB=y
 > EOF
 > make olddefconfig
 > make mariadb
 > ```

 > This patch adds a requirement to the RMD160 crypto for the MariaDB
 > package.

 > Fixes: https://autobuild.buildroot.org/results/f2b/f2b749cb7019856c5434c27987e8bfb2dc179cda
 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
 > ---
 > Tested building by removing all the other crypto except DES & RMD160. It
 > builds on that case.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
