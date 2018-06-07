From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jun 2018 08:41:12 +0200
Subject: [Buildroot] Can we still opt to shallow clone in git?
In-Reply-To: <CABKM0pCD6pJ3-o9OyhGfpkRyk4cVsKhc+AwqojkzzRvnJvvUSQ@mail.gmail.com>
References: <CABKM0pCD6pJ3-o9OyhGfpkRyk4cVsKhc+AwqojkzzRvnJvvUSQ@mail.gmail.com>
Message-ID: <20180607084112.347c5203@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 7 Jun 2018 14:37:50 +0800, qlb1234 wrote:

> >>> linux master Downloading  

We don't support using a branch as the Git version, since it doesn't do
what users would expect it to do.

> And why does it wants to fetch the linux source from
> http://sources.buildroot.net?

When a download fails, we fallback to sources.buildroot.net.

> I put the kernel settings like this.
> BR2_LINUX_KERNEL_CUSTOM_GIT=y
> BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git at git.myserver.com:myproject/kernel.git"
> BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="master"
> 
> What's a quick work around?

Not use a branch name as BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION but a
commit or tag.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
