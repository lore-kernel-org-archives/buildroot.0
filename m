From: Gervais, Francois <FGervais@distech-controls.com>
Date: Tue, 22 Sep 2020 15:16:10 +0000
Subject: [Buildroot] [PATCH 1/1] package/kismet: bump version to
 2020-09-R2
In-Reply-To: <20200919215928.7be3eb0f@windsurf>
References: <20200918175953.6888-1-fgervais@distech-controls.com>
 <20200919142131.34999f64@windsurf.hq.k.grp>
 <DM6PR01MB3755BB8C323A54CF26EECA9EF33C0@DM6PR01MB3755.prod.exchangelabs.com>,
 <20200919215928.7be3eb0f@windsurf>
Message-ID: <DM6PR01MB3755DA31D2099BC957591F2EF33B0@DM6PR01MB3755.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm flattered that my patch could complement a patch from one of the top contributors but I must
say, I fail to see what.

I tried Fabrice's patch, first it works. So that's out of the way.

It also adds obsolete parameters to the Config.in.legacy which I forgot.

Like me it can install just the capture tools or the whole thing. His config layout is better though
as on my side you could disable everything so kismet would get built but nothing would get installed
which is kinda weird. In his case when you select kismet you'll get the capture tools, then you get the
option to install the server or not.

In my patch I would just build everything and do a partial install. In his case he actually uses a config
option to disable building things that won't get installed. Obviously better.

He also changes the installation so when you install the capture tools only they are setuid so you
don't have to run them as root. To me setuid seems unsecure but kismet has a clear message stating
that this is actually more secure so nothing to say here.

I cannot comment on the python tools though as my target doesn't have python so I didn't try them.

Did I miss something?


From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Sent: September 19, 2020 3:59 PM
To: Gervais, Francois <FGervais@distech-controls.com>
Cc: buildroot at buildroot.org <buildroot@buildroot.org>; Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/kismet: bump version to 2020-09-R2 
?
Hello,

On Sat, 19 Sep 2020 17:42:13 +0000
"Gervais, Francois" <FGervais@distech-controls.com> wrote:

> From what I can see, Fabrice seems to have the better patch.
> I'll give it a try on monday, see if it works on my end and report here.

Well, your patch did contain a number of other changes that Fabrice's
version did not, so it would be good to compare them, and pick the best
of both :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
