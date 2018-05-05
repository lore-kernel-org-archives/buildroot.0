From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 05 May 2018 16:41:55 +0200
Subject: [Buildroot] [PATCH] Makefile: check rootfs overlays with
 BR2_ROOTFS_MERGED_USR enabled
In-Reply-To: <20180505100100.GA2481@scaer> (Yann E. MORIN's message of "Sat, 5
 May 2018 12:01:00 +0200")
References: <20180503121958.9462-1-casantos@datacom.ind.br>
 <20180505100100.GA2481@scaer>
Message-ID: <87po2aupu4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Carlos, All,
 > On 2018-05-03 09:19 -0300, Carlos Santos spake thusly:
 >> Since commit 0db34529f48 we use rsync with the --keep-dirlinks option to
 >> prevent overlays from accidentally overwriding /{usr,bin,sbin,lib} links
 >> when BR2_ROOTFS_MERGED_USR option is enabled. Unfortunately this also
 >> prevents replacing a symlink by a directory on purpose (e.g. /var/log,
 >> to persist system logs).

 > In that case, I suggest your use a post-build script instead.

 > In facct, I think that any modifications that change the layout of the
 > filesystem should be done as a post-build script rather than an overlay.

Why? Overlays is the the recommended way to add/override stuff, and the
'everything-you-put-in-the-overlay-will-override-the-buildroot-defaults'
is a pretty nice and easy to understand behaviour.

-- 
Bye, Peter Korsgaard
