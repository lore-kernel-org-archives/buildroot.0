From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 08 Apr 2018 10:37:35 -0300
Subject: [Buildroot] [PATCH] download/git: fix trasnform-name
References: <20180408082451.GA2327@scaer>
Message-ID: <5aca1b1f9255d_54812aab6caf6364376b7@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Apr 08, 2018 at 05:24 AM, Yann E. MORIN wrote:

>> 2 packages are fixed by this patch:
>> 18xx-ti-utils
>> before: https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/61769469
>> after: https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/61769909
>> linux-firmware
>> before: https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/61769511
>> after: https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/61769952
>> 
>> All failures with this patch:
>> https://gitlab.com/RicardoMartincoski/buildroot/pipelines/20146714/failures
>> at91bootstrap3 v3.8.6, gummiboot, kvm-unit-tests, kvmtool, mcelog, trace-cmd,
>> uemacs, xloader
>> also occured for 2018.02:
>> https://gitlab.com/RicardoMartincoski/buildroot/pipelines/20146633/failures
> 
> Sorry, but I'm not following. You mean that 18xx-ti-utils and
> linux-firmware are already broken on 2018.02? That is strange, because
> we haven't backported those git download changes in the LTS branch...

No. Sorry I did not explain clearly.
For these 2 packages:
2018.02:           OK
master:            FAIL
master+this_patch: OK

While testing your patch I detected unrelated failures (not necessarily an error
on Buildroot side) using both master and 2018.02. Few packages failed with your
patch. Then I tested without your patch to check it was not a regression. The
test results confirmed it was not a regression.

It doesn't mean 2018.02 is wrong either, maybe it is a temporary issue on the
remote git server, maybe the url just got outdated.
See http://patchwork.ozlabs.org/patch/896012/ for all links and the brief
initial analysis for the cause of each failure.
The best candidate to need to be fixed is at91bootstrap3 v3.8.6 hash, maybe it
was generated (in 2016) with a now-black-listed tar version?

> 
> And indeed, I can't reproduce the issue locally, using tar-1.29. What
> version of tar are you using? We've recently black-listed 1.26 and
> below, and now require 1.27 <= tar <= 1.29

Both the docker image and my computer have tar 1.29.

Regards,
Ricardo
