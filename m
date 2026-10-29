Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78D2606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 14:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=g2Sn+WYV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gOeje7BE
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 932B280F86;
	Thu, 29 Oct 2026 14:44:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TqeJ2iQz7nKB; Thu, 29 Oct 2026 14:44:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 66E5C80FA2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793285074;
	b=rEFBD2yDc5gnyrlvTSIWcLTVoJ05hqiVO4JYrXOk1OXzZbpg9OgQvqg2EjNZmN0rRFBq
	 1xwBUGqsYUzHB62sE9Lp/FzqUC8Wp6s7ezhQLOVwVvzmGpLtoR8ykfv/V4arW5fY77i8n
	 l5qg3i/okRPtTqtMaGk657r0jYat9Jjmz0Y3mvkOivF+ra35UqIpUtFir4Q2oxxJSD8wv
	 uu5vvIcaxdRXsHZV2a3WCHdCKA4upWv/EXAql0YUndLd/9XPBYozighFZ97J8u1XTS1rV
	 0px6N6LjW0q7FF6dFKsTXYmnG7BTQ5UwRmPebYYC+9AafsJ1Rvi3muWOFcvLEcDEoxQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793285074;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=jtO7wez5JgykLlKgGXgNsmR38MG/Utjw9fcfNzhMql4=;
	b=WY9ZLwibaIAp+nXlC/kLupuNbU4950OsiqEyQ9I5TR33l7KC85Y+jx/wst7FuFd70I4s
	 S1gKLuskQtrCFw6QuIKk1fpNBDBsxU0W3qiaWv9GRRbgqOwVGJih87mcfxyI7G9PxhR3d
	 e32B+KQH9i/RYEuDtyW0Wde7Fug8ELX8EWLmbEvqnsWBSHA0Wj/ZqvgkeZFs0lSBMneyE
	 kqMiDMNIcqf5H7EKWWowlxp24+0oo9EcXrex/XsNWemjvZO0Tfj+g36vxihxC6lxlRVD3
	 wmuRv0pgsDM/hniod/S9WqxJihebK2eGbE4NbrIsTXR7y/W2BpIj6D9R4RUgOqgyGzw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793285074;
	bh=jtO7wez5JgykLlKgGXgNsmR38MG/Utjw9fcfNzhMql4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g2Sn+WYVtYM5bHaXr9iN7X+8EtKLW+2Qm9lN2rEy7xy60Oshbp0n99Ton6D2a6CZZ
	 px4vLYR6ajTOQcGQ3BmknHHaNGM0OB35xTHnEjcKQbpxJ33dbX5n9I1P3npqpxD5m+
	 bzHjVJ0bbOdt+cucAZaLWjidN16mlQOCdEBJBeC/NLwJnFBcoUmmx7qfssnJvu8dKc
	 8woG1O8FLFPQg4mCTv5Se6hYrDM8M1kwLQXCLSvp8LcP+fM9nl53daWQdMXTr95Z4V
	 ubg63QAvfA3t3rsN0wQnULIrpVjbn7qKxSmguUI/5qQ6waFJVdWiVQap3mDmiN3b6J
	 mQbbwsORkYAXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66E5C80FA2;
	Thu, 29 Oct 2026 14:44:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DD1742FE
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD220407C5
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QCNze9NlmLdX for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 14:44:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2C263407C7
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793285067;
 b=H0YnPENuLDKFgdtuAX0xLwrtbwrNIJslhtipPQiJrBNqa7Q2LEQXYueiLH/RTWLtJNUE
 lAMYnG183ucMn/FEvctwBAWsroCFt0fLiLYjuB+SsXcZ+w3ssjOUBbKrmvkLm+/FgUFAS
 EECEmmoOr9BqOxIWvNZeUtKFw4OHpO3ihattY5j5jQJhTmnz2fRxlO963X19v1PtTZ8/4
 O422Qqv+bt20HYjT77HtxzzNBo2LSkGO9KV9mf4whm5H89y//nlNey7lKCrgJc3I7uaWG
 IUS6k9X89UP3mQWK0QQRCLvce+Bc3EiVwhCJW2BpVi0LOTX7WFKj8Q7Hui+DUSgX/Fg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793285067;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=GLqzUPbKUD2nymZfe1Ydcy/uVgQinFzvefrJar3cOqo=;
 b=h2mTVxOdBpBM5383/EPGPjhKbjGbDA/jNls7d8HcFhuJ9vjgc+yhVAfwHhN3vVrStYzd
 j4bOrANFuMln9+tWrLzdByFPcClcmgTJMeGJBFSjqunRolLlbQTqDbyovpzNKD6FOmVPc
 /cbzlubEu5NVysgJRybg9y7aOo8jugZ8Jw3eiBhYcp5SnDwAWUrqRF9pfkfK5nQ4N8vhV
 mTnvqJTPqooANv8lg8hi6TWn4hSNqLLVArwDcE9mdrgGuJQjRBakOWK8xl1AJMmz5+cPn
 sbybiBHGs8qe8r08JlJ+qRPZ+XlQgHBtFSQ3ulXNI2WgC/P7J3nY7Xx4ilpALkrGC+g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=gOeje7BE; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=gOeje7BE
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C263407C7
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:44:25 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-48dee593f18so1498910f8f.3
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 07:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793285063; x=1793889863; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GLqzUPbKUD2nymZfe1Ydcy/uVgQinFzvefrJar3cOqo=;
 b=gOeje7BERQFna5S4YfA1CohfJX7/SlpsCRzrQOgp2swBljkpfC2HMl4HwAbyS/bgU4
 J9TtJm8fbj2O5nVI+LJxjqfLkthR540N7PacYo5cycZmVeH+rbWtrizTxR/pDS5Q5QOQ
 LQMx/c6avSG8emsQpKrKcBQJR5TERBHVTEG94fDd4GYysE79IrmPzn1faf+4mGxctC1i
 h1VbzLqaB1ZBiS/D5mUutx0Pp4sNabOPtJddgg9DFxBxRnYP79CD8gCVWAHe+lh8xuaB
 Hh/Xu+FXioj0Xfpwbj4LC5pNE2OFaSqMhrmOZ+iBtv9fkYI1B2GrZj8nNZINQ41KmaGb
 cy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793285063; x=1793889863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=GLqzUPbKUD2nymZfe1Ydcy/uVgQinFzvefrJar3cOqo=;
 b=VoHAcUCwXwq/9ucbse+x+R4yIoQw4mYjTPf27bjJlIfWtJ+3c7AItXcOMeU2OS39m8
 CkY5T1Qids5yVj3YR/VKk5ThsdeOI8swdCNNytf9R3z9HHKL39s4kV+roltcIhLJ2wy4
 CQ75mYfhzXdY9iKcUzcLgHCGJT2z2XTmEDExbIbAe8LQIROEvDQc2VgPrJ1GwHi145AM
 4vfi/nD6M095HpoiZSyCGys9wmpHQM9N7BDooDLLVLIrRxXsKN4glJfBulTVsYYaaict
 SoA7wLtQ5308j2nrKPEEvLFjOdcXda6eYafny/fSaE3j4LZokrNw1BaYfut7hMT+blUl
 VFiA==
