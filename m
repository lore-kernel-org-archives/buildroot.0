Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F63C0015E
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 13:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67CB060071;
	Tue,  1 Aug 2023 13:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67CB060071
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E_tWRxXzZRNr; Tue,  1 Aug 2023 13:19:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9273E605A6;
	Tue,  1 Aug 2023 13:19:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9273E605A6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1928E1BF31D
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 13:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10F2340471
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 13:18:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10F2340471
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PExSX6jlwI5K for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 13:18:34 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 949C840374
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 13:18:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 949C840374
Received: from unknown (HELO opfedv1rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 15:11:21 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Aug 2023 15:11:21 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 15:11:20 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 01 Aug 2023 15:11:19 +0200
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.01,247,1684792800"; d="scan'208";a="22643009"
To: <buildroot@buildroot.org>
Date: Tue, 1 Aug 2023 15:11:16 +0200
Message-ID: <e15f8b87f4c1895832f8ff549bca8cc39d7a5032.1690895462.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690895462.git.yann.morin@orange.com>
References: <cover.1690895462.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX207.corporate.adroot.infra.ftgroup (10.115.27.8)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1690895913; x=1722431913;
 h=to:cc:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:from;
 bh=kitA/wWjQJeRxyQE0ZzXB/KAYD94Yd/ZDD2VpnLZWRA=;
 b=J9mhOj0yj0zlR2Z2tAR8EgD1RAEYJ/UZ9hIuX9NCVgYW2vojscY4Xd5z
 nTg7cmjlNlaW9nyJeErhUNFZRa39+/KGrMQU2n28tpacv3cR2wYzDMn5c
 IXaXWzJwFhOUDwv5CGr5hAL4wMW7fgf55qtPkLRfilpduvWXJjI5orqFd
 OlH53bEFcQMTOJZ7Asr4WkCR7ymdTSZ3FSWJ5MqtpQ63qpHlT0rE8bn9s
 aYTY+IBwR1U7xbktq0rfyGrioPvLTEYBoDvt4Y/TW/C5KlR2HnkzlyZA6
 UlWxBaEWZFZm+eF5ZHj9npEisgZFyJ5SmefFSOBGGLIYnyDXsh9mf+QC5
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=J9mhOj0y
Subject: [Buildroot] [PATCH 2/3 v2] support/download: use svn credentials to
 retrieve revision date
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
Cc: yann.morin@orange.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When an svn repository requires credentials, and they are passed
in _DL_OPTS, they must be used also to retrieve the revision date.

One could argue that credentials should not be handled in _DL_OPTS, but
rather that they be fed through other means (e.g. by pre-authenticating
manually once in an interactive session, or by filling them in the usual
~/svn/auth/* mechanisms for a CI).

However, some public facing repositories are using authentication, even
though the credentials are public. This is the case for example for:
    http://software.rtcm-ntrip.org/

In such a case, it does make sense to pass credentials via _DL_OPTS,
because they are not really, even really not, secret.

Another use-case (e.g. for a CI) is to pass the credentials as
environment variables, with _DL_OPTS not hard-coded in the .mk file.

However, _DL_OPTS may contain options that are not valid for 'svn info',
as they are meant to be passed to 'svn export' in the first place. Since
the only options common to 'svn info' and 'svn export' are the
credentials, we just extract those and pass them to 'svn info'.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 support/download/svn | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/support/download/svn b/support/download/svn
index d9325b7478..3e08a0ef36 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -54,12 +54,28 @@ _plain_svn() {
 
 _svn export --ignore-keywords ${quiet} "${@}" "'${uri}@${rev}'" "'${basename}'"
 
+# For 'svn info', we only need the credentials, if any; other options
+# would be invalid, as they are intended for 'svn export'.
+# We can also consume the positional parameters, as we'll no longer
+# be calling any other remote-reaching svn command.
+creds=
+while [ ${#} -gt 0 ]; do
+    case "${1}" in
+    --username=*)   creds+=" ${1}"; shift;;
+    --password=*)   creds+=" ${1}"; shift;;
+    --username)     creds+=" ${1} ${2}"; shift 2;;
+    --password)     creds+=" ${1} ${2}"; shift 2;;
+    *)              shift;;
+    esac
+done
+
 # Get the date of the revision, to generate reproducible archives.
 # The output format is YYYY-MM-DDTHH:MM:SS.mmmuuuZ (i.e. always in the
 # UTC timezone), which we can feed as-is to the --mtime option for tar.
 # In case there is a redirection (e.g. http -> https), just keep the
 # last line (svn outputs everything on stdout)
-date="$( _plain_svn info "'${uri}@${rev}'" \
+# shellcheck disable=SC2086 # creds may be empty
+date="$( _plain_svn info ${creds} "'${uri}@${rev}'" \
         |sed -r -e '/^Last Changed Date: /!d; s///'
        )"
 
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
