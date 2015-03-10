From: Steve Kenton <skenton@ou.edu>
Date: Tue, 10 Mar 2015 11:16:20 -0500
Subject: [Buildroot] Obscure bug in Util-Linux umount?
In-Reply-To: <54FE7E8E.20306@ou.edu>
References: <54FE7E8E.20306@ou.edu>
Message-ID: <54FF18D4.2030709@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/10/2015 12:18 AM, Steve Kenton wrote:
> I *think* this is an obscure bug in the util-linux version of umount, but I wonder if anyone else has run into it. It drove me nuts for a while. Here's a short description.

Further testing revealed that it only occurs if the embedded root filesystem is read-only
which I forgot to mention (blush) so it's probably an interaction with a stale /etc/mtab
or something, but only for the root filesystem and only if the mount point directory names
are the same, yada etc. Much less likely to bite anyone else so I guess a heads up is not needed.

Any way, not really a bug but rather a feature with  undefined behaviour and most importantly
a case of 'it hurts if I do this' soooo  'don't do that'!

Sorry for the noise.

Steve
