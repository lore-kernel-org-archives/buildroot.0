Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E743ECAAD3
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 18:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E77241774;
	Sun, 11 Sep 2022 18:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E77241774
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yf5mu_1OAoP5; Sun, 11 Sep 2022 18:16:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72F8F417AF;
	Sun, 11 Sep 2022 18:16:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72F8F417AF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE2A71BF3EB
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 18:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9980E84540
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 18:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9980E84540
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K4OeZKL0dUCu for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 18:16:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D58BE844A1
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 18:16:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D58BE844A1
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C13A283671; Sun, 11 Sep 2022 18:16:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 20:15:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be914b97ad6c7bb0951c879fc2d7fb8cf122de6a
X-Git-Newrev: 4ac4aa795ab8b6081f5fc1af3b1243c33cf28bc3
X-Patchwork-Hint: ignore
Message-Id: <20220911181621.C13A283671@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luarocks: use two spaces
 indentation in hash file
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4ac4aa795ab8b6081f5fc1af3b1243c33cf28bc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/luarocks/buildroot.lua | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luarocks/buildroot.lua b/package/luarocks/buildroot.lua
index 2d160f02b6..3c044d89b5 100644
--- a/package/luarocks/buildroot.lua
+++ b/package/luarocks/buildroot.lua
@@ -265,10 +265,10 @@ local function generate_hash (rockspec, lcname, rock_file, licenses, digest)
    local f = assert(io.open(fname, 'w'))
    util.printout('write ' .. fname)
    f:write('# computed by luarocks/buildroot\n')
-   f:write('sha256 ' .. digest[rock_file] .. '  ' .. rock_file .. '\n')
+   f:write('sha256  ' .. digest[rock_file] .. '  ' .. rock_file .. '\n')
    for i = 1, #licenses do
       local file = licenses[i]
-      f:write('sha256 ' .. digest[file] .. '  ' .. subdir .. '/' .. file .. '\n')
+      f:write('sha256  ' .. digest[file] .. '  ' .. subdir .. '/' .. file .. '\n')
    end
    f:close()
 end
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
