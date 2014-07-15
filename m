From: =?UTF-8?Q?Ezequiel_Garc=C3=ADa?= <ezequiel@vanguardiasur.com.ar>
Date: Tue, 15 Jul 2014 16:49:04 -0300
Subject: [Buildroot] [PATCH] u-boot: Allow to specify a list of patches
In-Reply-To: <20140715205341.77237719@free-electrons.com>
References: <1405448794-10517-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20140715205341.77237719@free-electrons.com>
Message-ID: <CAAEAJfB7bjvsdGCOc+5Rzt39ERfvfC=sSYKtKUtGwDLXiBDLdA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15 July 2014 15:53, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Ezequiel Garcia,
>
> On Tue, 15 Jul 2014 15:26:34 -0300, Ezequiel Garcia wrote:
>> It's often desirable to specify a list of patches, in addition to the current
>> support to pass a directory full of uboot-*.patch files. This matches the
>> option currently available for specifying Linux patches, except this commit
>> doesn't add the URL option. Relying on URLs is fragile and makes a build hard
>> to reproduce.
>>
>> U-Boot is as special as Linux, in the sense that it needs to be customized more
>> often than not, so having a flexible mechanism is useful.
>>
>> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>> ---
>>  Config.in.legacy     | 14 ++++++++++++++
>>  boot/uboot/Config.in | 11 ++++++-----
>>  boot/uboot/uboot.mk  | 12 ++++++++----
>>  3 files changed, 28 insertions(+), 9 deletions(-)
>
> We now have BR2_GLOBAL_PATCH_DIR, so I believe that what we would
> recommend to use from now on. We have even been talking about removing
> the Linux-specific and U-Boot specific patching config options.
>

Yeah, Yann already said that on IRC when I asked him about this patch.
You guys are really in sync! :)

The thing is that Linux and U-Boot are not the regular package, since
almost every BR user using it for a custom product will need to
customize the kernel and the bootloader to some extent.

At least from my perspective, it's nice to have the patches (instead
of pointing to some git branch) and be forced to see what
modifications I'm using.

And to produce the patches, I use git-format-patch (aren't we all?),
which doesn't allow to specify a prefix for the patches. This has been
discussed and rejected, so don't think the feature will ever be added.

Sure, I can use a script, but these options seemed natural enough and
it allows for a simple "git-format-patch" run and dump the files to a
directory.

Anyway... this is just my use case. I understand your desire to remove
strange options and reduce the churn.
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
