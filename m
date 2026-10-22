Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5345A606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 07:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HFLVnKJr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=KNxTZn3i
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AA4C80D43;
	Thu, 22 Oct 2026 07:00:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTe9SPRO4Max; Thu, 22 Oct 2026 07:00:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B42CA80D49
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792652414;
	b=sYKu0lOoBNNTpVJrBE8DzWnUf0xMeIzL8y72o7kXdWoTNCRJJVWoq19rH2vfy+edUfbu
	 FkKtsaenFz4b2sWhe9+nYdUV/lD8QGR8zJEBlDK2+oYvavthw/4mSHqqmfflgsOqQW9vY
	 s/NS/36gC7+8WJ10zxhvcCcsCLYhD9a9wfj2jeVWL9LmgJkUgwlKG2qC9fIQti7zu8rPL
	 QPPTWCKyd44TRsRSr3xGrskJjXv+G1Eb8nOiseDuaIHvp83qINw1nAkUFa3XfSgi993T4
	 mIU9WfMDinnXHS7qgV7jqDvGJiZHXqQTWvmAFKQ/G+kT08NJSZI/ZO2JQbuqv7giijA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792652414;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-MIME-Autoconverted:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=P4l2TxAjtFt4ZGz8ohfoPWCQkWYItPuKR/xLwOFIGz8=;
	b=ktSTPv06izCsrr+OWNxWOtRbe64Vrh8wDkFDSIdQjZZw+cQcEYkZjryRYpehVZx9AKO0
	 0+pfTvBXOKPQm3HULwuTQXWsmlXvCoqrAmp8WVDImiuASiTxI/4mCw9pqa72vI4zbaPfz
	 gbYJgWzwmACtysfxDImLwK8qokSkNbTZdRXYy1Dega3w/ZCwSr7j7wjM7eyNqH7H74ob7
	 DTaY/VClwrzf8mVlhLllpnEQjHeWeWDW1CyFeW30tJD0nElL9lMPfFkV6Xx3DifWxmRkG
	 MKIHVj+wvKqTSeOEmI51Zaw3T1GlZykDttp+ko/2bxelGmb5+lmSJ8jNCkf7kOmmzfg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792652414;
	bh=P4l2TxAjtFt4ZGz8ohfoPWCQkWYItPuKR/xLwOFIGz8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HFLVnKJrtPO5P8G1djNMMjq0780B7wspkg/Cz2xAtU+YkT4Io1SerguttS+WhLRtw
	 Ri1hgQVO7n7dTBJwL87fTG19UL+LJZdJV/4D0kaZbFrcPK8Z/b1I1MsJ93xyREwD1K
	 SB6FRAaf8C03W1QFOVKJl+SxxkFwXOdI9ciXhq3hkWehPT9mT01QcqbW7uXoYIZhj8
	 bevzWVg27Q87hpcHJGM7Yl6VU622k0WW52oa+t7/Ojb2EDQSwl7wlCWA9w/txRko/I
	 NX8WC0YnttQpXvHg96puk1RQWWxJxaRVxaGwWCSrvRZJjT5AiXyh3PqKeow5L7OQju
	 FP32uuHCpg6qQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B42CA80D49;
	Thu, 22 Oct 2026 07:00:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 30BFB1AB
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 07:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E23E4022A
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 07:00:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Gt48n2lSNk5 for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 07:00:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B5DF140075
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792652412;
 b=C5clDdTHGtvlsBmjdjKA31wQWGFbTB1hbBN6AQKcBfHH5VXImlKEWILCiPQcWnm/jWSf
 UJ1fP7cSMVDNxPp9BkyqLxRur/B9Moqx+FEsrQHgOUkDvjw2n18FHTQ4tDEDNtNTKCQO9
 hTSWRi8SQO+kUVACL1IotS6u0gZ/3QSFiHQxvSnL3StSz6v6BJDV/fFlZUEl8AJH8GWqr
 PTLc7D/OjFHnh8lpPJe4+nJ9WZJbv+o421sz/QeOYdBZpoEJtlOEPDxg/DVQqBZCXR1g9
 xb/ZCzqD6KoLrf/JHzTVk6eboOBFDqdeffQfS4wr8/eNVGZa0ko4/xHkl0fTVz16R8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792652412;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-MIME-Autoconverted:Content-Type;
 bh=i7QVDMfiSsrSHh2pISI0f1uYA/CmB4MflUR/DJ6xmCM=;
 b=g+oG4kN2y4+a5u9RG+L2/XNTTUAa5kD7/kLt2/jhOHMQVOsZIxH7DTn8tDGqiZZuYPft
 Cw45pkGoEiTxQDjhdacvEg9gMettjS9uPc6VnkZrljOcc7PI1qxKrTZ2CHzpvf3mSbB2B
 +JCEW91lKQxDmMJfv6LcySJH17Cjbz7Wae+YoYrGA7lOjBuGRFxlTzZfZfY6aG3CPVn65
 SAAPualOH/Ndklr5wfTr9dMUEqoanpNQXzAtbV7GhLhmYChj/lAz1bfqZinHUYsQOc1nu
 VDy0fnKenY88cjuEA2lxsmUqzKus6YLvorqF9qE1RoeipJmPOqiFPqXoH4gaDpkpnXg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=KNxTZn3i; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=KNxTZn3i
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5DF140075
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 07:00:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=KNxTZn3ifwNFjlPaa3z/0TfnjZe0vaOI40vE7hmhhcI4ykzDkdbTMx2fvhxk3QzoLXjR4jxKNQAV1AxLegElZ4rfy+k0nxM8TZTJL/PWuibAwSWtjTa8W9h8bssjTQzIgPQU4bREYcrD6bGiLh99iAjvluikPOtUtNv8ELZsIjOTJBmseleTkkrWEzDTOwEZbMDxtyI78/dwyfI5PN8y4437Vhz1cW62rW6TwKuekfYGw+SEbgkpnkcdX6BsR+YbbWdA7xBFSjagYtRhKyY1QZ6TT/0bvBxdbBLbB1S5tCKuiEj7TYVzERmwUtAexvy54lcs6/LRdMNu884HGhi5Hg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=USrBHWA59Jc2O0NQCWiWiCIxhl41Zerjuh/iOHuKjSI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -904456500; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 22 Oct 2026 07:00:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xJmmT-0000000AdD2-2Bot;
 Thu, 22 Oct 2026 09:00:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 09:00:02 +0200
