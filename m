Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AE4C00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 21:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31B334018E;
	Tue, 26 Jul 2022 21:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31B334018E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RgDoP-kOvZ-y; Tue, 26 Jul 2022 21:59:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22E4C4013F;
	Tue, 26 Jul 2022 21:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22E4C4013F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AB4C51BF239
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FDDA607A8
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:59:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FDDA607A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lkLnsSfa5yNc for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 21:59:44 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14FE1606BF
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14FE1606BF
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 21:59:43 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GSTnoqtHVXOlAGSTnoM9CW; Tue, 26 Jul 2022 23:52:40 +0200
Message-ID: <229dd860-e5ff-64a4-f97e-00cc3de26075@benettiengineering.com>
Date: Tue, 26 Jul 2022 23:52:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220101214034.2152144-1-giulio.benetti@benettiengineering.com>
 <CADvTj4r09-gBxrbbJCd-gXCaOzZsMGUgv=E-SELMUieGdTorcA@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CADvTj4r09-gBxrbbJCd-gXCaOzZsMGUgv=E-SELMUieGdTorcA@mail.gmail.com>
X-CMAE-Envelope: MS4xfJ+A0etsVKcRFef/t+3zLhjC00oAQx1yP3dRF05Ben08+hizMd+OROIFKyZS+TZ2iDAs/VS/kU1uuGmmTnhPJICIfeWWaWh4BvnbE/8ZPkR3qKgs2d6T
 wVeA5far6gj48BjzDIsp5J0zGHinxUFcnJ9j4aFTCAOVLRQgDee23ZES+xxMK9FoROXUTLsCrpF/QPaZowHeNUadLRHIZdKDUz2HqOIDSSH6LVBM+ji00AZP
 TCp/VnGONXn9l/p45Aku2bixIKq0fMFdxHx9WoD7ucdV9Epxy8ep0lV2Jc6MBGWQ
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1658872360; bh=D1BDBRwRs9Q67BcIzi3g8umIYWzXIkTgt5+TXF1SSj4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=ao1dPJmIfUM7HEEOUTC6FsDtfUDOw48fLBjO0X74g1Lk0xZfaltjfVeWWMLf2fc7N
 Z8yDG4qa+8uRvCMR2S0728c4Ro0nFOVBam9KEDoSU4lnh8WCpelvDcH1uAAQ5//EmX
 ficZGoncFnRaOcWbE7y5nrY+Bv/iimaER0Y6zPZdSJeflLKBWXqgrAtTaWfCAKf5+O
 4WLzVX6iK+CRkW0tfOcA6qSG66PHMIQqH62lKHMJttRHupTZ0j3PcI/uNa/YZt2Awh
 7lDbG/W8ILxwV3XwYwNYXc6k7wqMYqCD6LJ0u5AAXIdXamZtAiQ9FyR3xkln4XcH3n
 VKrl68YXme3LQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=ao1dPJmI
Subject: Re: [Buildroot] [PATCH] Makefile: disable 'printvars' and
 'show-vars' recipes for Make 4.3
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

On 21/07/22 05:55, James Hilliard wrote:
> On Sat, Jan 1, 2022 at 2:40 PM Giulio Benetti
> <giulio.benetti@benettiengineering.com> wrote:
>>
>> Make 4.3 is buggy and leads to a "Segmentation fault (core dumped)" when
>> calling 'make printvars' or 'make show-vars', so let's refuse to execute
>> those recipes if Make 4.3 by adding 'check-make-version' recipe as
>> depedendency of 'printvars' and 'show-vars' as suggested by Yann E. Morin.
> 
> FYI autobuilder threads seem to die when this gets hit:
> make: *** [Makefile:1056: check-make-version] Error 1
> Process Process-12:
> Traceback (most recent call last):
>    File "/usr/lib/python3.10/multiprocessing/process.py", line 315, in _bootstrap
>      self.run()
>    File "/usr/lib/python3.10/multiprocessing/process.py", line 108, in run
>      self._target(*self._args, **self._kwargs)
>    File "/home/autobuild/buildroot-test/scripts/autobuild-run", line
> 748, in run_instance
>      self.run_one_build()
>    File "/home/autobuild/buildroot-test/scripts/autobuild-run", line
> 731, in run_one_build
>      ret = self.do_reproducible_build()
>    File "/home/autobuild/buildroot-test/scripts/autobuild-run", line
> 524, in do_reproducible_build
>      ret = self.check_reproducibility()
>    File "/home/autobuild/buildroot-test/scripts/autobuild-run", line
> 416, in check_reproducibility
>      prefix = subprocess.check_output(["make", "--no-print-directory",
> "O=%s" % self.outputdir,
>    File "/usr/lib/python3.10/subprocess.py", line 420, in check_output
>      return run(*popenargs, stdout=PIPE, timeout=timeout, check=True,
>    File "/usr/lib/python3.10/subprocess.py", line 524, in run
>      raise CalledProcessError(retcode, process.args,
> subprocess.CalledProcessError: Command '['make',
> '--no-print-directory',
> 'O=/home/autobuild/autobuild/instance-11/output-1', '-C',
> 'instance-11/buildroot', 'printvars', 'VARS=TARGET_CROSS']' returned
> non-zero exit status 2.

Do you have an autobuilder failure link?
So I can reproduce it here and find a work-around for it.

Thank you!
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> 
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   Makefile | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 0b8c7b2867..ac98b84425 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1058,13 +1058,20 @@ ifeq ($(NEED_WRAPPER),y)
>>          $(Q)$(TOPDIR)/support/scripts/mkmakefile $(TOPDIR) $(O)
>>   endif
>>
>> +.PHONY: check-make-version
>> +check-make-version:
>> +ifneq ($(filter $(RUNNING_MAKE_VERSION),4.3),)
>> +       @echo "Make 4.3 doesn't support 'printvars' and 'show-vars' recipes"
>> +       @exit 1
>> +endif
>> +
>>   # printvars prints all the variables currently defined in our
>>   # Makefiles. Alternatively, if a non-empty VARS variable is passed,
>>   # only the variables matching the make pattern passed in VARS are
>>   # displayed.
>>   # show-vars does the same, but as a JSON dictionnary.
>>   .PHONY: printvars
>> -printvars:
>> +printvars: check-make-version
>>          @:
>>          $(foreach V, \
>>                  $(sort $(filter $(VARS),$(.VARIABLES))), \
>> @@ -1077,7 +1084,7 @@ printvars:
>>
>>   .PHONY: show-vars
>>   show-vars: VARS?=%
>> -show-vars:
>> +show-vars: check-make-version
>>          @:
>>          $(info $(call clean-json, { \
>>                          $(foreach V, \
>> --
>> 2.25.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
