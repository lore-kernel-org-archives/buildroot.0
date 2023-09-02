Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE54FC001DB
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 22:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C10B81F82;
	Sat,  2 Sep 2023 22:01:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C10B81F82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2WPkSvAwiSlJ; Sat,  2 Sep 2023 22:01:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05F9181F84;
	Sat,  2 Sep 2023 22:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05F9181F84
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 225941BF3A4
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 22:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA0FF4017A
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 22:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA0FF4017A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rH-1DLy3vWeT for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 22:01:07 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24A8640144
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 22:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24A8640144
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8CB840008;
 Sat,  2 Sep 2023 22:01:02 +0000 (UTC)
Date: Sun, 3 Sep 2023 00:01:00 +0200
To: nvd@nist.gov
Message-ID: <20230903000100.0c1b187b@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/bLosz/70q3yHrFBGQZSM.wS"
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693692063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=Pn/rPzG2bq4BoSKM0gB0NS3Z71yj6p5K+OOCl90JV+g=;
 b=j7vHfvBV5F0/mrIGk5b/fVHS265swkdwKn04eFYYTdSmW8DFeG5HhEw15hXrtFJOFMk1fo
 HTNM6gFwuwAnoMOSYE06huWxg0jR8gI2/rsVSgpEZuHlzEFCHyeNhlEnaLiz2HB56tyzbs
 KUlBayHq5Z8swTIEADFeFr6DUT8VI5s5vHBoGsKOeO/aW9qiYn/CkBlD+gwuKiLLPykune
 whLkuu/PE8q5StIWYQPwFe7nViudffX1MaLZi+8R9hhMgYpBLvn9MUCqMSbpcljK9bJhGd
 hmnQ5Ft9oEqUjZmGZTYxYZYT///yel0ye72NjJ6/B27P9uDjAgmz32+DJETwrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j7vHfvBV
Subject: [Buildroot] CVE-2018-11574 version range fix
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--MP_/bLosz/70q3yHrFBGQZSM.wS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

CVE-2018-11574 is marked in the NVD database as affecting all pppd
versions, as it has as its only "Configuration" the following CPE
identifier match:

  cpe:2.3:a:point-to-point_protocol_project:point-to-point_protocol:-:*:*:*:*:*:*:*

However, it turns out that the upstream pppd was *never* affected by
CVE-2018-11574. Let me walk through the story.

CVE-2018-11574 affects the EAP-TLS implementation in pppd. However,
EAP-TLS was not supported in upstream pppd before its 2.4.9 release,
thanks to commit
https://github.com/ppp-project/ppp/commit/e87fe1bbd37a1486c5223f110e9ce3ef75971f93.

Before that EAP-TLS support for pppd was provided as an out-of-tree
patch, provided by a third party developer at
https://jjkeijser.github.io/ppp/download.html. It is this patch that
was affected by CVE-2018-11574. As can be seen at
https://jjkeijser.github.io/ppp/download.html, all versions of the
patch prior to version 1.101 are affected, as 1.101 was precisely
released to fix CVE-2018-11574.

So: before pppd 2.4.9, the only way to be affected by CVE-2018-11574
was by having applied a third-party patch. I am not sure how to reflect
this correctly in the CVE-2018-11574 information in the NVD database.
To me, if one applies random patches to a code base, for sure those
patches can introduce additional security vulnerabilities, so it
doesn't make sense that CVE-2018-11574 is reported against pppd
upstream.

In addition, in the EAP-TLS code that was added in pppd 2.4.9, the
issue of CVE-2018-11574 is already fixed. Indeed, we did a diff between
the out-of-tree EAP-TLS patch in version 0.999 (affected) and 1.101
(not affected), which gives the attached file. And those fixes are
indeed present in commit
https://github.com/ppp-project/ppp/commit/e87fe1bbd37a1486c5223f110e9ce3ef75971f93,
which introduced EAP-TLS support in upstream pppd.

Therefore: upstream pppd was never affected by this issue. Prior to
pppd 2.4.9, there was no EAP-TLS support, and starting from 2.4.9, the
EAP-TLS is correct with regard to CVE-2018-11574.

At the very least, I would suggest to change the CVE-2018-11574
information to indicate that only versions up to (and excluding) 2.4.9
are affected. Do you think this would be possible ?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com

