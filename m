Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B9B7C5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 21:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E92483B9D;
	Fri,  1 Mar 2024 21:03:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fUGYUuINOcd4; Fri,  1 Mar 2024 21:03:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 866C483B9E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 866C483B9E;
	Fri,  1 Mar 2024 21:03:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0BECB1BF995
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 21:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F3B9617BD
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 21:03:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hvb4vuU1WEWr for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 21:03:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0AEDB60EC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AEDB60EC8
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0AEDB60EC8
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 21:03:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 185A51BF203;
 Fri,  1 Mar 2024 21:03:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rgA2g-0076ZI-1d;
 Fri, 01 Mar 2024 22:03:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240301205037.914259-1-fontaine.fabrice@gmail.com>
Date: Fri, 01 Mar 2024 22:03:42 +0100
In-Reply-To: <20240301205037.914259-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 1 Mar 2024 21:50:37 +0100")
Message-ID: <87edct64wh.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/python-grpcio: add
 BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure raised since the addition of the package
 > in commit ea45b95c0e54866134c63e88e60489a012b3d134:

 > In file included from third_party/boringssl-with-bazel/src/include/openssl/base.h:78,
 >                  from third_party/boringssl-with-bazel/src/include/openssl/ssl.h:145,
 >                  from ./src/core/tsi/ssl/key_logging/ssl_key_logging.h:23,
 >                  from ./src/core/lib/security/security_connector/ssl_utils.h:42,
 >                  from ./src/core/lib/security/credentials/tls/grpc_tls_certificate_distributor.h:36,
 >                  from ./src/core/ext/xds/certificate_provider_store.h:44,
 >                  from src/core/ext/xds/certificate_provider_store.cc:21:
 > third_party/boringssl-with-bazel/src/include/openssl/target.h:62:2: error: #error "Unknown target CPU"
 >    62 | #error "Unknown target CPU"
 >       |  ^~~~~

 > Fixes: ea45b95c0e54866134c63e88e60489a012b3d134
 >  - http://autobuild.buildroot.org/results/36686aca1b45f0bf692a60e67a48424b561930a3
 >  - http://autobuild.buildroot.org/results/4f79c7b1b2fc3306f300ae3ec0aa4439725814c1

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
