From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 27 Jul 2012 07:21:39 -0300
Subject: [Buildroot] [PATCH 2/3] ncurses: bump to 5.9
In-Reply-To: <20120727085945.1b6339ab@skate>
References: <1343328590-1803-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1343328590-1803-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <50119743.3090505@zacarias.com.ar> <20120727085945.1b6339ab@skate>
Message-ID: <50126BB3.2070502@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/27/12 03:59, Thomas Petazzoni wrote:

> Le Thu, 26 Jul 2012 16:15:15 -0300,
> Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :
> 
>> Nack.
>> The version bump to 5.8 and 5.9 had issues in the past and still has.
>> It may compile just fine but it segfaults miserably in a target, chroot
>> or qemu image.
>> Simple test, i586 target with external toolchain, build less and see.
> 
> There must something odd: both Yocto and PTXdist are using ncurses 5.9,
> so I presume it works for them. So it's not as simple as
> "cross-compilation breaks ncurses 5.9", it's something more subtle than
> that.
> 
> Thomas

Yes, i agree it's pretty much some little thing.
I did some tests in the past and it doesn't seem to be configure options
related (didn't try everything around, just what would be more obvious
to cause such a failure).
Yet OpenWRT, which is BR's closest relative, still uses 5.7, maybe they
didn't care about bumping it or hit the same issue.
I'll give it another shot later today.
Regards.
