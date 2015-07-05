From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Jul 2015 11:01:41 +0200
Subject: [Buildroot] [RFC v4 00/16] Add per-package staging feature
In-Reply-To: <CAHkwnC8yDfpiXyKLFxZHUOA-TT+4xtoHLW32NM03WAb2Yyjq6g@mail.gmail.com>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
 <CAHkwnC8yDfpiXyKLFxZHUOA-TT+4xtoHLW32NM03WAb2Yyjq6g@mail.gmail.com>
Message-ID: <20150705110141.17803801@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 5 Jul 2015 10:51:56 +0200, Fabio Porcedda wrote:

> I've redone all the tests including the case of the patch set without
> using top-level make.
> 
> I've repeated the the test at least two times and taken the minimum value.

How much variation did you had between the test builds for a given
scenario? Taking the minimal value is a somewhat strange choice :)

> defconfig-small:
> | HW-HIGH | HW-MED | top-level make | patch set |
> |----------------|----------------|-----------------------|---------------|
> | 21m17s    | 10m13s   | no                  | no           |
> | 21m24s    | 10m17s   | no                  | yes         |
> |   7m57s    |  5m25s   | yes                 | no           |
> |   7m48s    |  5m22s   | yes                 | yes         |
> 
> defconfig-full:
> | HW-HIGH | HW-MED | top-level make | patch set |
> |----------------|----------------|-----------------------|---------------|
> | 350m       | 199m       | no                  | no           |
> | 355m       | 200m       | no                  | yes         |
> |   74m       |  99m        | yes                 | no           |
> |   76m       |  99m        | yes                 | yes         |
> 
> In these tests the penalty of using pps is 0%-3%.
> Also the reduction of build time using top-level make is 50%-78%
> 
> I think they are nice numbers :)

Yes, they are very good. I guess that if we implement per-package host
dir there will be a small additional impact, but clearly the benefits
of top-level parallel largely outweighs the impact of per-package
staging/host directories.

Thanks a lot for having done those additional tests, it clearly means
we should progressively merge your work on this topic!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
