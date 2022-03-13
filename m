Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57954C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 16:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2F4E81496;
	Sun, 13 Mar 2022 16:50:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BwUjcVFUuBGN; Sun, 13 Mar 2022 16:50:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D60E81456;
	Sun, 13 Mar 2022 16:50:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 889E91BF300
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 16:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 721886077D
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 16:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ooOC_Tagy4K for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 16:50:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA50F60709
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 16:50:32 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id c23so15658189ioi.4
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 09:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hi/5zy8vJqpqfPiMDkaV0SIFoEqIkRFSWsq4/Zg0/pg=;
 b=OTWssaYBqsEWynJXpzP9PhJCVPDtFpXg2o1TYR7QaDaKiRLtEjOmtuiWlkqtguMPcf
 izhMQXqftpBttIB4n1hHbhirAw8fqpn5ikzFMWGxbPefMKhPNIg7KRdftHx+boArlcEA
 5+dbYGxI6ZJrQOQIXVuCPT6nn/XQdCF78JyUsHZ+VbVSp3ZnsyL5sNkdRL//NDJyAeBQ
 d3cxQzO2DDEitcClo08PzaW9POOhZLNoVUrnUd8/FxV4TyRXqDGWJNlH+4zKhfoEdW84
 90q2LcQVvzzFNyCrLEgdnxUf5l85RXgxu3tHi2LpZ1u+pNNgAIZqXOFpx2oeHbJUqXtp
 A95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hi/5zy8vJqpqfPiMDkaV0SIFoEqIkRFSWsq4/Zg0/pg=;
 b=IgMJSO7LelfuXWIoR3TE8NDXkEI5WQ677hk227gzmmfsHT1FjSsnbYGom7B331Pa7U
 LiLzQ9tLwXB3SxQ/VFgob8/EeNGkXyLUGHIzyK6IPnRdORr73uiAGDk7kKTt0EQVOe+o
 j3N9ioHDVDy+0BVZgzaZrJdmFcwmUdotl7aE7GmxuTXf+/iSB1z6NpJM3ejml/yzKC53
 /QzzVcvW7aCyd93V6wvHfNZpE2bedR1SO8vZR6uSVB8Um+LWfILUq0GVsawN+QxWPNhz
 RsPOriJ/WW99BK6tGuAxFaSLAAw4iMwiNqLdM5yHX9xZbDi9Adxqa8kG56IQUJUmpiwx
 4otg==
X-Gm-Message-State: AOAM533rSPHVJl+yOoZgrSLEKgIMotoSfeQcyC3LM5ZkujnkjNf8IDoj
 PtdGdwll2btUTVzRU8eBLbqvmGz3BGA=
X-Google-Smtp-Source: ABdhPJyOnvqVsJpvMvbAI6mEgRzWwyLNq7o4Sz6R9qg0/XfvUR4atiHTYgs4ry+Of88pa7jTr9oJow==
X-Received: by 2002:a05:6638:358c:b0:318:c544:1d with SMTP id
 v12-20020a056638358c00b00318c544001dmr17941088jal.86.1647190231667; 
 Sun, 13 Mar 2022 09:50:31 -0700 (PDT)
Received: from james-x399.localdomain (97-118-243-247.hlrn.qwest.net.
 [97.118.243.247]) by smtp.gmail.com with ESMTPSA id
 b12-20020a6be70c000000b00648f61d9652sm552609ioh.52.2022.03.13.09.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Mar 2022 09:50:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 10:50:30 -0600
Message-Id: <20220313165030.269338-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] utils/scanpypi: support alternative
 Homepage format
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some packages only have a home page properly set inside project_urls.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 utils/scanpypi | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 17d8a0017a..681758a552 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -609,7 +609,8 @@ class BuildrootPackage():
 
         lines.append('\thelp\n')
 
-        help_lines = textwrap.wrap(self.metadata['info']['summary'], 62,
+        md_info = self.metadata['info']
+        help_lines = textwrap.wrap(md_info['summary'], 62,
                                    initial_indent='\t  ',
                                    subsequent_indent='\t  ')
 
@@ -617,11 +618,17 @@ class BuildrootPackage():
         if help_lines[-1][-1] != '.':
             help_lines[-1] += '.'
 
-        # \t + two spaces is 3 char long
-        help_lines.append('')
-        help_lines.append('\t  ' + self.metadata['info']['home_page'])
-        help_lines = [x + '\n' for x in help_lines]
-        lines += help_lines
+        home_page = md_info.get('home_page', None)
+        if home_page is None or len(home_page) == 0:
+            project_urls = md_info.get('project_urls', {})
+            home_page = project_urls.get('Homepage', None)
+
+        if home_page is not None and len(home_page) != 0:
+            # \t + two spaces is 3 char long
+            help_lines.append('')
+            help_lines.append('\t  ' + home_page)
+            help_lines = [x + '\n' for x in help_lines]
+            lines += help_lines
 
         with open(path_to_config, 'w') as config_file:
             config_file.writelines(lines)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
