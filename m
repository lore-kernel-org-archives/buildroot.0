From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Oct 2013 16:31:46 +0200
Subject: [Buildroot] [PATCH] pkg-infra: log current message
In-Reply-To: <1381058388-24055-1-git-send-email-yann.morin.1998@free.fr>
References: <1381058388-24055-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20131006163146.4b566599@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  6 Oct 2013 13:19:48 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> In order to help the auto-builders (our own, or in-house ones),
> just log the current message in a file that contains:
>     Package: $($(PKG)_NAME)
>     Version: $($(PKG)_VERSION)
>     Action : Last '>>>' message displayed
> 
> For example:
>     Package: host-fakeroot
>     Version: 1.18.2
>     Action : Configuring
> 
> If there is no package, then the package name and version are
> empty, eg.:
>     Package:
>     Version:
>     Action : Generating root filesystem image rootfs.tar
> 
> Also, all messages are logged to a file, one per line, with the
> date each message was generated at, as the number of seconds
> elapsed since Epoch.
> 
> This will hopefully help autobuilders extract the real reason for
> a failure, and take appropriate action (eg. bug-mail the last
> git-author of a package...)
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

This looks interesting, but I'm wondering if this shouldn't be
conditional under a BR2_<something> configuration option that the
autobuilders would enable?

I'm thinking of other things this option could enable, such as some
sanity checks at the end of the build, that we want to do in the
autobuilders, but not necessarily in normal builds.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
