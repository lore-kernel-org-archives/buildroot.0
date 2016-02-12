From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Feb 2016 14:45:38 +0100
Subject: [Buildroot] [PATCH 1/2] e2fsprogs: remove findfs option
In-Reply-To: <1455223174-5204-1-git-send-email-james.knight@rockwellcollins.com>
References: <1455223174-5204-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20160212144538.600d12a9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Knight,

On Thu, 11 Feb 2016 15:39:33 -0500, James Knight wrote:
> The e2fsprogs package's findfs option provides no capabilities. When the
> option is selected, a symbolic link is generated from findfs to e2label;
> however, e2label will not handle findfs since the respective code is
> explicitly disabled when `--disable-libblkid` is passed in. At this
> time, the e2fsprogs package only supports findfs capabilities when
> building its "private blkid library".
> 
> Note that the `--disable-libblkid` configuration argument must remain
> to prevent conflicts with util-linux's libblkid and an e2fsprogs-
> generated variant (see e1ffc2f791b336339909c90559b7db40b455f172).
> 
> Since e2fsprogs cannot provide findfs capabilities, the option is being
> removed in this change. A following change will be introduced to include
> util-linux's findfs utility.

Thanks for the detailed commit log, very useful.

I see only one thing missing from this commit: Config.in.legacy
handling.

And IMO, this set of two patches should go in for 2016.02.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
