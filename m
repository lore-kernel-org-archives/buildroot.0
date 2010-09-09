From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 9 Sep 2010 14:48:32 +0200
Subject: [Buildroot] mdev handling
In-Reply-To: <20100909140007.6f3d0874@surf>
References: <AANLkTi=XLJvtakS=nKMYyybTJdtoVvgaA3NFkBSMivHu@mail.gmail.com>
	<87occ8cnr8.fsf@macbook.be.48ers.dk>
	<AANLkTikYk3m7bJXa4r6yY3CEW6xOxhtr9w2Ea62=WhZv@mail.gmail.com>
	<20100909121902.0b5c3bc7@surf>
	<AANLkTikGk1E9g_ve1kHzH9FQLLVFnLQFNANuXCymWK3W@mail.gmail.com>
	<20100909140007.6f3d0874@surf>
Message-ID: <AANLkTimSa8mC0O5FNWXB7g_6Dn7DQMc3-VqEzo7j4Gmo@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> What should "Using devtmfs" make? Enable/disable this option in
>> kernel?
>
> Yes, probably, and make sure that devtmpfs is mounted as needed
> (/etc/fstab).

Does it have to be mounted? It is made by the kernel just after
mounting the rootfs (at least there is such a kernel option):

CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y

So our initial /etc/fstab is sufficient for this purpose.

Yegor
