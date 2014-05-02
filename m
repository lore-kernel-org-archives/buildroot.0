From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 02 May 2014 15:09:56 +0200
Subject: [Buildroot] [PATCH] configs/raspberrypi: use the branch name
	instead of the sha1 for the linux kernel
In-Reply-To: <1399034711-12550-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 2 May 2014 14:45:11 +0200")
References: <1399034711-12550-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <874n18pbrv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Previously, when we were using the rpi-3.10.y branch, we coiuld use a sha1 to
 > refer to a specific changeset, and that would work and give reproducible
 > builds, thanks to upstream merging linux-stable into their branch.

 > Now they have declared rpi-3.12.y the new stable branch, and deprecated the
 > rpi-3.10.y branch.

 > Unfortunately, they are now rebasing the rpi-3.12.y branch instead of merging
 > linux-stable as they used to do. This means we can no longer use a sha1 as the
 > tree will change as soon as upstream rebases onto a new linux-stable.

 > There are two possibilities here:
 >   - revert back to using a rpi-3.10.y cset
 >   - use the rpi-3.12.y branch name

 > This patch goes with the second option, since rpi-3.10.y is no longer maitained,
 > and we prefer to use a stable branch, at the cost of reproducible builds.

Hmm, but that means that the builds are not reproducable :/

Can't we convince them to create a new branch whenever they rebase or
something like that?

-- 
Bye, Peter Korsgaard
