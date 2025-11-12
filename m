Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB75ECD484D
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 21:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C0DA82EC7;
	Wed, 12 Nov 2025 21:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bJMocozkRHee; Wed, 12 Nov 2025 21:33:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA95182B5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA95182B5E;
	Wed, 12 Nov 2025 21:33:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B9B3158
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 21:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5694E82B5E
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 21:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FdXOUKJes5Vz for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 21:33:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C7BA682B08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7BA682B08
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7BA682B08
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 21:33:49 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1146416014; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Nov 2025 21:33:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vJITG-000wHS-0S;
 Wed, 12 Nov 2025 22:33:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Simon Dawson <spdawson@gmail.com>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Carsten Schoenert
 <c.schoenert@gmail.com>,  Lionel Orry <lionel.orry@gmail.com>,  Fabrice
 Fontaine <fontaine.fabrice@gmail.com>
References: <20251106204522.3273683-1-bernd@kuhls.net>
 <20251106204522.3273683-2-bernd@kuhls.net>
Date: Wed, 12 Nov 2025 22:33:41 +0100
In-Reply-To: <20251106204522.3273683-2-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 6 Nov 2025 21:45:08 +0100")
Message-ID: <87ikffq6kq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=DB34E7OXZZ7xgTyDQ+mWEtO7oTdkJFHGyWFzztYkaFFBskCpzRS6Tpdo61sREbvO9o74yoYgt1UHkiP8ZU6qoAFVkgITG1d+ZUSMTiICu6wjLHxgOblThD8Wrc2sodADd+AN0rHLA8GNWPwN+MCTKHwWsq1+BGT2GIGVCbosBS7LKF/ZL7p/A5E8xasQqqLDyq6nLW82RV7XSi8ZS5EGV85sF8d5TzjMAChDj1Wg4gnRdu0k8fo/uWtqucd8eP4agi30QqI3gl3cp47tf8mIxu3R3Quup3iqh4y/tVZ1HWNhu4P+SX2DqVuNE1ziCgitp6bLlqdJ2N1lzaSwnQ8B9g==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=IdLK3qBJOb/fF6cGOSE/MwNwL+CUXKg6Exu6jjESQ3I=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=DB34E7OX
Subject: Re: [Buildroot] [PATCH v3 01/14] package/asterisk: fix build caused
 by libjwt bump
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > In commit 770f9154978c40ce5b7718174108b37c5310869d, libjwt was bumped
 > from 1.17.2 to 3.2.0, which is a big bump. And the libjwt website
 > states "Version 3 of LibJWT is a complete overhaul of the code. Please
 > see documentation for usage."

 > And indeed, this version bump breaks the build of Asterisk:

 > res_stir_shaken/attestation.c: In function 'pack_payload':
 > res_stir_shaken/attestation.c:357:9: error: implicit declaration of
 > function 'jwt_add_grants_json' [-Wimplicit-function-declaration]
 >   357 |         jwt_add_grants_json(jwt, payload_str);
 >       |         ^~~~~~~~~~~~~~~~~~~
 > In file included from /home/autobuild/autobuild/instance-11/output-1/build/asterisk-22.3.0/include/asterisk/module.h:39,
 >                  from res_stir_shaken/attestation.c:24:
 > res_stir_shaken/attestation.c: In function '_dtor_jwt':
 > res_stir_shaken/attestation.c:367:38: error: implicit declaration of function 'jwt_free'; did you mean 'jwks_free'? [-Wimplicit-function-declaration]
 >   367 |         RAII_VAR(jwt_t *, jwt, NULL, jwt_free);
 >       |                                      ^~~~~~~~

 > To fix this, let's use the bundled version of libjwt in Asterisk,
 > since even Asterisk master hasn't been fixed to be compatible with
 > libjwt 3.x.

 > Of course, this raises the question of whether the separate libjwt
 > package should be removed, as it is anyway only used by Asterisk.

 > Fixes:

 >   http://autobuild.buildroot.net/results/2d39791c65c5b71b0533d4b2bce5f073f5919552/

 > Cc: Waldemar Brodkorb <wbx@openadk.org>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > [Bernd: Added libopenssl dependency needed by bundled libjwt]
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

It does look like the host-asterisk workaround for menuselect isn't
working anymore as the directory gets cleaned:

https://autobuild.buildroot.net/results/660/660d89e1264510f73f1486f9807dbefcbe73850c/build-end.log

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
