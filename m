Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B42AC3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 17:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C6A180ED9;
	Sun, 18 May 2025 17:46:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQdZL5CQKphY; Sun, 18 May 2025 17:46:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2654680DE4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2654680DE4;
	Sun, 18 May 2025 17:46:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C02A3E4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6BA660AE7
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yJAPSue0wG3a for <buildroot@buildroot.org>;
 Sun, 18 May 2025 17:46:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3AA8C60680
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AA8C60680
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3AA8C60680
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:46:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a067b.dip0.t-ipconnect.de [91.58.6.123])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2D6D5A4C20C4;
 Sun, 18 May 2025 19:46:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38314)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uGi5m-000000003tB-0o4k;
 Sun, 18 May 2025 17:46:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Bogdan Radulescu <bogdan@nimblex.net>,
 Joachim Wiberg <troglobit@gmail.com>, Steve Kenton <skenton@ou.edu>,
 Wade Berrier <wberrier@gmail.com>
Date: Sun, 18 May 2025 19:46:27 +0200
Message-Id: <20250518174630.2149476-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250518174630.2149476-1-bernd@kuhls.net>
References: <20250518174630.2149476-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747590391;
 bh=60Bp4PhjMjRw1VtQAj7pOXTcG8FsHTxHqI8p6ZbDdSU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QEbazeL2UfZyCzfZPrwmY5N+aG6cF5gVz80vJI69MPWgeg6PQzbZieneICoZZZUz2
 +v9jPjHuViZaCICBW8nPhNCgmHOXcEhVeiX2abAa48gC4fsC1Vy3tZwHN+mXOSleZU
 8WrSTfMJnS75afuFRrURs+JK+SX5n6vlSdcBaqrrxYMbDncPpRjuJnInry2P8WIXy3
 /LzUhpPD4xJ3GDvdtnPO55HSsb/FTGwklxf/C1/ZwLX3wb3VznHdbPwwr982Mk82FF
 fA+ZvGF2YSbZJZpl4MmyjgQEXSNlml6mFy+ktfPtLvE6fqgYg2PmgqMADskHAoPpbo
 mv4bfh8Vgg8TA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=QEbazeL2
Subject: [Buildroot] [PATCH 2/5] package/mjpegtools: fix build with gcc-15.x
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mjpegtools/0001-gcc15.patch | 354 ++++++++++++++++++++++++++++
 1 file changed, 354 insertions(+)
 create mode 100644 package/mjpegtools/0001-gcc15.patch