Message-ID: <20261022070004.2533972-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH] package/nginx: security bump to version 1.30.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes the following vulnerabilities:

Changes with nginx 1.30.6                                        14 Oct 2026

    *) Security: a buffer overflow might occur in a worker process when
       using the "alias" directive if the request URI was changed by the
       "rewrite" directive and was then mapped to a file path
       (CVE-2026-15176).

    *) Security: a buffer overflow might occur in a worker process while
       evaluating string expressions with variables, which affected the
       document root calculation and request logging in the http and stream
       modules (CVE-2026-93479).
       Thanks to Matt Suiche of Tolmo Inc.

    *) Security: when using HTTP/3 a part of an unknown frame might be
       treated as the request body, which might result in bypassing the
       "client_max_body_size" limit or injecting data in the proxied request
       (CVE-2026-95101).
       Thanks to Hansol Lee of GOTROOT.

    *) Security: when using TLS session ticket key rotation, one of the keys
       was left uninitialized, which might allow to forge a session
       (CVE-2026-97629).
       Thanks to PhiNode Labs.

    *) Security: when using asynchronous file I/O (AIO), use-after-free
       might occur in certain configurations if the SSI page has "include
       virtual" commands (CVE-2026-97205).
       Thanks to cyberlancer.

Changes with nginx 1.30.5                                        15 Sep 2026

    *) Security: a heap memory buffer overflow might occur in a worker
       process under certain configurations when using HTTP/3 with OpenSSL
       3.5.0 and earlier (CVE-2026-90439).
       Thanks to Banny Liao.

Changes with nginx 1.30.4                                        15 Jul 2026

    *) Security: heap buffer overflow might occur in a worker process when
       using the map directive with regex matching if the map variable was
       included in a string expression after a capture affected by this map;
       a similar issue might happen when using a non-cacheable variable in a
       string expression (CVE-2026-42533).
       Thanks to Mufeed VH of Winfunc Research and Maxim Dounin.

    *) Security: uninitialized memory access might occur when using unnamed
       regex captures with the "slice" directive or background cache update,
       which could result in worker process memory disclosure or worker
       process termination (CVE-2026-60005).

    *) Security: use-after-free might occur when processing a specially
       crafted proxied backend response with the ngx_http_ssi_filter_module
       (CVE-2026-56434).
       Thanks to P4P3R-HAK.

https://nginx.org/en/CHANGES-1.30

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nginx/nginx.hash | 2 +-
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 6c3afa889d..646b51997e 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  e5823dc6f45610993def93ebf6cfce68264af4958c77e874b7d20f3709001b8f  nginx-1.30.3.tar.gz
+sha256  3cf46f5ed7504d460125866b7bea99fb357f31d887e2e63b35503310e9b8b6c8  nginx-1.30.6.tar.gz
 # License files, locally calculated
 sha256  08845fe39e06b51dad7685c28140ab49577a86e947523e16b536a46caf89ad5c  LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index ad61ef6140..c330e81ebf 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.30.3
+NGINX_VERSION = 1.30.6
 NGINX_SITE = https://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
