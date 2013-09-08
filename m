From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 8 Sep 2013 16:27:20 +0200
Subject: [Buildroot] autobuild statistics graph
In-Reply-To: <20130908155736.30d50baf@skate>
References: <CAAXf6LW8axKFZpiQFjmqWcFXTEqaHoD3uX=hk5ZSQbmz_7BabA@mail.gmail.com>
 <20130828091036.1a91b786@skate>
 <CAAXf6LWFMtmDpFvZODkd3N_Wsk-VwNP-QVkquRhn3B2aiOjCqg@mail.gmail.com>
 <20130828094824.5f917f48@skate>
 <CAAXf6LWz7_RYds7Zr7kdQHvhYXtNO1WEP+RX+0TTthfZURvi+Q@mail.gmail.com>
 <CAAXf6LVPQVzQpfCdeVrm2yNzEad8j2GS9pnna7YiKVnhTb=MQg@mail.gmail.com>
 <20130908155736.30d50baf@skate>
Message-ID: <CAAXf6LX-_wMVR=Hbm4fjv5WnPYjHChz1gROWWBjxT7Fi-5Afpg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Sep 8, 2013 at 3:57 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Thu, 29 Aug 2013 09:40:41 +0200, Thomas De Schampheleire wrote:
>
>> -$myPicture->drawScale(array("LabelRotation" => 90));
>> +$myPicture->drawScale(array("LabelRotation" => 90, "LabelSkip" =>
>> 10));
>
> Thanks, this works, I've committed this and deployed on autobuild.b.o.
>
> See
> http://git.buildroot.net/buildroot-test/commit/?id=51317ea5ce4ea0244744ff284ecfb98a2743520d.

Thanks, that looks much nicer than before!

What about adding a link to this page from the daily e-mail? Something like:

diff --git a/utils/mail.php b/utils/mail.php
index 93cc2e8..c7cfaa0 100644
--- a/utils/mail.php
+++ b/utils/mail.php
@@ -71,6 +71,8 @@ $contents .= sprintf("%15s : %-3d\n", "failures", $failures);
 $contents .= sprintf("%15s : %-3d\n", "timeouts", $timeouts);
 $contents .= sprintf("%15s : %-3d\n", "TOTAL", $total);

+$contents .= sprintf("\nHistorical overview:
http://autobuild.buildroot.org/stats.php\n");
+
 $sql = "select reason,count(id) as reason_count from results " .
   "where date(builddate) = date(now() - interval 1 day) and status != 0 " .
   $condition .



Best regards,
Thomas