diff --git a/package/mjpegtools/0001-gcc15.patch b/package/mjpegtools/0001-gcc15.patch
new file mode 100644
index 0000000000..019317c7fd
--- /dev/null
+++ b/package/mjpegtools/0001-gcc15.patch
@@ -0,0 +1,354 @@
+Fix build with gcc-15.x
+
+Upstream: https://sourceforge.net/p/mjpeg/Code/3513/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+Index: trunk/mjpeg_play/y4mdenoise/Region2D.hh
+===================================================================
+--- mjpeg_play/y4mdenoise/Region2D.hh	(Revision 3512)
++++ mjpeg_play/y4mdenoise/Region2D.hh	(Revision 3513)
+@@ -97,35 +97,11 @@
+ 		// Add the given horizontal extent to the region.  Note that
+ 		// a_tnXEnd is technically one past the end of the extent.
+ 
+-	template <class REGION, class REGION_TEMP>
+-	void UnionDebug (Status_t &a_reStatus, INDEX a_tnY,
+-			INDEX a_tnXStart, INDEX a_tnXEnd, REGION_TEMP &a_rTemp);
+-		// Add the given horizontal extent to the region.  Note that
+-		// a_tnXEnd is technically one past the end of the extent.
+-		// Exhaustively (i.e. slowly) verifies the results, using a
+-		// much simpler algorithm.
+-		// Requires the use of a temporary region, usually of the
+-		// final subclass' type, in order to work.  (Since that can't
+-		// be known at this level, a template parameter is included for
+-		// it.)
+-
+ 	template <class REGION>
+ 	void Union (Status_t &a_reStatus, const REGION &a_rOther);
+ 		// Make the current region represent the union between itself
+ 		// and the other given region.
+ 
+-	template <class REGION, class REGION_O, class REGION_TEMP>
+-	void UnionDebug (Status_t &a_reStatus,
+-			REGION_O &a_rOther, REGION_TEMP &a_rTemp);
+-		// Make the current region represent the union between itself
+-		// and the other given region.
+-		// Exhaustively (i.e. slowly) verifies the results, using a
+-		// much simpler algorithm.
+-		// Requires the use of a temporary region, usually of the
+-		// final subclass' type, in order to work.  (Since that can't
+-		// be known at this level, a template parameter is included for
+-		// it.)
+-
+ 	//void Merge (Status_t &a_reStatus, INDEX a_tnY, INDEX a_tnXStart,
+ 	//		INDEX a_tnXEnd);
+ 		// Merge this extent into the current region.
+@@ -166,36 +142,11 @@
+ 		// Subtract the given horizontal extent from the region.  Note
+ 		// that a_tnXEnd is technically one past the end of the extent.
+ 
+-	template <class REGION_TEMP>
+-	void SubtractDebug (Status_t &a_reStatus, INDEX a_tnY,
+-			INDEX a_tnXStart, INDEX a_tnXEnd, REGION_TEMP &a_rTemp);
+-		// Subtract the given horizontal extent from the region.  Note
+-		// that a_tnXEnd is technically one past the end of the extent.
+-		// Exhaustively (i.e. slowly) verifies the results, using a
+-		// much simpler algorithm.
+-		// Requires the use of a temporary region, usually of the
+-		// final subclass' type, in order to work.  (Since that can't
+-		// be known at this level, a template parameter is included for
+-		// it.)
+-
+ 	template <class REGION>
+ 	void Subtract (Status_t &a_reStatus, const REGION &a_rOther);
+ 		// Subtract the other region from the current region, i.e.
+ 		// remove from the current region any extents that exist in the
+ 		// other region.
+-	
+-	template <class REGION, class REGION_O, class REGION_TEMP>
+-	void SubtractDebug (Status_t &a_reStatus, REGION_O &a_rOther,
+-			REGION_TEMP &a_rTemp);
+-		// Subtract the other region from the current region, i.e.
+-		// remove from the current region any extents that exist in the
+-		// other region.
+-		// Exhaustively (i.e. slowly) verifies the results, using a
+-		// much simpler algorithm.
+-		// Requires the use of a temporary region, usually of the
+-		// final subclass' type, in order to work.  (Since that can't
+-		// be known at this level, a template parameter is included for
+-		// it.)
+ 
+ 	//typedef ... ConstIterator;
+ 	//ConstIterator Begin (void) const { return m_setExtents.Begin(); }
+@@ -404,85 +355,6 @@
+ 
+ 
+ 
+-// Add the given horizontal extent to the region.
+-template <class INDEX, class SIZE>
+-template <class REGION, class REGION_TEMP>
+-void
+-Region2D<INDEX,SIZE>::UnionDebug (Status_t &a_reStatus, INDEX a_tnY,
+-	INDEX a_tnXStart, INDEX a_tnXEnd, REGION_TEMP &a_rTemp)
+-{
+-	typename REGION::ConstIterator itHere;
+-	typename REGION_TEMP::ConstIterator itHereO;
+-	INDEX tnX;
+-		// Used to loop through points.
+-
+-	// Make sure they didn't start us off with an error.
+-	assert (a_reStatus == g_kNoError);
+-
+-	// Calculate the union.
+-	a_rTemp.Assign (a_reStatus, *this);
+-	if (a_reStatus != g_kNoError)
+-		return;
+-	a_rTemp.Union (a_reStatus, a_tnY, a_tnXStart, a_tnXEnd);
+-	if (a_reStatus != g_kNoError)
+-		return;
+-	
+-	// Loop through every point in the result, make sure it's in
+-	// one of the two input regions.
+-	for (itHereO = a_rTemp.Begin(); itHereO != a_rTemp.End(); ++itHereO)
+-	{
+-		const Extent &rHere = *itHereO;
+-		for (tnX = rHere.m_tnXStart; tnX < rHere.m_tnXEnd; ++tnX)
+-		{
+-			if (!((rHere.m_tnY == a_tnY
+-				&& (tnX >= a_tnXStart && tnX < a_tnXEnd))
+-			|| this->DoesContainPoint (rHere.m_tnY, tnX)))
+-				goto error;
+-		}
+-	}
+-
+-	// Loop through every point in the original region, make sure
+-	// it's in the result.
+-	for (itHere = this->Begin(); itHere != this->End(); ++itHere)
+-	{
+-		const Extent &rHere = *itHere;
+-		for (tnX = rHere.m_tnXStart; tnX < rHere.m_tnXEnd; ++tnX)
+-		{
+-			if (!a_rTemp.DoesContainPoint (rHere.m_tnY, tnX))
+-				goto error;
+-		}
+-	}
+-
+-	// Loop through every point in the added extent, make sure it's in
+-	// the result.
+-	for (tnX = a_tnXStart; tnX < a_tnXEnd; ++tnX)
+-	{
+-		if (!a_rTemp.DoesContainPoint (a_tnY, tnX))
+-			goto error;
+-	}
+-
+-	// The operation succeeded.  Commit it.
+-	Assign (a_reStatus, a_rTemp);
+-	if (a_reStatus != g_kNoError)
+-		return;
+-
+-	// All done.
+-	return;
+-
+-error:
+-	// Handle deviations.
+-	fprintf (stderr, "Region2D::Union() failed\n");
+-	fprintf (stderr, "Input region:\n");
+-	PrintRegion (*this);
+-	fprintf (stderr, "Input extent: [%d,%d-%d]\n",
+-		int (a_tnY), int (a_tnXStart), int (a_tnXEnd));
+-	fprintf (stderr, "Result:\n");
+-	PrintRegion (a_rTemp);
+-	assert (false);
+-}
+-
+-
+-
+ // Make the current region represent the union between itself
+ // and the other given region.
+ template <class INDEX, class SIZE>
+@@ -511,184 +383,6 @@
+ 	}
+ }
+ 
+-
+-
+-// Make the current region represent the union between itself
+-// and the other given region.
+-template <class INDEX, class SIZE>
+-template <class REGION, class REGION_O, class REGION_TEMP>
+-void
+-Region2D<INDEX,SIZE>::UnionDebug (Status_t &a_reStatus,
+-	REGION_O &a_rOther, REGION_TEMP &a_rTemp)
+-{
+-	typename REGION::ConstIterator itHere;
+-	typename REGION_O::ConstIterator itHereO;
+-	typename REGION_TEMP::ConstIterator itHereT;
+-	INDEX tnX;
+-		// Used to loop through points.
+-
+-	// Make sure they didn't start us off with an error.
+-	assert (a_reStatus == g_kNoError);
+-
+-	// Calculate the union.
+-	a_rTemp.Assign (a_reStatus, *this);
+-	if (a_reStatus != g_kNoError)
+-		return;
+-	a_rTemp.Union (a_reStatus, a_rOther);
+-	if (a_reStatus != g_kNoError)
+-		return;
+-	
+-	// Loop through every point in the result, make sure it's in
+-	// one of the two input regions.
+-	for (itHereT = a_rTemp.Begin(); itHereT != a_rTemp.End(); ++itHereT)
+-	{
+-		const Extent &rHere = *itHereT;
+-		for (tnX = rHere.m_tnXStart; tnX < rHere.m_tnXEnd; ++tnX)
+-		{
+-			if (!a_rOther.DoesContainPoint (rHere.m_tnY, tnX)
+-			&& !this->DoesContainPoint (rHere.m_tnY, tnX))
+-				goto error;
+-		}
+-	}
+-
+-	// Loop through every point in the first input region, make sure
+-	// it's in the result.
+-	for (itHere = this->Begin(); itHere != this->End(); ++itHere)
+-	{
+-		const Extent &rHere = *itHere;
+-		for (tnX = rHere.m_tnXStart; tnX < rHere.m_tnXEnd; ++tnX)
+-		{
+-			if (!a_rTemp.DoesContainPoint (rHere.m_tnY, tnX))
+-				goto error;
+-		}
+-	}
+-
+-	// Loop through every point in the second input region, make sure
+-	// it's in the result.
+-	for (itHereO = a_rOther.Begin();
+-		 itHereO != a_rOther.End();
+-		 ++itHereO)
+-	{
+-		const Extent &rHere = *itHereO;
+-		for (tnX = rHere.m_tnXStart; tnX < rHere.m_tnXEnd; ++tnX)
+-		{
+-			if (!a_rTemp.DoesContainPoint (rHere.m_tnY, tnX))
+-				goto error;
+-		}
+-	}
+-
+-	// The operation succeeded.  Commit it.
+-	Assign (a_reStatus, a_rTemp);
+-	if (a_reStatus != g_kNoError)
+-		return;
+-
+-	// All done.
+-	return;
+-
+-error:
+-	// Handle deviations.
+-	fprintf (stderr, "Region2D::Union() failed\n");
+-	fprintf (stderr, "First input region:\n");
+-	PrintRegion (*this);
+-	fprintf (stderr, "Second input region:\n");
+-	PrintRegion (a_rOther);
+-	fprintf (stderr, "Result:\n");
+-	PrintRegion (a_rTemp);
+-	assert (false);
+-}
+-
+-
+-
+-// Subtract the other region from the current region, i.e.
+-// remove from the current region any areas that exist in the
+-// other region.
+-template <class INDEX, class SIZE>
+-template <class REGION, class REGION_O, class REGION_TEMP>
+-void
+-Region2D<INDEX,SIZE>::SubtractDebug (Status_t &a_reStatus,
+-	REGION_O &a_rOther, REGION_TEMP &a_rTemp)
+-{
+-	typename REGION::ConstIterator itHere;
+-	typename REGION_O::ConstIterator itHereO;
+-	typename REGION_TEMP::ConstIterator itHereT;
+-	INDEX tnX;
+-		// Used to loop through points.
+-
+-	// Make sure they didn't start us off with an error.
+-	assert (a_reStatus == g_kNoError);
+-
+-	// Calculate the difference.
+-	a_rTemp.Assign (a_reStatus, *this);
+-	if (a_reStatus != g_kNoError)
+-		return;
+-	a_rTemp.Subtract (a_reStatus, a_rOther);
+-	if (a_reStatus != g_kNoError)
+-		return;
+-	
+-	// Loop through every point in the result, make sure it's in
+-	// the first input region but not the second.
+-	for (itHereT = a_rTemp.Begin(); itHereT != a_rTemp.End(); ++itHereT)
+-	{
+-		const Extent &rHere = *itHereT;
+-		for (tnX = rHere.m_tnXStart; tnX < rHere.m_tnXEnd; ++tnX)
+-		{
+-			if (!(this->DoesContainPoint (rHere.m_tnY, tnX)
+-			&& !a_rOther.DoesContainPoint (rHere.m_tnY, tnX)))
+-				goto error;
+-		}
+-	}
+-
+-	// Loop through every point in the first input region, and if it's
+-	// not in the second input region, make sure it's in the result.
+-	for (itHere = this->Begin(); itHere != this->End(); ++itHere)
+-	{
+-		const Extent &rHere = *itHere;
+-		for (tnX = rHere.m_tnXStart; tnX < rHere.m_tnXEnd; ++tnX)
+-		{
+-			if (!a_rOther.DoesContainPoint (rHere.m_tnY, tnX))
+-			{
+-				if (!a_rTemp.DoesContainPoint (rHere.m_tnY, tnX))
+-					goto error;
+-			}
+-		}
+-	}
+-
+-	// Loop through every point in the second input region, make sure
+-	// it's not in the result.
+-	for (itHereO = a_rOther.Begin();
+-		 itHereO != a_rOther.End();
+-		 ++itHereO)
+-	{
+-		const Extent &rHere = *itHere;
+-		for (tnX = rHere.m_tnXStart; tnX < rHere.m_tnXEnd; ++tnX)
+-		{
+-			if (a_rTemp.DoesContainPoint (rHere.m_tnY, tnX))
+-				goto error;
+-		}
+-	}
+-
+-	// The operation succeeded.  Commit it.
+-	Assign (a_reStatus, a_rTemp);
+-	if (a_reStatus != g_kNoError)
+-		return;
+-
+-	// All done.
+-	return;
+-
+-error:
+-	// Handle deviations.
+-	fprintf (stderr, "Region2D::Subtract() failed\n");
+-	fprintf (stderr, "First input region:\n");
+-	PrintRegion (*this);
+-	fprintf (stderr, "Second input region:\n");
+-	PrintRegion (a_rOther);
+-	fprintf (stderr, "Result:\n");
+-	PrintRegion (a_rTemp);
+-	assert (false);
+-}
+-
+-
+-
+ // Flood-fill the current region.
+ template <class INDEX, class SIZE>
+ template <class CONTROL>
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