X-Gm-Message-State: AFq9FYLEEBb7LMdYsr3WANQT2mXimZKNJjP5H65kkrHYA6QVA1+LNvyI
 /7PUvb9t+gXjpXFKzWpJgYAzVvMukW/XtHXO4GIdg6lY5YV6wvmF4FLFsaUMnw==
X-Gm-Gg: AYBFou2v5656WW81VPcuyyg7TjVeG1u/jSTDBPs0P6frZoPGpTYI8hosiDiCWnTjsB1
 azyNNgKzzxsfNFYgFP75roLB10IhB7fq7jtjL7SOGseulX0zzaMgS4eBtU0qDe+2G9mffKtZImU
 T7CSJKXq/KZYjc1zqcHN4o333Wk52baAUDJ9t+Miz8p6oWzvsE6wyC6eQGbGBRJVQMj6cosHQOI
 7i02SFUDrtOfyZwN5vw3G4tjBwSr1U6fyf5RjdnCj8jtqZ7SyZ805jbMUJBnCK3tZsdWmbOJsEi
 eI8R83nIkNsKYSovBAJSdJ8xj5oP4b4NVstdhT30WETJXyPrgcr1W/EBKah0gy4YPXCtygMa6Oo
 7JeeXt+xVHjFlIOlNLXnkwmxTczClS16tgk7mVe2uSAvcYVBtNTCJWuIYIT0lw992bUSmt1RB2U
 TbXgnx8EXSLcEnoEtkdmiOWaaCFG4syTqltPSclzsXN5gNRPkXjx2WVwQEArNgzMvXRGFw+FDs7
 XYRiiIQyakMOYBy9z7bRzZ0KE19RLRdqL1foFKL7l9fDwc78wCEocuHphEgo1ny+KfhqUOZJovF
 PYwuu+lDyMNfDqETbyBtCDXG65RSN+PYz/wG3/wlveOwB3VUOn59Oz7TtdPjCuO9rPqXUEzp07I
 l
