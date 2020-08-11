From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Aug 2020 23:52:02 +0200
Subject: [Buildroot] [PATCH 1/1] linux: set default aufs series and
 version based on kernel version
In-Reply-To: <20200809115545.GR2186@scaer>
References: <20200808231411.105185-1-james.hilliard1@gmail.com>
 <20200809115545.GR2186@scaer>
Message-ID: <20200811235202.26322c34@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 9 Aug 2020 13:55:45 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> On 2020-08-08 17:14 -0600, James Hilliard spake thusly:
> > Set default commits for aufs to the latest available commit in each
> > version specific branch.  
> 
> No, this is not correct: you are using the kernel headers version, while
> the aufs version depends on the running kernel version.
> 
> For external toolchains, the defaults is thus most probably very wrong,
> as the kernel headers version are rarely, if ever, matching the running
> kernel one. And for internal toolchains, even though the default is to
> have the headers match the running kernel version, this is not
> guaranteed either.
> 
> I prefer there is no default, than an incorrect one.

I agree: this is unfortunately not something we can do in a reliable
way in Buildroot today. To make this possible, we would have to ask the
user to indicate at the Config.in level which "main" kernel version has
been configured.

So here, I would simply suggest to extend the Config.in help text
around AUFS to more clearly explain how to get the right aufs version
depending on the chosen kernel version.

BEst regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
