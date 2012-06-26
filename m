From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 26 Jun 2012 09:07:46 +0100
Subject: [Buildroot] [PATCH resend] owl-linux: new package
In-Reply-To: <20120626093557.2de31adb@skate>
References: <1340651389-7856-1-git-send-email-spdawson@gmail.com>
 <20120626093557.2de31adb@skate>
Message-ID: <CAHt8ZCOE0ZfTQh2kw54YCEhS3tUSUSGVP9dAoQc8K31r2=4wyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the feedback Thomas.

On 26 June 2012 08:35, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> The patches of the package should have a
> Signed-off-by line, but otherwise, I'm not seeing any other issue.

Okay; I'll fix that and resubmit.

> Maybe group the ARM9 and EABI checks into one comment? And maybe make
> it visible only on ARM?
>
> comment "owl-linux is only supported on ARM9 architecture with EABI"
> ? ? ? ?depends on !(BR2_arm920t || BR2_arm922t || BR2_arm926t) || !BR2_ARM_EABI
> ? ? ? ?depends on BR2_arm
>
> or something like that.

Good idea; I will do this.

> At some point in the discussion, it was mentioned that this driver
> might only work with one particular CodeSourcery toolchain, which would
> suggest that it uses the C library, and therefore contain userspace
> code. But here you're only installing the kernel module itself. Could
> you clarify this point, just for our (my?) knowledge?

I'm using the Buildroot-generated uClibc-based toolchain, and have had
no problems so far. The kernel module installed by this package is all
that is required to make the H&D Wireless hardware work.

Simon.