X-Received: by 2002:a5d:64cf:0:b0:48e:6092:dea1 with SMTP id
 ffacd0b85a97d-48e6092dfcemr10771590f8f.47.1793285063013; 
 Thu, 29 Oct 2026 07:44:23 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3eb8f387sm34699011f8f.4.2026.10.29.07.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 07:44:22 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 29 Oct 2026 15:43:57 +0100
Message-Id: <20261029144400.2972217-6-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029144400.2972217-1-angelo.compagnucci@gmail.com>
References: <20261029144400.2972217-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 6/9] website: fix the recent activity in
 buildroot.js
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The recent activity code is broken: commit notifications are not sent
anymore to the mailing list, so the feed never contains "git commit"
entries. This leaves the container variable undefined and the script
fails on every page, so the recent discussions are not displayed
either.

Rework it:
- load the recent commits from the GitLab API
- parse the mailing list Atom feed directly as XML, which allows
  dropping the x2js dependency
- only load the activity on pages having the matching containers

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/website/css/main.css    | 10 ----
 docs/website/footer.html     |  1 -
 docs/website/index.html      |  4 +-
 docs/website/js/buildroot.js | 88 ++++++++++++++++++++----------------
 4 files changed, 50 insertions(+), 53 deletions(-)

diff --git a/docs/website/css/main.css b/docs/website/css/main.css
index 28d13d2fa3..ca11d11d45 100644
--- a/docs/website/css/main.css
+++ b/docs/website/css/main.css
@@ -82,13 +82,3 @@ a {
 	-ms-filter: "FlipH";
 }
 
-.ellipsis p {
-	margin-bottom: 10px;
-	white-space: nowrap;
-	overflow: hidden;
-	text-overflow: ellipsis;
-}
-
-.panel-box p {
-	height: 1.5em;
-}
diff --git a/docs/website/footer.html b/docs/website/footer.html
index d9f4f75196..ee0a6d0c20 100644
--- a/docs/website/footer.html
+++ b/docs/website/footer.html
@@ -1,7 +1,6 @@
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/4.0.0/jquery.min.js" integrity="sha512-8LENNbXmzI/Gbj+OwXmqR6V4QaUAw0/porPzy1+dQoJqC0JPHedWoe0DDOTL2uHA5XXJyIsPtiMHH86pVlay6A==" crossorigin="anonymous"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.8/js/bootstrap.bundle.min.js" integrity="sha512-HvOjJrdwNpDbkGJIG2ZNqDlVqMo77qbs4Me4cah0HoDrfhrbA+8SBlZn1KrvAQw7cILLPFJvdwIgphzQmMm+Pw==" crossorigin="anonymous"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.7.1/clipboard.min.js" integrity="sha256-Daf8GuI2eLKHJlOWLRR/zRy9Clqcj4TUSumbxYH9kGI=" crossorigin="anonymous"></script>
-	<script src="https://cdnjs.cloudflare.com/ajax/libs/x2js/1.2.0/xml2json.min.js" integrity="sha256-RbFvov4fXA9DW/RzOAcIC0ZHIDmghGdsoug5slJHMMI=" crossorigin="anonymous"></script>
 	<script type="text/javascript" src="js/buildroot.js"></script>
 
 	<div style="text-align: center">
diff --git a/docs/website/index.html b/docs/website/index.html
index 17bf092abb..c1a5d90483 100644
--- a/docs/website/index.html
+++ b/docs/website/index.html
@@ -154,14 +154,14 @@
     <div class="col-sm-6">
       <div class="card mb-4">
 	<div class="card-header text-bg-primary rounded-top"><a class="link-light" href="https://gitlab.com/buildroot.org/buildroot/">Recent commits</a></div>
-	<div class="panel-box card-body ellipsis" id="commit-activity">
+	<div class="card-body pb-2" id="commit-activity">
 	</div>
       </div>
     </div>
     <div class="col-sm-6" >
       <div class="card mb-4">
 	<div class="card-header text-bg-primary rounded-top"><a class="link-light" href="https://lore.kernel.org/buildroot/">Recent discussions</a></div>
