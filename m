From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Mar 2015 18:59:37 +0100
Subject: [Buildroot] Obscure bug in Util-Linux umount?
In-Reply-To: <54FF18D4.2030709@ou.edu>
References: <54FE7E8E.20306@ou.edu>
	<54FF18D4.2030709@ou.edu>
Message-ID: <20150310185937.280f8497@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Kenton,

On Tue, 10 Mar 2015 11:16:20 -0500, Steve Kenton wrote:

> Further testing revealed that it only occurs if the embedded root filesystem is read-only
> which I forgot to mention (blush) so it's probably an interaction with a stale /etc/mtab
> or something, but only for the root filesystem and only if the mount point directory names
> are the same, yada etc. Much less likely to bite anyone else so I guess a heads up is not needed.
> 
> Any way, not really a bug but rather a feature with  undefined behaviour and most importantly
> a case of 'it hurts if I do this' soooo  'don't do that'!

Interesting. After reading your e-mail, I had a very quick look at the
kernel side and util-linux side, looking for code using the
s_last_mounted field of the superblock which indeed contains the last
location where it was mounted. But I couldn't spot any place where it
is specifically used to prevent something from happening. But I didn't
spend a lot of time, so I may very well have missed something.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
