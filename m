Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2730EC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 13:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDA0284364;
	Sat,  8 Jun 2024 13:06:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ErvODCtTaZhF; Sat,  8 Jun 2024 13:06:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBB348436D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBB348436D;
	Sat,  8 Jun 2024 13:06:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 294AC1BF41A
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 13:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23544400D8
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 13:06:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U_ZLP-K0kvOs for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 13:06:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7BB9C40119
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BB9C40119
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BB9C40119
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 13:06:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65CD560003;
 Sat,  8 Jun 2024 13:06:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFvmG-001jc6-2j;
 Sat, 08 Jun 2024 15:06:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20240517142732.5B32A87422@busybox.osuosl.org>
Date: Sat, 08 Jun 2024 15:06:36 +0200
In-Reply-To: <20240517142732.5B32A87422@busybox.osuosl.org> (Yann E. MORIN's
 message of "Fri, 17 May 2024 16:23:06 +0200")
Message-ID: <871q5760tf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] package/ruby: build host-ruby with
 yaml support
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=95093854e4c6ce69ee54df17fce20417312a3d0a
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > webkitgtk/wpewebkit needs a host-ruby with yaml support, otherwise the build
 > fails with errors like:

 > cd /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/Source/WebCore && \
 >   /home/peko/source/buildroot/output/host/bin/ruby \
 >     /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/Source/WebCore/Scripts/GenerateSettings.rb \
 >     --outputDir /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/WebCore/DerivedSources \
 >     --template /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/Source/WebCore/Scripts/SettingsTemplates/InternalSettingsGenerated.cpp.erb \
 >     --template /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/Source/WebCore/Scripts/SettingsTemplates/InternalSettingsGenerated.idl.erb \
 >     --template /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/Source/WebCore/Scripts/SettingsTemplates/InternalSettingsGenerated.h.erb \
 >     --template /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/Source/WebCore/Scripts/SettingsTemplates/Settings.cpp.erb \
 >     --template /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/Source/WebCore/Scripts/SettingsTemplates/Settings.h.erb \
 >     /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/WTF/Scripts/Preferences/UnifiedWebPreferences.yaml \
 >     /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/Source/WebCore/page/Settings.yaml
 > /home/peko/source/buildroot/output/host/lib/ruby/3.3.0/yaml.rb:3: warning: It seems your ruby installation is missing psych (for YAML output).
 > To eliminate this warning, please install libyaml and reinstall your ruby.

 > We do not currently have any Config.in.host options for ruby or libyaml, but
 > given how small/fast libyaml is to build just do it unconditionally.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
