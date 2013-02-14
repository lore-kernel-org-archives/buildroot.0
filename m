From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Feb 2013 09:32:37 +0100
Subject: [Buildroot] disable downloaded source cache
In-Reply-To: <CAKAx1cjXjZscmy-D8Fa0WDqt-GotQoavBMr_SCSOJZdnyEwcqg@mail.gmail.com>
References: <CAKAx1cjcxkBq67w_DV7sFK_Z+7X9+WkMuEkVWiswWgsq-Eskig@mail.gmail.com>
 <511C16E2.4010105@mind.be>
 <CAKAx1cjXjZscmy-D8Fa0WDqt-GotQoavBMr_SCSOJZdnyEwcqg@mail.gmail.com>
Message-ID: <20130214093237.0953545c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lionel Orry,

On Thu, 14 Feb 2013 09:11:30 +0100, Lionel Orry wrote:

> Well I have a cleaner way actually that I used previously, which is to
> use a ROOTFS_POST_BUILD build script that clones the repository and
> 'rsync' it on the target rootfs, I was mainly wondering if I could
> achieve the same using the ROOTFS_OVERLAY feature. It seems it's not
> enough for my needs, so I will actually stick to my previous
> ROOTFS_POST_BUILD script and forget about ROOTFS_OVERLAY.

Yes, I think you're right. The ROOTFS_OVERLAY feature was added to help
people that are in the simple case of a rootfs overlay stored in
board/<something>/<foobar>/, and make the possibility of using a rootfs
overlay more practical to use for newcomers.

However, for more complicated/specific cases, using the post-build
script remains the right option.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
