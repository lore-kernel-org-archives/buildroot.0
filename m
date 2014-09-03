From: =?UTF-8?B?VmluY2VudCBTdGVobMOp?= <vincent.stehle@freescale.com>
Date: Wed, 3 Sep 2014 19:14:47 +0200
Subject: [Buildroot] [PATCH] imx6sabresd: boot to /init in mfgtools mode
In-Reply-To: <CADCpmyNfWhXzG2ud=XQFdZdpvvM2XhSM-ABM47TOy2kqDmLTgg@mail.gmail.com>
References: <1407833366-21448-1-git-send-email-vincent.stehle@freescale.com>
 <CADCpmyNfWhXzG2ud=XQFdZdpvvM2XhSM-ABM47TOy2kqDmLTgg@mail.gmail.com>
Message-ID: <54074C87.7030807@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/26/2014 06:13 AM, Gary Bisson wrote:
(..)
> The patch looks fine however shouldn't it be pushed to u-boot directly?
> Also, as it can be changed through u-boot commands I'm not sure it is
> necessary.

Hi Gary,

How are you?

Now it's my turn to apologize for the very late answer; I am sorry.

About pushing to upstream u-boot; I am a bit reluctant to push this
patch to upstream u-boot because I think that booting to the /init
wrapper when using a ramdisk is a buildroot specificity (from fs/cpio/init).
  I certainly would not like to break the default behavior in upstream
u-boot, even in mfgtools mode, which is to call /linuxrc right now.

You are also right that the same functionality can be obtained from the
u-boot command line, but that means a user interaction. The goal of
adding this u-boot patch at buildroot level is to allow a
fully-automated boot of a buildroot filesystem through USB without user
interaction.
  (See [1] for more details on the whole procedure.)

What is your opinion on that, please?

Also, now that I have been very slow to answer to your e-mail, a nice
patches series from Luca has been around [2], which renames the config file.
  After a quick try, rebasing with git seems to be free, but do you
prefer that I send a v2 rebased on those, just in case?

Best regards,

V.

[1] https://community.freescale.com/docs/DOC-101842
[2] http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/92418
