Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DE0C02198
	for <buildroot@archiver.kernel.org>; Thu,  6 Feb 2025 07:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE888611C2;
	Thu,  6 Feb 2025 07:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CuEf3bnGCYSM; Thu,  6 Feb 2025 07:23:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9534611AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9534611AD;
	Thu,  6 Feb 2025 07:23:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 336EEE1
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 07:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 232AE40284
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 07:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKvQaUn1c8Cg for <buildroot@buildroot.org>;
 Thu,  6 Feb 2025 07:23:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B58D141343
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B58D141343
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B58D141343
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 07:23:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF235441E6;
 Thu,  6 Feb 2025 07:23:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tfwET-002qLx-0G;
 Thu, 06 Feb 2025 08:23:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu,  6 Feb 2025 08:23:19 +0100
Message-Id: <20250206072321.677851-3-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250206072321.677851-1-peter@korsgaard.com>
References: <20250206072321.677851-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvheejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepvdfhhfeghfeiudejieevjeevjeekleefudevkeeujedujeetjeevveeihfekvedunecuffhomhgrihhnpehgnhhurdhorhhgnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghkoheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 3/4] support/docker: add tar 1.35
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

Since commit b11956fb6690 ("support/dependencies: require tar >= 1.35"),
Buildroot will build host-tar if the host does not have >= 1.35 available,
so add it to the container to save build time.

Debian 12 only provides tar 1.34.  Tar 1.35 is available in testing - But
that then depends on a newer glibc, so instead build it from source using
the --disable-year2038 flag like we do for host-tar and install it into
/usr/local/bin so it shadows the Debian one.

This step runs as root (and needs to for make install), so add
FORCE_UNSAFE_CONFIGURE=1 as otherwise the configure script errors out.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/docker/Dockerfile | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index f6d3978f9b..e5e45d5a6f 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -12,6 +12,9 @@ LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
       vendor="Buildroot" \
 description="Container with everything needed to run Buildroot"
 
+# We need tar >= 1.35
+ARG TAR_VERSION="1.35"
+
 # Setup environment
 ENV DEBIAN_FRONTEND noninteractive
 
@@ -56,6 +59,16 @@ RUN apt-get -o APT::Retries=3 install -y --no-install-recommends \
     apt-get -y autoremove && \
     apt-get -y clean
 
+# Build host-tar
+RUN curl -sfL https://ftpmirror.gnu.org/tar/tar-${TAR_VERSION}.tar.xz | \
+    tar -Jx -C /tmp && \
+    cd /tmp/tar-${TAR_VERSION} && \
+    FORCE_UNSAFE_CONFIGURE=1 ./configure \
+        --disable-year2028 && \
+    make && \
+    make install && \
+    rm -rf /tmp/tar-${TAR_VERSION}
+
 # To be able to generate a toolchain with locales, enable one UTF-8 locale
 RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen && \
     /usr/sbin/locale-gen
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