-	<div class="panel-box card-body ellipsis" id="mailing-list-activity">
+	<div class="card-body pb-2" id="mailing-list-activity">
 	</div>
       </div>
     </div>
diff --git a/docs/website/js/buildroot.js b/docs/website/js/buildroot.js
index 9b2d8e1f89..e115ca4810 100644
--- a/docs/website/js/buildroot.js
+++ b/docs/website/js/buildroot.js
@@ -1,51 +1,58 @@
-function display_activity(result, activity) {
-    let loaded = 0;
-    let nb_display = 8;
-    let container;
-    if (result==null) return;
-    for (let i = 0; i < result.feed.entry.length; i++) {
-        let entry = result.feed.entry[i];
-        if (activity==="commit" && entry.title.toString().indexOf("git commit") !== -1) {
-            container = document.getElementById("commit-activity");
-        } else if (activity==="mailing-list" && entry.title.toString().indexOf("git commit") === -1) {
-            container = document.getElementById("mailing-list-activity");
-        } else {
-            continue;
+const NB_ACTIVITY = 8;
+
+function display_activity(container, items) {
+    if (container == null) return;
+    for (let i = 0; i < NB_ACTIVITY; i++) {
+        let p = document.createElement("p");
+        p.className = "text-truncate mb-2";
+        p.textContent = "\u00a0";
+        if (i < items.length) {
+            p.textContent = "";
+            let link = document.createElement("a");
+            let d = new Date(items[i].date);
+            link.textContent = '[' + d.toLocaleDateString() + '] ' + items[i].title;
+            link.title = items[i].title;
+            link.href = items[i].url;
+            p.appendChild(link);
         }
-        loaded += 1
-        if (loaded > nb_display)
-            break;
-        let div = document.createElement("p");
-        let link = document.createElement("a");
-        let d = new Date(entry.updated);
-        let data = '[' + d.toLocaleDateString() + '] ' + entry.title;
-        data = data.replace("Re: ","");
-        data = data.replace("[Buildroot] ","");
-        let text = document.createTextNode(data);
-        link.appendChild(text);
-        link.title = entry.title;
-        link.href = entry.link._href;
-        div.appendChild(link);
-        container.appendChild(div);
-    }
-    for (let i = 0; i < (nb_display - loaded); i++) {
-        container.appendChild(document.createElement("p"));
+        container.appendChild(p);
     }
 }
 
-function load_activity(feedurl) {
+function load_commit_activity(apiurl) {
+    let container = document.getElementById("commit-activity");
+    if (container == null) return;
     $.ajax({
-      url: feedurl
+        url: apiurl,
+        dataType: "json"
     })
-    .done(function(data){
-        let x2js = new X2JS();
-        let result = x2js.xml_str2json(data.documentElement.outerHTML);
-        display_activity(result, "commit");
-        display_activity(result, "mailing-list");
+    .done(function(commits) {
+        display_activity(container, commits.map(function(c) {
+            return { date: c.committed_date, title: c.title, url: c.web_url };
+        }));
     });
 }
 
-
+function load_mailing_list_activity(feedurl) {
+    let container = document.getElementById("mailing-list-activity");
+    if (container == null) return;
+    $.ajax({
+        url: feedurl,
+        dataType: "xml"
+    })
+    .done(function(feed) {
+        let items = [];
+        $(feed).find("entry").slice(0, NB_ACTIVITY).each(function() {
+            let title = $(this).children("title").text();
+            items.push({
+                date: $(this).children("updated").text(),
+                title: title.replace("Re: ", "").replace("[Buildroot] ", ""),
+                url: $(this).children("link").attr("href")
+            });
+        });
+        display_activity(container, items);
+    });
+}
 
 function google_analytics() {
     let _gaq = _gaq || [];
@@ -99,7 +106,8 @@ jQuery(document).ready(function($) {
     url = url.split(/[\\/]/).pop();
     $('.navbar-nav a.nav-link[href="/' + url + '"]').addClass('active bg-light');
 
-    load_activity("/new.atom");
+    load_commit_activity("https://gitlab.com/api/v4/projects/buildroot.org%2Fbuildroot/repository/commits?ref_name=master&per_page=" + NB_ACTIVITY);
+    load_mailing_list_activity("/new.atom");
 
     $('#slides').html('<iframe src="https://docs.google.com/gview?url=http://bootlin.com/doc/training/buildroot/buildroot-slides.pdf&embedded=true" style="position:absolute; width:100%; height:100%; top:0; left:0;" frameborder="0"></iframe>')
 });
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
