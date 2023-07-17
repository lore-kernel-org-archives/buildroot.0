Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07F8C001B0
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 15:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CF4581EC3;
	Mon, 17 Jul 2023 15:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CF4581EC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2QpGifegV3cn; Mon, 17 Jul 2023 15:18:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82FA681EB9;
	Mon, 17 Jul 2023 15:18:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82FA681EB9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A29601BF341
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 15:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D1CC40A67
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 15:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D1CC40A67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bm233kq5HkCQ for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 15:18:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CB8840181
Received: from mail.femto-st.fr (lifc.univ-fcomte.fr [194.57.88.66])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0CB8840181
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 15:18:04 +0000 (UTC)
Received: from x230 ([194.167.45.227]) (authenticated bits=0)
 by mail.femto-st.fr (8.15.2/8.15.2/Debian-22) with ESMTPSA id 36HFI0vc001026
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 17 Jul 2023 17:18:00 +0200
Date: Mon, 17 Jul 2023 17:17:42 +0200
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230717171742.457b0500@x230>
In-Reply-To: <20230710202503.0219463b@windsurf>
References: <20230626070536.311268-1-gwenj@trabucayre.com>
 <20230626070536.311268-2-gwenj@trabucayre.com>
 <503759ef-8263-e971-cfdb-5d2d2c395c27@mind.be>
 <20230707105851.0a3f3244@x230>
 <1d33ec42-4e85-70ed-b93a-18eeeb6ff0db@mind.be>
 <20230710202503.0219463b@windsurf>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 194.57.88.66
Subject: Re: [Buildroot] [PATCH v2 2/2] package/gnuradio: fix gnuradio
 python libraries for cross-compile
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, Arnout, all
Sorry for delay, was away for a correct/stable connection.

On Mon, 10 Jul 2023 20:25:03 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Gwenhael,
> 
> On Fri, 7 Jul 2023 11:44:21 +0200
> Arnout Vandecappelle via buildroot <buildroot@buildroot.org> wrote:
> 
> > > In fact I see I have missed to explain in my message this issue is
> > > related to pybind.
> > > If PYTHON_MODULE_EXTENSION is unset, .cmake uses a python script
> > > containing sysconfig.get_config_var('EXT_SUFFIX')
> > > This one return .cpython-311-x86_64-linux-gnu.so, because host-python is
> > > used.    
> > 
> >   Ah, in that case the environment variable you need is 
> > _PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)"
> > This will make sure the sysconfig that gets used is the one for the target 
> > instead of for the host.
> > 
> >   It's quite likely that you need all of PKG_PYTHON_ENV to be present in
> > the environment.  
> 
> Have you had the chance to test this suggestion from Arnout?
> 
Adding:
GNURADIO_CONF_ENV += _PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
    PYTHONPATH=$(PYTHON3_PATH)
Do the job.
Thanks. I have to redo my patch
> Thomas

Gwen
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
