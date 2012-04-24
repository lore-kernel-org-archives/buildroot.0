From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 24 Apr 2012 10:31:15 +0200
Subject: [Buildroot] [PATCH 01/22] Remove the DATE variable
In-Reply-To: <CAAXf6LVp-d330GhUgrz_fXcj=k5mYK2K-RyxqLw+7sVRqw4L=g@mail.gmail.com>
 (Thomas De Schampheleire's message of "Tue, 24 Apr 2012 09:43:10
 +0200")
References: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
 <3a993084fda775e7a2c37371225c124fd620a244.1334673910.git.thomas.petazzoni@free-electrons.com>
 <201204211505.51141.arnout@mind.be>
 <871ungi39o.fsf@macbook.be.48ers.dk> <20120422173226.590ca81a@skate>
 <87wr57h776.fsf@macbook.be.48ers.dk>
 <CAAXf6LVp-d330GhUgrz_fXcj=k5mYK2K-RyxqLw+7sVRqw4L=g@mail.gmail.com>
Message-ID: <87bomhh6p8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

Hi,

 Thomas> A disadvantage of adding changing variables like DATE is that
 Thomas> two builds that are built from the exact same set of sources,
 Thomas> are not binary equal. You cannot simply compare the rootfs
 Thomas> image and expect no differences.  You'd have to unpack the
 Thomas> rootfs and compare file by file, leaving out files like
 Thomas> /etc/os-release that would contain a date.

 Thomas> I haven't yet looked at which binaries inside a typical rootfs do
 Thomas> contain such changing variables, but I will do that for my
 Thomas> configuration in the near future. My intention is to ensure binary
 Thomas> equality for the entire rootfs.

I think you'll find that this is quite common. From the top of my head I
know that atleast the Linux kernel and busybox adds the build time to
the binary, so I doubt this will really work.

 Thomas> With this in mind, I would not favor adding a DATE of some kind
 Thomas> to a file in buildroot just to mark a variable as used, unless
 Thomas> we provide a way to override DATE in the config file (in the
 Thomas> Linux kernel, the 'user' and 'machine' etc. build variables are
 Thomas> also overridable.

You can always build with make DATE=foo

-- 
Bye, Peter Korsgaard
