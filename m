Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52A5C88E4D
	for <buildroot@archiver.kernel.org>; Fri, 11 Sep 2026 21:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 463BD6060B;
	Fri, 11 Sep 2026 21:02:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x70gPs95X062; Fri, 11 Sep 2026 21:02:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1523660615
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789160550;
	b=MAqVIrsKszZFLNiNLIp86zCk+XEktnWsvzkx5zyQJt4w5MrYkPSJGWXlBIyCczCj/Y8h
	 pxlHqqmUSFdWM1bRnd/hLM2gF6CZWlTuHcoH4yQgiZF+LU4EKgRrWA4Y57geyRb4o3g3j
	 La/f9LASFroRAf6abX06mxEK/ngZuEEJG/1VOG5appSl6z/GntE8pcXbexhj3czV8+yQf
	 edVAxC7QvHrNKnm1EklnLl6U9UjFJB5MDpDgO2gFTIhXOTvvdyLI4HAtxw5xBKfWfL/zw
	 DKV72NSB5SsLCzca5X+DsZ8Vhp8LFz4o6+CEgtAD3Hoh8XJmHTF0NqUvSWoc9RFWJYw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789160550;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=tPsZOLJ8CMKkuQNTVwviq91t+kN+baWGFszse7Bmu6c=;
	b=fhxZQ0K9ZqFR8wO5Sp4gesjU9vnNYzo1eoWFruC0TPyUVgCHunI/YjPY15nLd/0WCtfQ
	 eQlT7RdNqxADBIOQrY6twiAueysLjiR8mtoMin818bUnmYXzW6oXAMRP6lKEDxlo3HKB9
	 B43y6ZW/g74Gb4CWh/WdJoqmMDss/aezuxCOCP0Ls1u9dXAI+xhOXZgcWX3kp+5GudnXa
	 m4pQG+HOrwFpRAAmt0RjJUrP16UixX8E1MVgQqUaq1pvseK27Nig6DEpzDujQxb7jGHij
	 jZCRpW4EDu8M+13YwBw/o/2N1sOUEv0baXSLOrpuXFXaMnxEf5GSP8+yyFVlg+Dyg4w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789160550;
	bh=tPsZOLJ8CMKkuQNTVwviq91t+kN+baWGFszse7Bmu6c=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M2wsEJRRDeANHaaixldRp97iKvdMHTfVEcjLpFkoWXNOznkM1C+prao5Zt3xlfvA9
	 Rf1NkC9qgro82GkpKc6eqzSPpexqc2b8/gNxVnsA6dW0OYFm3FS4Q/jGyly12or15y
	 zTNtinZNS8F3CUPFrFsBEbFgN8wpo0S15qnmoe9K5yXmioaqvmIWZ8sjM2a0AWV2h9
	 JBenSQiUxEXQT92mJRM7PeSiamwVo9wM492MKp1f7pv6Xtcgdtk+3xzMoLodKZKy2P
	 omsZ4DInTb5S/+YdHVu7v9uzc8Sk/fjuowNWJ1Ty+kc9rRIXjTLYMnjkU82Z18/qNG
	 fq1KDw819I/5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1523660615;
	Fri, 11 Sep 2026 21:02:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 34A5449D
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 21:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17496407CE
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 21:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z5OboVIvc0hJ for <buildroot@buildroot.org>;
 Fri, 11 Sep 2026 21:02:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5A7B7407CD
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789160547;
 b=THphMmGdqoUiJWvW/EHDyMJUgklO/0FhIHgzelR2bsFcrzovz3oNolHfupg9bHIAnp9K
 97BN0pihNQ0tVMChkuIIGl7GwdwquNIfc3QID4goKzs8BY3l5LcZH/q3zX9DRE104Zf1F
 p1KGLuov3TW4gqzfv/WPi+CooJ3XQ+1KmAfyFg1J/8jF9CwS+z6jgnP/nThGQ9yaL5KOt
 UrAeoVw+AnhMDZZtx4R1Gj+wR9RRbw/i7Ig0W1w1a8ZGnWN+3INVufuPzs4TCu5Zl9rju
 oDRm67yLVBdfHIhz8MeugPY3pjOQySXHWS9MSppPcM78+INj64KKXev9KcRRnQrDa/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789160547;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=jCbYKGuFHwQezsU4fpKVzeu4DtPa3SHqcrZ9DOeGtVU=;
 b=XE1ILYKTgYn27t5sHhjSmO2OHkxjA3ML7xoakrxY1oYBfHcRTjNyB9Q1z2tCPqSAvhky
 J/RdviTC3Dl/uU7rnf1jisrtzIk1UrMyGriNeUibvToD9bVKrCbb5cGstXBkIIiOK+yVQ
 k8N6HDaiG678vSIH7eJ5MJDjOHZp8ywVhfSnfgdtNiPl/Ur5nsmQnYNn7Zy6Rf5d9TRc4
 bRnDtn97LI3bzWh4pf/nujBJ18InL7NHd0vspWItWsDGLOTxyTjdBLfYPPximQMc8lgyD
 fw9VreqTOehjUQMaQXPoNdvvg+cUb6XbJvJeme07zP3Bhjpwsa1qtg1GcTUYz8MzVsA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=incA8BIF; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=incA8BIF
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A7B7407CD
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 21:02:25 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=incA8BIFe7XRfrpC7w04Us1xRLdEVAcqk4Fk1DX13mBM8vwALnDr4idVzW6AkaIh6lqCrB+tLK3DE9YG5L7ikhiygeXsEuQRr/aArGy0Oq9FLtuzejaBF/q2ax9HByogO1m7hyRastU0YhY9SOUgzjlDaJ/LCslQae0At1Lv/3UBhqO6gF6lzXLoEJu69/SYcb/JtN8G3Xuk5TBe+PKH24ZhYSAh7TtbEZDBLWiXbnjEf1Ve8gNX2+49m2sNPhbEgWF2uUJAjJ8ai3WpdUKHYeoMZJWh5Qm3V2WRDcMr3nA+0MeMds1VUL+X3/oAqUWntQIZlGcEru7sXe1ysnOmgA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=2Xvhrm0YF8Pb4amSV7wYzavM1Etd6S6sWo82figv/84=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -169736203; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 11 Sep 2026 21:02:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x58Nz-0000000F5aL-2DFD;
 Fri, 11 Sep 2026 23:02:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Matthew Weber <matt@thewebers.ws>,  Fiona Klute <fiona.klute@gmx.de>,
 ju.o@free.fr
