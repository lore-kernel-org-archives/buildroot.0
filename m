From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 08:48:23 +0200
Subject: [Buildroot] Using linux-zigbee ?
In-Reply-To: <20170721035311.lj4g7b4fugewmr55@tarshish>
References: <20170720225710.076f8086@windsurf>
 <20170721035311.lj4g7b4fugewmr55@tarshish>
Message-ID: <20170721084823.0fca155c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Jul 2017 06:53:11 +0300, Baruch Siach wrote:

> > In addition, linux-zigbee now fails to build with gcc 7.x:
> > http://autobuild.buildroot.net/results/29c/29c72bc38042305310576be945c721b2fad95894/build-end.log.  
> 
> The fix[1] for that (remove -Werror) is quite easy, you don't even need to 
> patch the code.

Ah, yes, I missed the fact that it was a warning-turned-into-an-error
class of problem. Thanks for spotting this!

> > Do you still use linux-zigbee ? Or could we remove it from Buildroot in
> > favor of wpan-tools ?  
> 
> Buildroot carries packages that are deprecated/abandoned for much longer than 
> that (e.g. wireless_tools). The command line interface difference between 
> linux-zigbee and wpan-tools is a good enough reason to keep linux-zigbee, IMO.

True, but at some point, we'll have to get rid of some old unmaintained
packages.

Perhaps we should at least update the help text of linux-zigbee to make
it clear it shouldn't be used for new projects ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
