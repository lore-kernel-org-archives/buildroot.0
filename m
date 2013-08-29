From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Aug 2013 10:15:13 +0200
Subject: [Buildroot] autobuild statistics graph
In-Reply-To: <CAAXf6LVPQVzQpfCdeVrm2yNzEad8j2GS9pnna7YiKVnhTb=MQg@mail.gmail.com>
References: <CAAXf6LW8axKFZpiQFjmqWcFXTEqaHoD3uX=hk5ZSQbmz_7BabA@mail.gmail.com>
 <20130828091036.1a91b786@skate>
 <CAAXf6LWFMtmDpFvZODkd3N_Wsk-VwNP-QVkquRhn3B2aiOjCqg@mail.gmail.com>
 <20130828094824.5f917f48@skate>
 <CAAXf6LWz7_RYds7Zr7kdQHvhYXtNO1WEP+RX+0TTthfZURvi+Q@mail.gmail.com>
 <CAAXf6LVPQVzQpfCdeVrm2yNzEad8j2GS9pnna7YiKVnhTb=MQg@mail.gmail.com>
Message-ID: <20130829101513.60e3eb48@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 29 Aug 2013 09:40:41 +0200, Thomas De Schampheleire wrote:

> > That looks good, yes, thanks for testing so quickly.
> > One consideration: although the table doesn't have to be larger, the
> > 30 days for the graph is somewhat limited. If we want to see a trend,
> > then I think a few months can be more interesting. So what about
> > changing the SQL query to, say, 180 days (6 months) ?
> 
> It seems you already made this change, thanks.
> 
> The x axis is now a bit crowded, below untested patch should make it a
> bit more readable, could you check?

Yeah, I did some experiment, but as you say the X axis was crowded, and
I didn't had the time to investigate.

> diff --git a/web/graph.php b/web/graph.php
> index 7ac37d8..5585ee5 100644
> --- a/web/graph.php
> +++ b/web/graph.php
> @@ -50,7 +50,7 @@
> $myPicture->setFontProperties(array("FontName"=>"../externals/pchart/fonts/verda
>  /* Define the boundaries of the graph area */
>  $myPicture->setGraphArea(70,50,650,400);
> 
> -$myPicture->drawScale(array("LabelRotation" => 90));
> +$myPicture->drawScale(array("LabelRotation" => 90, "LabelSkip" => 10));
> 
>  $myPicture->drawLegend(20,20,array("Style"=>LEGEND_NOBORDER,"Mode"=>LEGEND_HORIZONTAL));

I'll definitely try this out, thanks!

Another great thing would be to draw some thin vertical lines at the
dates of the various releases (-rc1, -rc2, final and so on), so we can
see if the rate of failures/success correlate with releases or not.
It'd be fun, but I'm not sure it's really worth the effort because
besides the releases themselves, another major thing causes big
variations in the rate of success/failure: when I had a new toolchain
for a new architecture, or a new configuration type (eg. static
builds). I believe those changes in the configuration of the
autobuilders are causing more variations in the results than the
release cycles themselves.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
