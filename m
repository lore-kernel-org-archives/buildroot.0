Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D15C433FE
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 16:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E30CA40B24;
	Tue, 10 May 2022 16:33:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rKn9fxtjZIA7; Tue, 10 May 2022 16:33:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1769403F9;
	Tue, 10 May 2022 16:33:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D09E21BF3A3
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 16:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEE8081DA3
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 16:33:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RAOfrQkSnGKa for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 16:33:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DBC6819FC
 for <buildroot@buildroot.org>; Tue, 10 May 2022 16:33:00 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id c11so24561281wrn.8
 for <buildroot@buildroot.org>; Tue, 10 May 2022 09:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=31mhH1F7vhJoh96KyG9/tFqMj31UlBZY/NctpUbqMck=;
 b=SfTmZsmymi/nldyKw5nGUiwglnrFGVfzC6QKOzdWIGUqZdijuLoqinYxzgYMpFl4oS
 L6MQqGhEVYyW5s4xN6qa2bhNkMLXFG2M1zqVLijcUyMTAp/FwML2lonDQm+V2bWSv0o8
 LdE6nGxDJjB+1KUG5A4hTpgFLtQ1BKgNk2KNQJ4f/Y0/JP44XUzKEKRXgIslgIoemwl/
 Uo+PwcbwZrSbueJWZs4mzQnQ9a7Wj4NTc8ol6Aw0XEIDMT/0nWc2YitYwl4g3w7WdZq5
 mkEG5QsG7jziahyp3zv8OnueYWLojhc386Fy4BdNXvD2Yj/Kvv3yEOgLtkQbAuXGQbh1
 XDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=31mhH1F7vhJoh96KyG9/tFqMj31UlBZY/NctpUbqMck=;
 b=fdB4C3A4rAuDBHUuzDcdbfqW30SCN/aXZI+K8lMKMXUVCnNGmAscZpQXiuyi/6fp+P
 BFcQSskfXmWgqmqADOPMOf5pBJCmhVovd/t/zQZbyPFx4JMX+6EkceWxKdoulDMrdT2s
 GH/pZMuIfyqw7xXkx9PddRfoLhTo27DG/O/GCjiRr+Dm2c2zYmjOWslJm9OXB/bdtSVm
 giiNthhOJ1c9ldVtGRLwZLYN9OfnAZWFf0SoPm9D/JH1TEvOW0gxLVfG77NmUE2e4Aj3
 mO77HtUovUQFRF0c5/FkzIc6K4n8pOVjfwbhUxvkZCj5xAAOd0tQpgWioXfKSLSLwTkw
 crcg==
X-Gm-Message-State: AOAM5324oqqpnNQilfv03ez/XUqNefCzEPCOgwe1bwbvt6ciWrmbxZN4
 3AFEYYvncRiRWz1u4Gf7OtSh1YkN+/k=
X-Google-Smtp-Source: ABdhPJyC+u0GJUFqOHoSt7dv4JHLBZAxG9r4dk8pGzslDmB213jEA7yvgFeuTx5SMdiojHLnLNwE7g==
X-Received: by 2002:a05:6000:1786:b0:20c:6063:5014 with SMTP id
 e6-20020a056000178600b0020c60635014mr19669195wrg.251.1652200379208; 
 Tue, 10 May 2022 09:32:59 -0700 (PDT)
Received: from dell5510.arch.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 l29-20020a05600c1d1d00b003942a244f53sm3260126wms.44.2022.05.10.09.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 09:32:58 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 10 May 2022 18:32:47 +0200
Message-Id: <20220510163249.21272-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2] musl 1.2.3
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

tested local build with LTP, iproute2 and iputils.

Added a single fix which is IMHO worth of backporting.

Kind regards,
Petr

Petr Vorel (2):
  package/musl: bump version to 1.2.3
  musl: backport netlink macro fix

 ...rameter-name-in-internal-netlink.h-R.patch | 33 +++++++++++++++++++
 package/musl/musl.hash                        |  4 +--
 package/musl/musl.mk                          |  2 +-
 3 files changed, 36 insertions(+), 3 deletions(-)
 create mode 100644 dl/musl/0001-fix-incorrect-parameter-name-in-internal-netlink.h-R.patch

-- 
2.36.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
