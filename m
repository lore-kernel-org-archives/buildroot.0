Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2719C433EF
	for <buildroot@archiver.kernel.org>; Wed, 24 Nov 2021 20:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DF76400D4;
	Wed, 24 Nov 2021 20:13:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g1QNUyfcisYh; Wed, 24 Nov 2021 20:13:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69A8C400EF;
	Wed, 24 Nov 2021 20:13:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A25851BF616
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 20:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 907E4400EF
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 20:13:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H98R2bw7hYXT for <buildroot@lists.busybox.net>;
 Wed, 24 Nov 2021 20:12:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 103BF400D4
 for <buildroot@buildroot.org>; Wed, 24 Nov 2021 20:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1637784776;
 bh=9T2XN751o8Y4A8NMOnelTycslh3H3Yhaqh4nDt+roDM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Y7bVcqeufW/G3+FoEEdBU5E7vWRjMldWMGdpdjp3XBPRz9wMabLf7BjDdGmGILLLv
 d31JbhWWsNaxKbw12maieuad+nMK8PK/P01Pq3vE0HqjlDPuhMOuDWBOngjBbTKGFE
 vhiMl7EDV8Z3Yt/IuWl9cUdtW1/UmaxgK3R97ySA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.142]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M4s51-1mobK43q5P-0023cW; Wed, 24 Nov 2021 21:12:56 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 24 Nov 2021 21:12:55 +0100
Message-Id: <20211124201255.6736-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:V+xku6lFNRx2EIoAGHfNNxfzEHvmP6QEAiwmQ3pTyxh9cHvkAAI
 iEy0IIPhbdJciAaVcWKr+s0GG94HUNCq57WZrkkJnO72P76rR4J41K0PymNFutN5YsHa4Hh
 Kn6x7O0xoBV8V+d2Lvv6BtJIhviL5Ud3LGtkfznKbRvB2NFgv5Y3EsHJMw8or5vrQkuG/7Z
 ewvpzF3eyO352pEJsVjUA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ejm/1TuYHjw=:kr3HeVN+koony+JijKDZsR
 gz+V3g4RIpgYTS1AcaxSMLRkGAPkeeibs8DpjrmA52BcmwSosXZMpIq6rXUipO07pg6LuCIb6
 HPnDqWA9UpiDhqWRXOvUuXASMCF+mmZSxdkUj74pBwYtqUIXfllfSRNMFwt4CBtxm+UXLHhrM
 olncpmCz7QCvlYThivg6EMqcRU+kDA3Ecvu774cQgQkS8Hs03jkixfbnkm4/IYnL4NnZJxxZq
 ynWp0DQia0TYlMLy8/yJN905AbymJi1sLu+GznX1EPJGdF7uV2fyMQVmmG8sIJf3ImwhnaG2b
 8I2HLwXHtXc1IWZw8/B68wtJtalHnp5lJMggWMx2Q6yEGTXN/a9OhiP13dZOcQjt/Dt6zjr9K
 R0hs9pyTOfCFcSpmN31w8dQK5CVvlQ4hWHtqPCgWvkClHHAWsKMJlS0GHSikjiL+sqpA6WLZy
 6jtGGcyZpifBJcf6nMn6sL4RAO++E2qSxVA2rb4bCOLF1gK6CQpMze0IgLa5c5UKj2FDqNreo
 EH0QOGxDgB8JrCzz4JCPtGmY4iECRDmLYQXd3MQz9T1wBvjkjSplFWXrmZyNFuagTF9TT9t1c
 l5pkB0eSTTx8Y8J/qyFeakZn7ktaNc+yXv4POS+9E3Jt7CXuIoNYcTjeUYHFw+IlYeB87L6dr
 BH7eyjhsj7lfSOhawcAq4oI5uh6U/9GLyZwB4fbgxmIfjf87VpmaRFcNvRRJ4y9kYsizAUgR0
 BmxnA6EhGclQo7p18ewgD/wpPUZNE0reGf37nlzBK5JoIONym+78ZOlfkSrS9djBvyROFXKpJ
 ypZkQQEDJwFO6eUK32Y22XkoK0TStSv/TylHhstr7vQrNu8JgOFh6uOIrktjgclvhlIZ7B7n0
 acdOvAw6DhFxjoOCOs4bXHBtdBmQ4383xucHQnW/libL2BfaSoj6HT1u1ybcEyS7rT3uOr7yp
 vXBli/8YZWAo2vxjiyBbecunHEc9DkHzR4tA/DdcL2GL9SCMs7rNj5gbBlB3jMWLc1mtIo0wK
 s2rlt9OnEI0pUa4NWUtCI15O+M6w+MCXJXkLcw4z7LSR/aECaDVEClgOilQJ/hP2YfPGVRmJR
 8s65Mc/Q1jin5c=
Subject: [Buildroot] [PATCH/next v1] package/libv4l: fix typeof realated
 compile failure
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In case Qt support is enabled use '-std=gnu++11' instead of '-std=c++11' to
enable c++11 support and gain support of the typeof GNU extension.

Fixes:

  - http://autobuild.buildroot.net/results/2d58906a1eefdf921b42f6c0d9fd680ef2ad6e27

  In file included from v4l2-ctl-streaming.cpp:14:
  ../../utils/common/v4l2-tpg.h: In function 'void tpg_s_hue(tpg_data*, s16)':
  ../../utils/common/v4l2-tpg.h:49:2: error: 'typeof' was not declared in this scope
     49 |  typeof(val) __val = (val);  \
        |  ^~~~~~

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libv4l/libv4l.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index b11c8975d1..4dc0f15f94 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -71,8 +71,8 @@ LIBV4L_CONF_ENV += \
 	ac_cv_prog_MOC=$(HOST_DIR)/bin/moc \
 	ac_cv_prog_RCC=$(HOST_DIR)/bin/rcc \
 	ac_cv_prog_UIC=$(HOST_DIR)/bin/uic
-# qt5 needs c++11 (since qt-5.7)
-LIBV4L_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+# qt5 needs c++11 (since qt-5.7)/use gnu++11 for typeof support
+LIBV4L_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=gnu++11"
 else
 LIBV4L_CONF_OPTS += --disable-qv4l2
 endif
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
