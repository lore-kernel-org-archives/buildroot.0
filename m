From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 24 Apr 2012 09:43:10 +0200
Subject: [Buildroot] [PATCH 01/22] Remove the DATE variable
In-Reply-To: <87wr57h776.fsf@macbook.be.48ers.dk>
References: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
 <3a993084fda775e7a2c37371225c124fd620a244.1334673910.git.thomas.petazzoni@free-electrons.com>
 <201204211505.51141.arnout@mind.be>
 <871ungi39o.fsf@macbook.be.48ers.dk>
 <20120422173226.590ca81a@skate>
 <87wr57h776.fsf@macbook.be.48ers.dk>
Message-ID: <CAAXf6LVp-d330GhUgrz_fXcj=k5mYK2K-RyxqLw+7sVRqw4L=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Apr 22, 2012 at 9:55 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>
> Hi,
>
> ?Thomas> Well, it's just that I don't very much like to have unused
> ?Thomas> variables here and there. One way to make it useful is for
> ?Thomas> example to store the build date into some file in the target
> ?Thomas> filesystem.
>
> True. We could perhaps add it to /etc/os-release?
>
> http://www.freedesktop.org/software/systemd/man/os-release.html
>

A disadvantage of adding changing variables like DATE is that two
builds that are built from the exact same set of sources, are not
binary equal. You cannot simply compare the rootfs image and expect no
differences.
You'd have to unpack the rootfs and compare file by file, leaving out
files like /etc/os-release that would contain a date.

I haven't yet looked at which binaries inside a typical rootfs do
contain such changing variables, but I will do that for my
configuration in the near future. My intention is to ensure binary
equality for the entire rootfs.

With this in mind, I would not favor adding a DATE of some kind to a
file in buildroot just to mark a variable as used, unless we provide a
way to override DATE in the config file (in the Linux kernel, the
'user' and 'machine' etc. build variables are also overridable.

Best regards,
Thomas
