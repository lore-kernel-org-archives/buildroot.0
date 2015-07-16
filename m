From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jul 2015 17:18:37 +0200
Subject: [Buildroot] [PATCH v7 20/22] squashfs: Add xattr support
In-Reply-To: <CANQCQpa-dtKQhyPMR5Fnuq8a3HFpZ33efyTjFnXFZDm4SPhvdQ@mail.gmail.com>
References: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1433251718-3167-21-git-send-email-clayton.shotwell@rockwellcollins.com>
 <20150706121602.402373fc@free-electrons.com>
 <CANn-YGTqC=bhPjybxvfbH9sVZ2Vfa6xrvKaRkVOAvKTdCV3byA@mail.gmail.com>
 <20150710222353.637179e9@free-electrons.com>
 <CANQCQpZ=b1oNNCk0viuBpjw9nw9KXMja7q4Z0qGi0Vk3kTj8NA@mail.gmail.com>
 <20150715222138.41336c86@free-electrons.com>
 <CANQCQpa-dtKQhyPMR5Fnuq8a3HFpZ33efyTjFnXFZDm4SPhvdQ@mail.gmail.com>
Message-ID: <20150716171837.160d63d5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthew Weber,

On Wed, 15 Jul 2015 16:55:20 -0500, Matthew Weber wrote:

> > Why is this needed? Can you generate those security attributes at build
> > time?
> 
> If you did you would need to modify the (host) Kernel on your build
> machine to have all of the filesystem types w/ext attributes and
> selinux enabled that you need for the rootfs creation.  Instead we
> build a inbetween QEMU that performs this in a sandbox as a post build
> step.  Then we can build on any unmodified distribution
> (Ubuntu/CentOS/Arch/etc)....

Ah, ok. I was assuming with enough fakeroot-like magic one could achieve
that without having to resort to a sandbox approach like the one you're
using. But anyway that's fine, having xattr support for squashfs on the
target is perfectly fine.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