--MP_/bLosz/70q3yHrFBGQZSM.wS
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename=pppd-eap-tls-CVE-2018-11574-fix.patch

diff --git a/README.eap-tls b/README.eap-tls
index 037be0a..084b046 100644
--- a/README.eap-tls
+++ b/README.eap-tls
@@ -273,8 +273,14 @@ v0.995   (27-May-2014)
 v0.996   (28-May-2014)
  - Fix minor bug where SessionTicket message was printed as 'Unknown SSL3 code 4'
  - Add EAP-TLS-specific options to pppd.8 manual page.
- - Updated README.eap-tls file with new option and provide an example.
+ - Updated README.eap-tls file with new options and provide an example.
 v0.997   (19-Jun-2014)
- - change SSL_OP_NO_TICKETS to SSL_OP_NO_TICKET
- - fix bug in initialisation code with fragmented packets.
+ - Change SSL_OP_NO_TICKETS to SSL_OP_NO_TICKET
+ - Fix bug in initialisation code with fragmented packets.
+v0.998   (13-Mar-2015)
+ - Added fix for https://bugzilla.redhat.com/show_bug.cgi?id=1023620
+v0.999   (11-May-2017)
+ - Added support for OpenSSL 1.1: the code will now compile against OpenSSL 1.0.x or 1.1.x.
+v1.101 (1-Jun-2018)
+ - Fix vulnerabilities CVE-2018-11574.
 
diff --git a/pppd/eap-tls.c b/pppd/eap-tls.c
index 2c0766e..1b79abf 100644
--- a/pppd/eap-tls.c
+++ b/pppd/eap-tls.c
@@ -62,6 +62,7 @@ static ENGINE *pkey_engine = NULL;
  * tries to provide some guidance but ultimately falls short.
  */
 
