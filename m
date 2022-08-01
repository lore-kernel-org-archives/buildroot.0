Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753B1C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 21:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10E6860594;
	Mon,  1 Aug 2022 21:03:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10E6860594
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TEUioPtZVEIJ; Mon,  1 Aug 2022 21:03:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16ABD6058C;
	Mon,  1 Aug 2022 21:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16ABD6058C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E2D61BF290
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 21:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6422C81292
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 21:03:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6422C81292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cf5FjWfnn9VO for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 21:03:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC9D981279
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC9D981279
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 21:03:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3874C240005;
 Mon,  1 Aug 2022 21:03:39 +0000 (UTC)
Date: Mon, 1 Aug 2022 23:03:38 +0200
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Message-ID: <20220801230338.5529af66@windsurf>
In-Reply-To: <20220724235301.3708271-2-ricardo.martincoski@gmail.com>
References: <20220724235301.3708271-1-ricardo.martincoski@gmail.com>
 <20220724235301.3708271-2-ricardo.martincoski@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659387819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1R//OCYB4VkdSpuK4xT26SIeJUwz1RWMsvImPgXWUu8=;
 b=ChgpJT/sOPhvj6Z+z8YAHl/bnVmdCFAU+DzvDXfP0NRBVPEdfTMKun1BzqyHl936hzMjSC
 iMXlvLExE3u9D/4uFRTXtJghAQC/R0Yop6shrq4eObpDQK4Xbrk6mMQDQHSm8GzlUxFbvS
 FZ+x98WxktDN3DiPbQzEZpEtyNAFjSGpUL6sYQuwl0ytZu8jmPbEUD19Z4Fm1jIR8Ptqmw
 EqbRjBCQStVEE1XbBLfgys52WBQpZ3cxwiRIBIno37cheerxFTCdst8NroXSR0axJf5dO8
 2JEXcGzT/NM7LBTbiYn4V64FYNBrjU83p5IAEvCzqo7jSloXCNvHZsMOWfMNkg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ChgpJT/s
Subject: Re: [Buildroot] [PATCH 2/3] utils/get-developers: bail out on
 parsing errors
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun, 24 Jul 2022 20:53:00 -0300
Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:

> diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
> index 2a8d5c213c..f9f84ee8e1 100644
> --- a/utils/getdeveloperlib.py
> +++ b/utils/getdeveloperlib.py
> @@ -225,34 +225,37 @@ def parse_developer_runtime_tests(fnames):
>      return runtimes
>  
>  
>  def parse_developers(filename=None):
>      """Parse the DEVELOPERS file and return a list of Developer objects."""
>      developers = []
>      linen = 0
> +    errors = 0
>      global unittests
>      unittests = list_unittests()
>      developers_fname = filename or os.path.join(brpath, 'DEVELOPERS')
>      with open(developers_fname, mode='r', encoding='utf_8') as f:
>          files = []
>          name = None
>          for line in f:
>              line = line.strip()
>              if line.startswith("#"):
>                  continue
>              elif line.startswith("N:"):
>                  if name is not None or len(files) != 0:
> +                    errors += 1
>                      print("Syntax error in DEVELOPERS file, line %d" % linen,
>                            file=sys.stderr)

So in this error condition, we continue the parsing...

>                  name = line[2:].strip()
>              elif line.startswith("F:"):
>                  fname = line[2:].strip()
>                  dev_files = glob.glob(os.path.join(brpath, fname))
>                  if len(dev_files) == 0:
> -                    print("WARNING: '%s' doesn't match any file" % fname,
> +                    errors += 1
> +                    print("Syntax error in DEVELOPERS file, line %d: '%s' doesn't match any file" % (linen, fname),
>                            file=sys.stderr)
>                  for f in dev_files:
>                      dev_file = os.path.relpath(f, brpath)
>                      dev_file = dev_file.replace(os.sep, '/')  # force unix sep
>                      if f[-1] == '/':  # relpath removes the trailing /
>                          dev_file = dev_file + '/'
>                      files.append(dev_file)
> @@ -266,14 +269,16 @@ def parse_developers(filename=None):
>                  print("Syntax error in DEVELOPERS file, line %d: '%s'" % (linen, line),
>                        file=sys.stderr)
>                  return None

but in this one we abort immediately. It is quite confusing that those
two (similar?) error conditions are handled in a different way. Of
course, it is already the case in the current code, but your errors +=
1 made me think about this. I guess on syntax errors, we should stop
parsing immediately, because the rest of the state machine is not
designed to handle malformed input.

So on the two syntax errors conditions: return None immediately, don't
bother counting errors.

On the file not matching case, perhaps a dedicated counter:
'unmatched_files' ?

Regarding the "%s doesn't match any file", I am not happy with having
the message start with "Syntax error in DEVELOPERS file", because it's
not a syntax error. The syntax is perfectly correct. So I appreciate
your wish to make message more consistent, but it doesn't work well
here I'm afraid.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
