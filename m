From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 29 Aug 2013 09:40:41 +0200
Subject: [Buildroot] autobuild statistics graph
In-Reply-To: <CAAXf6LWz7_RYds7Zr7kdQHvhYXtNO1WEP+RX+0TTthfZURvi+Q@mail.gmail.com>
References: <CAAXf6LW8axKFZpiQFjmqWcFXTEqaHoD3uX=hk5ZSQbmz_7BabA@mail.gmail.com>
 <20130828091036.1a91b786@skate>
 <CAAXf6LWFMtmDpFvZODkd3N_Wsk-VwNP-QVkquRhn3B2aiOjCqg@mail.gmail.com>
 <20130828094824.5f917f48@skate>
 <CAAXf6LWz7_RYds7Zr7kdQHvhYXtNO1WEP+RX+0TTthfZURvi+Q@mail.gmail.com>
Message-ID: <CAAXf6LVPQVzQpfCdeVrm2yNzEad8j2GS9pnna7YiKVnhTb=MQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Aug 28, 2013 at 10:02 AM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> Hi Thomas,
>
> On Wed, Aug 28, 2013 at 9:48 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Thomas De Schampheleire,
>>
>> On Wed, 28 Aug 2013 09:42:45 +0200, Thomas De Schampheleire wrote:
>>
>>> > Sounds sane. How would you compute what the reference is? Look at the
>>> > build results of the last 30 days (i.e the ones that appear on the
>>> > plot) ?
>>>
>>> I was actually thinking of using the current calculated percentages.
>>> So say on day 1 there are 100 builds, with 70 successful, and on day 2
>>> there have been 50 builds with 25 successful, then I would plot 70%
>>> for the first day and 50% for the second.
>>
>> Ah right, makes sense. The percentages are in fact already shown in the
>> table above.
>>
>>> Given the variation in the configurations that are being built, a
>>> rising success line from one day to the next cannot be interpreted as
>>> an absolute reduction of bugs (could have been 'chance' because the
>>> bad configurations weren't built on the second day) but if you look at
>>> the trend it should tell us something.
>>
>> Right.
>>
>>> Here is some untested code that I think should do the trick (I don't
>>> have a PHP environment at hand here):
>>
>> Your patch is now live at http://autobuild.buildroot.org/stats.php and
>> it seems to work. If you confirm, then I'll commit and push your patch,
>> with you as the author.
>
> That looks good, yes, thanks for testing so quickly.
> One consideration: although the table doesn't have to be larger, the
> 30 days for the graph is somewhat limited. If we want to see a trend,
> then I think a few months can be more interesting. So what about
> changing the SQL query to, say, 180 days (6 months) ?

It seems you already made this change, thanks.

The x axis is now a bit crowded, below untested patch should make it a
bit more readable, could you check?

diff --git a/web/graph.php b/web/graph.php
index 7ac37d8..5585ee5 100644
--- a/web/graph.php
+++ b/web/graph.php
@@ -50,7 +50,7 @@
$myPicture->setFontProperties(array("FontName"=>"../externals/pchart/fonts/verda
 /* Define the boundaries of the graph area */
 $myPicture->setGraphArea(70,50,650,400);

-$myPicture->drawScale(array("LabelRotation" => 90));
+$myPicture->drawScale(array("LabelRotation" => 90, "LabelSkip" => 10));

 $myPicture->drawLegend(20,20,array("Style"=>LEGEND_NOBORDER,"Mode"=>LEGEND_HORIZONTAL));


Best regards,
Thomas
