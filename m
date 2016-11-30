From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Nov 2016 23:27:12 +0100
Subject: [Buildroot] [PATCH] package/tvheadend: change configuration
 directory
In-Reply-To: <20161130221053.GA3619@free.fr>
References: <20161128094512.27804-1-damjan.marion@gmail.com>
 <20161130221053.GA3619@free.fr>
Message-ID: <20161130232712.636daccd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Nov 2016 23:10:53 +0100, Yann E. MORIN wrote:

> On 2016-11-28 10:45 +0100, Damjan Marion spake thusly:
> > Currently tvheadend configuration is stored in
> > /home/tvheadend/.hts/tvheadend. This patch changes this location
> > to /etc/tvheadend which seems to be more appropriate place.  
> 
> I disagree. This location is not only about "configuration" but also
> about "state". It contains user-specified settings, recordings, DVB scan
> status...
> 
> For example, accesscontrol can be updated from the WebUI to add/remopve
> users or change their rights. I don't remember the full set of stuff
> that gets in there, but there's almost no "configuration", but mostly
> "settings" than can be updated a lot; the most ovious being records (not
> the media streams, but the settings like channel, start and end times...)
> 
> Besides, /etc can be read-only, and we need a writable location. And
> /etc is not a correct location to expect to be writable. /home is most
> probably writable by users (although we do not provide that guarantee in
> Buildroot, it is still much better than /etc).
> 
> So, it does not belong to /etc.
> 
> What was your rationale for moving it, besides "it seems more appropriate" ?

Could we have the configuration in /etc and the state in /var, like most
sane Linux daemons do?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
