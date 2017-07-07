From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Jul 2017 11:57:13 +0200
Subject: [Buildroot] [PATCH 1/3] mtd: fix build issues on older hosts
In-Reply-To: <a942a235-97d6-f1ab-dde6-35525bea8bbf@mind.be>
References: <20170706205849.22298-1-thomas.petazzoni@free-electrons.com>
 <20170707100232.0115d847@windsurf.lan>
 <a942a235-97d6-f1ab-dde6-35525bea8bbf@mind.be>
Message-ID: <20170707115713.3c5d2694@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 7 Jul 2017 10:21:36 +0200, Arnout Vandecappelle wrote:

> > Patches 1 and 2 applied. Thanks Arnout for the review.  
> 
>  Unfortunately you missed Baruch's comment...

Dammit :-/

And still, I did notice and fixed a mistake that neither you nor Baruch
spotted:

"""
So today, the target variant continues to depend on util-linux, while
the target variant depends on e2fsprogs. 
"""

Obviously the second "target variant" should have been "host variant",
and I fixed that before pushing.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
