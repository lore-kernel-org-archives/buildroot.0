From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 13 Nov 2013 14:44:58 +0100
Subject: [Buildroot] [PATCH v2] infra: introduce github helper function
In-Reply-To: <52837FBB.3010200@mind.be>
References: <1384345469-8967-1-git-send-email-mjonker@synopsys.com>
 <CAAXf6LXddF50q9C=PyTVoOSY1x0wC2=RXxd+n6E5MpakxHonYQ@mail.gmail.com>
 <52837FBB.3010200@mind.be>
Message-ID: <CAAXf6LUTA7t7r93WVXRurhMa7oBFJUYTYiYDZtcf4aTOLBu8dA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 13, 2013 at 2:33 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 13/11/13 14:15, Thomas De Schampheleire wrote:
>> Regarding the defconfigs: Arnout suggested adding the $(call github)
>> there as well. However, I'm not very fond of that: if you run 'make
>> savedefconfig' later it will not be preserved.
>
>  Why would it not be preserved?
>
>  The only real disadvantage is that it looks very ugly:
>
> BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux-sunxi,linux-sunxi,274a66a7bfcbaabb88d63e4eba161965383cc416)/linux-sunxi-274a66a7bfcbaabb88d63e4eba161965383cc416.tar.gz"

Ah, my bad. It would be preserved, indeed.

It does look awkward, but I am not strongly against nor for changing it.

But: what will be the strategy for the defconfigs with respect to
using git / http-tarball ? In a defconfig, a version bump of, say, the
kernel is actually easier with the git method, since you only have to
update BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION, while with a tarball
(with or without the github helper) you need to update the version
number in two places inside a long string.
FYI: currently the nitrogen6x defconfig uses a tarball, the others
(cubieboard, cubieboard2, raspberrypi, calao_snowball) use git.

Best regards,
Thomas
