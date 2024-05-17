Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F089C25B79
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 14:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3F67822EC;
	Fri, 17 May 2024 14:27:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lwKSG5V3qQGD; Fri, 17 May 2024 14:27:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1834822ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1834822ED;
	Fri, 17 May 2024 14:27:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 485531BF2B6
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 14:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41C4540514
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 14:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ReBD2qMfJtWm for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 14:27:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70D8D40025
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70D8D40025
 for <buildroot@buildroot.org>; Fri, 17 May 2024 14:27:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B32A87422; Fri, 17 May 2024 14:27:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 17 May 2024 16:23:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 932b52fad87d79d9f26a343edafe2981079de16e
X-Git-Newrev: 95093854e4c6ce69ee54df17fce20417312a3d0a
X-Patchwork-Hint: ignore
Message-Id: <20240517142732.5B32A87422@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ruby: build host-ruby with yaml
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=95093854e4c6ce69ee54df17fce20417312a3d0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

webkitgtk/wpewebkit needs a host-ruby with yaml support, otherwise the build
fails with errors like:

cd /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/Source/WebCore && \
  /home/peko/source/buildroot/output/host/bin/ruby \
    /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/Source/WebCore/Scripts/GenerateSettings.rb \
    --outputDir /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/WebCore/DerivedSources \
    --template /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/Source/WebCore/Scripts/SettingsTemplates/InternalSettingsGenerated.cpp.erb \
    --template /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/Source/WebCore/Scripts/SettingsTemplates/InternalSettingsGenerated.idl.erb \
    --template /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/Source/WebCore/Scripts/SettingsTemplates/InternalSettingsGenerated.h.erb \
    --template /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/Source/WebCore/Scripts/SettingsTemplates/Settings.cpp.erb \
    --template /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/Source/WebCore/Scripts/SettingsTemplates/Settings.h.erb \
    /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/WTF/Scripts/Preferences/UnifiedWebPreferences.yaml \
    /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/Source/WebCore/page/Settings.yaml
/home/peko/source/buildroot/output/host/lib/ruby/3.3.0/yaml.rb:3: warning: It seems your ruby installation is missing psych (for YAML output).
To eliminate this warning, please install libyaml and reinstall your ruby.

We do not currently have any Config.in.host options for ruby or libyaml, but
given how small/fast libyaml is to build just do it unconditionally.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ruby/ruby.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 4b9ce80e67..00fa0e0f65 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -20,7 +20,7 @@ RUBY_LICENSE_FILES = LEGAL COPYING BSDL
 RUBY_CPE_ID_VENDOR = ruby-lang
 
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
-HOST_RUBY_DEPENDENCIES = host-pkgconf host-openssl
+HOST_RUBY_DEPENDENCIES = host-libyaml host-pkgconf host-openssl
 RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
 RUBY_CONF_OPTS = \
 	--disable-install-doc \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
