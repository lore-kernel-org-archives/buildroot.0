From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 10 Dec 2012 19:18:53 +0100
Subject: [Buildroot] Alternate sources for custom Linux kernels
In-Reply-To: <CAE21AQogKvT+PpiXuy62-rkRKkT5N0pQF9n=qywuYZQWfbuhuQ@mail.gmail.com>
References: <CAE21AQogKvT+PpiXuy62-rkRKkT5N0pQF9n=qywuYZQWfbuhuQ@mail.gmail.com>
Message-ID: <CAAXf6LXkhaW0T7FGh0R+nKDFOut8auRfqoQ-U4jrAMCPeZpxSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Charles,

On Mon, Dec 10, 2012 at 4:11 AM, Charles Manning <cdhmanning@gmail.com> wrote:
> Hello root builders
>
> I am working on a project that stores everything, including a custom
> Linux kernel, under svn rather than git. Yes... I know, i know....
> we'll leave that discussion for another day!
>
> I also sometimes need to point to a kernel in a local directory.
>
>
> It seams that the place to modify is linux/linux.mk ( and
> linux/Config.in to create new configs to match).
>
> It seems there are two ways of approaching this:
>
> 1) Create a whole lot of new defines parallel to the existing *GIT*
> defines eg. BR2_LINUX_KERNEL_CUSTOM_SVN_REPO_URL
> -or-
> 2) Rationalize the existing stuff into
> BR2_LINUX_KERNEL_CUSTOM_SITE (can be anything from svn, http,...)
> and
> BR2_LINUX_KERNEL_CUSTOM_METHOD (selects one of the legal
> xxx_SITE_METHODs [wget, scp,svn...]
>
> It would seem that (2) gives something far more flexible and less verbose.
>
> Does this sound useful?


I have two patches lingering around to add support for hg repostories
in the Linux and U-boot makefiles.
In these patches I renamed the *_GIT_REPO_URL and *_GIT_REPO_REV
variables to the same without _GIT_, and then re-used these variables
in the HG case. This is more or less towards alternative 2 you
propose.

So obviously, to me it sounds a good idea.
I'll try to post my hg patches one of these days, they may be a start
also for your svn support.

Best regards,
Thomas
