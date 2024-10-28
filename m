Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CEAD339A8
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 17:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 696DC81146;
	Mon, 28 Oct 2024 17:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XaNZBQTu-Y5W; Mon, 28 Oct 2024 17:30:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED01E81133
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED01E81133;
	Mon, 28 Oct 2024 17:30:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3727B112A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 17:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1734B4042F
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 17:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I1n6e3KxFkRQ for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 17:30:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 304774017F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 304774017F
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 304774017F
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 17:30:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.46]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MXGrE-1tNbLd18pC-00TUIp; Mon, 28
 Oct 2024 18:29:59 +0100
To: buildroot@buildroot.org
Cc: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Mon, 28 Oct 2024 18:29:43 +0100
Message-ID: <20241028172943.2147885-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:6RhH21rJOhTlaSCqyowaJce+UtLMc8yoiU3Z84TGEoizdomHQ0i
 XI/pOOPgT5Cx9CTclo/oCRVXa1k1wg++os05b4r4/F5zGe7GuPeUGK1WFXvdb9Fgyy0Oa5p
 zIp/IVVBDOLxsbsdi2960nZZhESXAqUP5/RQSHJ/o6+kpc94899uHCK31SOrTwyNAGMQQmI
 d7T9SBAPBtI0pQWSgQO2Q==
UI-OutboundReport: notjunk:1;M01:P0:mmjF3jLwNcg=;xwCcCymtDqF4dSEjsYIzNIzWTqQ
 3iQyPCjR8PuGATsC2TSmQEW/iheGlTSwxttqHb24t3kARl1BablbvojnX5G7Uu/6CX7tfd6ln
 Wwl8Z0lbCHbZdc7Lh6/7uCpO2WstPBPX6jEgb2oTdNOSwaxsmzxf2LD3dcN6b4aM3SZim4VqL
 nsA8JKr0j9AQaQeAkToj2EFSgS19OipVuO9W0DaHeYM4bffL72O+0hXsmN2y7irbZtfXi5GqS
 6ZFSxWVqbkRS/i3su4SoB/nYGkvrm1MU2otwB4xd5SSql/y+Nc+bGbc3sADqtqMleAzVoiFIy
 LrnxYbP4GeWiFToMsDIETWJ1VN3cfPzxadAbFj03EfdRE4O1QXQnOceMEpSERxRkfjWfAVtVI
 PwSkOyNjIvhdh5AZj95YiEZE6VhPFhuJv4zJFunmpZV3z3+GGbc1NNax9Jk9fkgJQLxY+KysB
 lYa/jSeyjePaMsMvM3tj/Xze+TBjgpUhH0GO6HJuXQWvBv1XAKDK0mr58gSGQJVHtETso11fd
 JovqKTwWFmklExjC8fyJe+Zu+LFJg3mAjCOr7iHY3O3mp739WvEWip8pIdJwXPGkRsm0sdOeR
 sz8/LdXEXUsIRRq6cckFsaXNewylUn+rJrri89fJ32BllIQ+7wpiET6J++ELbb9p/NdpOqSom
 WEHTCS+L0KUGIz/n2vm6qeZwh2ypzSGyDLjLpoGEFdNziYelrTeAU8SBa04L+4Kc5DY3BWE+g
 4Rp8ZvMAKk5SL2U4H47oLCmYpnQ2ZWCYlNy1X91542S96R2VfUDCHKOT9PAUWYIx3a55Brkg5
 zZS1yTYF5WPvD4KJWrq3j3Yw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1730136599; x=1730741399; i=fiona.klute@gmx.de;
 bh=4z1G0p1SF9pvXSGVtxQ680V/Gigrou7q6n8pD6XwavM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=QVYrcAEOi9GeMIdvMrH8MNbXCa661ZmUQRZUTUdP6qzbf5RiI0xfg2UvlpNt2aEy
 maME+oPE7UgHzq77vIdaJI+2ajt6msYgS/p2uHnWsHVxwYrY79Np1a6Slt2oabT1G
 fDFwxcHSsQt2HvpI577MTEeaQNpCdc1/B+/PU9dmcq6/Z1bzmYcHyBsWLAJvFABkR
 Y1ojTsKYmwOUhkT2O5ZtCe/wh3QA76pCcFxPTFJQOt1pruepoiqqAoHZa401IdVfo
 znfAMwzs7CqAkFxzpkSIUk937u3XEYZRhGcq1u+ACRtmKsO8cnW1b2Z/atG3HfDcr
 ovLTDIofi8XJ1cYQtA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=QVYrcAEO
Subject: [Buildroot] [PATCH 1/1] docs/manual/adding-packages-directory:
 describe start script details
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This codifies style elements discussed on the mailing list, most
importantly PID file handling, and adds detailed considerations for
writing start scripts.

References:
https://lore.kernel.org/buildroot/20240712124956.3925574-1-fiona.klute@gmx.de/
https://lore.kernel.org/buildroot/20240714223645.39adf8c6@windsurf/
https://lore.kernel.org/buildroot/9ec13ac0-b5b6-4251-98b8-0d8f7adac452@gmx.de/

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 docs/manual/adding-packages-directory.adoc | 123 ++++++++++++++++++---
 1 file changed, 110 insertions(+), 13 deletions(-)