+
 static void HMAC_CTX_free(HMAC_CTX *ctx)
 {
 	if (ctx != NULL) {
@@ -865,46 +866,47 @@ void eaptls_free_session(struct eaptls_session *ets)
 int eaptls_receive(struct eaptls_session *ets, u_char * inp, int len)
 {
 	u_char flags;
-	u_int tlslen;
+	u_int tlslen = 0;
 	u_char dummy[65536];
 
+	if (len < 1) {
+		warn("EAP-TLS: received no or invalid data");
+		return 1;
+	}
+		
 	GETCHAR(flags, inp);
 	len--;
 
-    if (flags & EAP_TLS_FLAGS_LI && !ets->data) {
- 
+    if (flags & EAP_TLS_FLAGS_LI && len >= 4) {
 		/*
-		 * This is the first packet of a message
+		 * LenghtIncluded flag set -> this is the first packet of a message
 		*/
- 
+
+		/*
+		 * the first 4 octets are the length of the EAP-TLS message
+		 */
 		GETLONG(tlslen, inp);
 		len -= 4;
 
-		if (tlslen > EAP_TLS_MAX_LEN) {
-			error("Error: tls message length > %d, truncated",
-				EAP_TLS_MAX_LEN);
-			tlslen = EAP_TLS_MAX_LEN;
-		}
+		if (!ets->data) {
 
-		/*
-		 * Allocate memory for the whole message
-		*/
-		ets->data = malloc(tlslen);
-		if (!ets->data)
-			fatal("EAP TLS: allocation error\n");
+			if (tlslen > EAP_TLS_MAX_LEN) {
+				error("EAP-TLS: TLS message length > %d, truncated", EAP_TLS_MAX_LEN);
+				tlslen = EAP_TLS_MAX_LEN;
+			}
 
-		ets->datalen = 0;
-		ets->tlslen = tlslen;
+			/*
+			 * Allocate memory for the whole message
+			*/
+			ets->data = malloc(tlslen);
+			if (!ets->data)
+				fatal("EAP-TLS: allocation error\n");
 
-	}
-	else if (flags & EAP_TLS_FLAGS_LI && ets->data) {
-		/*
-		 * Non first with LI (strange...)
-		*/
- 
-		GETLONG(tlslen, inp);
-		len -= 4;
- 
+			ets->datalen = 0;
+			ets->tlslen = tlslen;
+		}
+		else
+			warn("EAP-TLS: non-first LI packet? that's odd...");
 	}
 	else if (!ets->data) {
 		/*
@@ -913,7 +915,7 @@ int eaptls_receive(struct eaptls_session *ets, u_char * inp, int len)
  
 		ets->data = malloc(len);
 		if (!ets->data)
-			fatal("EAP TLS: allocation error\n");
+			fatal("EAP-TLS: allocation error\n");
  
 		ets->datalen = 0;
 		ets->tlslen = len;
@@ -924,8 +926,13 @@ int eaptls_receive(struct eaptls_session *ets, u_char * inp, int len)
 	else
 		ets->frag = 0;
 
+	if (len < 0) {
+		warn("EAP-TLS: received malformed data");
+		return 1;
+	}
+
 	if (len + ets->datalen > ets->tlslen) {
-		warn("EAP TLS: received data > TLS message length");
+		warn("EAP-TLS: received data > TLS message length");
 		return 1;
 	}
 
@@ -939,7 +946,7 @@ int eaptls_receive(struct eaptls_session *ets, u_char * inp, int len)
 		 */
 
 		if (ets->datalen != ets->tlslen) {
-			warn("EAP TLS: received data != TLS message length");
+			warn("EAP-TLS: received data != TLS message length");
 			return 1;
 		}
 
@@ -1200,7 +1207,6 @@ ssl_msg_callback(int write_p, int version, int content_type,
 
 	switch(content_type) {
 
-#if OPENSSL_VERSION_NUMBER >= 0x10100000L
 	case SSL3_RT_HEADER:
 		strcat(string, "SSL/TLS Header: ");
 		switch(hvers) {
@@ -1226,7 +1232,6 @@ ssl_msg_callback(int write_p, int version, int content_type,
 			strcat(string, "Unknown version");
 		}
 		break;
-#endif /* OPENSSL_VERSION_NUMBER >= 0x10100000L */
 
 	case SSL3_RT_ALERT:	
 		strcat(string, "Alert: ");	
diff --git a/pppd/eap.c b/pppd/eap.c
index 008801b..3ce8bde 100644
--- a/pppd/eap.c
+++ b/pppd/eap.c
@@ -1703,6 +1703,11 @@ int len;
 
 		case eapListen:
 
+			if (len < 1) {
+				error("EAP: received EAP-TLS Listen packet with no data");
+				/* Bogus request; wait for something real. */
+				return;
+			}
 			GETCHAR(flags, inp);
 			if(flags & EAP_TLS_FLAGS_START){
 
@@ -1740,6 +1745,11 @@ int len;
 			break;
 
 		case eapTlsRecv:
+			if (len < 1) {
+				error("EAP: discarding EAP-TLS Receive packet with no data");
+				/* Bogus request; wait for something real. */
+				return;
+			}
 			eaptls_receive(ets, inp, len);
 
 			if(ets->frag) {
@@ -2110,6 +2120,7 @@ int len;
 		switch(esp->es_server.ea_state) {
 
 		case eapTlsRecv:
+	
 			ets = (struct eaptls_session *) esp->es_server.ea_session;
 			eap_figure_next_state(esp, 
 				eaptls_receive(esp->es_server.ea_session, inp, len));
@@ -2130,19 +2141,22 @@ int len;
 		case eapTlsRecvClient:
 			/* Receive authentication response from client */
 
-			GETCHAR(flags, inp);
+			if (len > 0) {
+				GETCHAR(flags, inp);
 
-			if(len == 1 && !flags) {	/* Ack = ok */
+				if(len == 1 && !flags) {	/* Ack = ok */
 #ifdef MPPE
- 				eaptls_gen_mppe_keys( esp->es_server.ea_session, "client EAP encryption", 0 );
+ 					eaptls_gen_mppe_keys( esp->es_server.ea_session, "client EAP encryption", 0 );
 #endif
-				eap_send_success(esp);
-			}
-			else {			/* failure */
-				eaptls_receive(esp->es_server.ea_session, inp, len);
-				warn("Server authentication failed");
-				eap_send_failure(esp);
+					eap_send_success(esp);
+				}
+				else {			/* failure */
+					warn("Server authentication failed");
+					eap_send_failure(esp);
+				}
 			}
+			else
+				warn("Bogus EAP-TLS packet received from client");
 
 			eaptls_free_session(esp->es_server.ea_session);
 

--MP_/bLosz/70q3yHrFBGQZSM.wS
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--MP_/bLosz/70q3yHrFBGQZSM.wS--
