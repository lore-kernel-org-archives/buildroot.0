From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 09:39:21 +0200
Subject: [Buildroot] [PATCH] .gitlab-ci.yml: add check-DEVELOPERS test
In-Reply-To: <ce22c0a4-37b9-a065-aaac-8ee34801cf97@mind.be>
References: <20170630164253.19859-1-arnout@mind.be>
 <20170630200237.1378f5dd@windsurf.home>
 <ce22c0a4-37b9-a065-aaac-8ee34801cf97@mind.be>
Message-ID: <20170701093921.2654efaf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 1 Jul 2017 09:36:02 +0200, Arnout Vandecappelle wrote:

> >> +check-DEVELOPERS:
> >> +    script:
> >> +        - PYTHONPATH=$PWD/support/scripts
> >> +                python -c 'from getdeveloperlib import parse_developers; parse_developers()' |
> >> +                grep . && exit 1  
> > 
> > Isn't "./support/scripts/get-developer -c" doing the right thing?  
> 
>  The problem with that is that it produces a lot of output, and the warnings are
> at the top. So I would have to grep for WARNING. But some of the possible errors
> don't have a WARNING in front of them. So I started out changing the script to
> add WARNING for those as well. But then I thought: keep things simple, just call
> parse_developers directly.
> 
>  Perhaps it would be a little more transparent to add a __main__ to
> getdeveloperlib and then call it with "python support/scripts/getdeveloperlib.py".

Or a proper option to get-developers that does whatever check you want?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