In-Reply-To: <5a6e97f7-426c-4d40-b1a0-bc8d8d327c6f@gmx.de> (Fiona Klute via
 buildroot's message of "Fri, 11 Sep 2026 21:14:30 +0200")
References: <20260910015832.17751-1-matt@thewebers.ws>
 <5a6e97f7-426c-4d40-b1a0-bc8d8d327c6f@gmx.de>
Date: Fri, 11 Sep 2026 23:02:15 +0200
Message-ID: <87ecezec2w.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 1/1] docs: add agent guidance
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

>>>>> "Fiona" == Fiona Klute via buildroot <buildroot@buildroot.org> writes:

 > Am 10.09.26 um 03:58 schrieb Matthew Weber:
 >> Document Buildroot structure, documentation, build and validation
 >> workflows, mailing-list submission, Patchwork usage, and AI-assisted
 >> contribution requirements.
 >> This file provides shared guidance for AI agents that recognize
 >> AGENTS.md. Claude Code projects can load it by importing @AGENTS.md
 >> from a root CLAUDE.md file.

 > I am strictly against merging this, or any other "AGENTS.md". Doing so
 > would imply we (Buildroot/maintainers, which includes me) encourage
 > LLM-generated patches. That is not acceptable to me.

I also have my reservations.

I do not use LLMs for development myself. What is actually the concrete
added value of such a file in the context of Buildroot?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
