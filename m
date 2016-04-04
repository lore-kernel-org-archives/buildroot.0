From: Steve Calfee <stevecalfee@gmail.com>
Date: Mon, 4 Apr 2016 10:57:03 -0700
Subject: [Buildroot] [PATCH] linux: use zImage by default on ARM
In-Reply-To: <1459452866-23060-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1459452866-23060-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAJJ6jxu=KscT+V-fAiqo16E673tnk7Zo2j+=OaVqicQYQ4YVUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 31, 2016 at 12:34 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Since quite some time, the kernel and bootloader communities consider
> zImage as the default format for kernel images on ARM, replacing
> uImage. The load address information in uImage is no longer needed,
> since the kernel is position-independent in terms of physical address,
> except on a few old platforms. For most people, using zImage is simply
> better/simpler, so let's switch to zImage as the default image format
> on ARM.
>
> All defconfigs are updated: 46 defconfigs no longer need to select
> explicitly zImage because it's the default, and 16 defconfigs now need
> to explicitly select uImage because that's no longer the default.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---

Is this a good idea? Doesn't this break external configs that use
uImage? Changing a default is a serious change.

Regards, Steve