diff --git a/docs/manual/adding-packages-directory.adoc b/docs/manual/adding-packages-directory.adoc
index cb19f3bac9..e6eea5a5f7 100644
--- a/docs/manual/adding-packages-directory.adoc
+++ b/docs/manual/adding-packages-directory.adoc
@@ -576,23 +576,120 @@ name.  The +NN+ is the start order number which needs to be carefully
 chosen.  For example, a program that requires networking to be up should
 not start before +S40network+.  The scripts are started in alphabetical
 order, so +S01syslogd+ starts before +S01watchdogd+, and +S02sysctl+
-start thereafter.
+starts thereafter.

 [source,sh]
 ----
 include::S01syslogd[]
 ----

-*Note:* programs that support reloading their configuration in some
-fashion (+SIGHUP+) should provide a +reload()+ function similar to
+Scripts should use long form options where possible for clarity.
+
+==== Start script configuration
+
+Both start scripts and unit files can source command line arguments
+from +/etc/default/foo+, where +foo+ is the daemon name as set in the
++DAEMON+ variable. In general, if such a file does not exist it should
+not block the start of the daemon, unless there is some site specific
+command line argument the daemon requires to start. For start scripts
++FOO_ARGS="-s -o -m -e -args"+ can be defined to a default value in
+the script, and the user can override this from +/etc/default/foo+.
+
+==== Handling the PID file
+
+A PID file is needed to keep track of what the main process of a
+service is. How to handle it depends on whether the service creates
+its own PID file, and if it deletes it on shutdown.
+
+* If your service doesn't create its own PID file, invoke the daemon
+  in foreground mode, and use +start-stop-daemon --make-pidfile
+  --background+ to let +start-stop-daemon+ create the PID file. See
+  +S01syslogd+ for example:
++
+[source,sh]
+----
+start-stop-daemon --start --background --make-pidfile \
+	--pidfile "$PIDFILE" --exec "/sbin/$DAEMON" \
+	-- -n $SYSLOGD_ARGS
+----
+
+* If your service creates its own PID file, pass the +--pidfile+
+  option to both +start-stop-daemon+ *and the daemon itself* (or set
+  it appropriately in a configuration file, depending on what the
+  daemon supports) so they agree on where the PID file is. See
+  +S45NetworkManager+ for example:
++
+[source,sh]
+----
+start-stop-daemon --start --pidfile "$PIDFILE" \
+	--exec "/usr/sbin/$DAEMON" \
+	-- --pid-file="$PIDFILE" $NETWORKMANAGER_ARGS
+----
+
+* If your service removes its PID file on shutdown, use a loop testing
+  that the PID file has disappeared on stop, see +S45NetworkManager+
+  for example:
++
+[source,sh]
+----
+while [ -f "$PIDFILE" ]; do
+	sleep 0.1
+done
+----
+
+* If your service doesn't remove its PID file on shutdown, use a loop
+  with +start-stop-daemon+ checking if the service is still running,
+  and delete the PID file after the process is gone. See +S01syslogd+
+  for example:
++
+[source,sh]
+----
+while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+	--exec "/sbin/$DAEMON"; do
+	sleep 0.1
+done
+rm -f "$PIDFILE"
+----
++
+Note the +--test+ flag, which tells +start-stop-daemon+ to not
+actually stop the service, but test if it would be possible to, which
+fails if the service is not running.
+
+==== Stopping the service
+
+The stop function should check that the daemon process is actually
+gone before returning, otherwise restart might fail because the new
+instance is started before the old one has actually stopped. How to do
+that depends on how the PID file for the service is handled (see
+above). It is recommended to always append +--exec "/sbin/$DAEMON"+ to
+all +start-stop-daemon+ commands to ensure signals are set to a PID
+that matches +$DAEMON+.
+
+==== Reloading service configuration
+
+Programs that support reloading their configuration in some fashion
+(e.g. +SIGHUP+) should provide a +reload()+ function similar to
 +stop()+. The +start-stop-daemon+ command supports +--stop --signal
-HUP+ for this. It is recommended to always append +--exec
-"/sbin/$DAEMON"+ to all +start-stop-daemon+ commands to ensure signals
-are set to a PID that matches +$DAEMON+.
-
-Both start scripts and unit files can source command line arguments from
-+/etc/default/foo+, in general, if such a file does not exist it should
-not block the start of the daemon, unless there is some site specirfic
-command line argument the daemon requires to start.  For start scripts a
-+FOO_ARGS="-s -o -m -e -args"+ can be defined to a default value in and
-the user can override this from +/etc/default/foo+.
+HUP+ for this. When sending signals this way, whether SIGHUP or
+others, make sure to use the symbolic names and not signal
+numbers. Signal numbers can vary between CPU architectures, and names
+are also easier to read.
+
+==== Return codes
+
+The action functions of the start script should return a success (or
+failure) code, usually the return code of the relevant
+start-stop-daemon action. The last one of those should be the return
+code of the start script as a whole, to allow automatically checking
+for success, e.g. when calling the start script from other
+scripts. Note that without an explicit +return+ the return code of the
+last command in a script or function becomes its return code, so an
+explicit return is not always necessary.
+
+==== Logging
+
+When a service forks to the background, or +start-stop-daemon
+--background+ does that, stdout and stderr are generally closed, and
+anything log messages the service may write there get lost. If
+possible, configure your service to log to syslog (preferably), or a
+dedicated log file.
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
