From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Jun 2019 21:32:00 +0200
Subject: [Buildroot] [PATCH] linux: enable UEVENT_HELPER when mdev is
 used
In-Reply-To: <9f9e57ff-ba24-a4c0-7be8-48e048e4138f@railnova.eu> (Titouan
 Christophe's message of "Mon, 3 Jun 2019 18:44:50 +0200")
References: <20190525130755.25678-1-peter@korsgaard.com>
 <54a85c9f-1e14-de0d-c6cf-8201dea50e1d@mind.be>
 <87mujanw9q.fsf@dell.be.48ers.dk>
 <d3a724b9-b9c9-b399-0f32-b3f93d3511a3@mind.be>
 <87muiyu380.fsf@dell.be.48ers.dk>
 <9f9e57ff-ba24-a4c0-7be8-48e048e4138f@railnova.eu>
Message-ID: <87sgs6heq7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

Hi,

 >> Indeed. Notice that Denys has just merged the daemon mode (-d) support
 >> for mdev, so from a performance PoV, that is probably what we should
 >> support rather than uevent + mdev:
 >> 
 >> http://lists.busybox.net/pipermail/busybox/2019-June/087305.html

 > This is great news !

 > Even then, the S10mdev init script has to be modified to start mdev in
 > daemon mode. I could add this to
 > http://patchwork.ozlabs.org/patch/1107175/. However, I don't see a
 > good way to check if FEATURE_MDEV_DAEMON=y.

We would just forcibly enable that option when building busybox when
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV is enabled, similar to the other
mdev options.

-- 
Bye, Peter Korsgaard
