From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 29 Aug 2013 10:40:27 +0200
Subject: [Buildroot] autobuild statistics graph
In-Reply-To: <20130829101513.60e3eb48@skate>
References: <CAAXf6LW8axKFZpiQFjmqWcFXTEqaHoD3uX=hk5ZSQbmz_7BabA@mail.gmail.com>
 <20130828091036.1a91b786@skate>
 <CAAXf6LWFMtmDpFvZODkd3N_Wsk-VwNP-QVkquRhn3B2aiOjCqg@mail.gmail.com>
 <20130828094824.5f917f48@skate>
 <CAAXf6LWz7_RYds7Zr7kdQHvhYXtNO1WEP+RX+0TTthfZURvi+Q@mail.gmail.com>
 <CAAXf6LVPQVzQpfCdeVrm2yNzEad8j2GS9pnna7YiKVnhTb=MQg@mail.gmail.com>
 <20130829101513.60e3eb48@skate>
Message-ID: <CAAXf6LUW_=aWd9MUncyoPKSnVruL3RkEqDzN5-AgvSiH5VQS5g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Aug 29, 2013 at 10:15 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

>
> Another great thing would be to draw some thin vertical lines at the
> dates of the various releases (-rc1, -rc2, final and so on), so we can
> see if the rate of failures/success correlate with releases or not.
> It'd be fun, but I'm not sure it's really worth the effort because
> besides the releases themselves, another major thing causes big
> variations in the rate of success/failure: when I had a new toolchain
> for a new architecture, or a new configuration type (eg. static
> builds). I believe those changes in the configuration of the
> autobuilders are causing more variations in the results than the
> release cycles themselves.
>

Yes, I also considered that having the releases indicated in the graph
would be interesting. In fact, if we'd have these big moments shown in
the graph, the actual dates wouldn't really matter anymore and could
be hidden completely IMO.

If you still have the info about when some of the big changes (like
new toolchain etc.) was done, we can definitely put that alongside the
release milestones.

How to best store the milestones (in the database or in the graph.php
file itself), I'm not sure. They'll probably need to be manually
updated, but that could be done both in the database as in graph.php.
How to show these milestones in the graph is also not entirely clear.
I can't find a way to pass some custom x values to  pChart. One
solution is to manipulate the date array from php before passing it to
pChart. This way, if we have a map between date (as it appears in the
database) and event, we can replace the dates by the events, and make
all other strings empty. This should give the desired result I think.
