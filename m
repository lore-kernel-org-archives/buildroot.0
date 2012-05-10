From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 May 2012 13:04:44 +0200
Subject: [Buildroot] [PATCH 5/5] Added host targets to gnupg and its
 prerequisite libraries.
In-Reply-To: <1336598986-9518-5-git-send-email-stijn.souffriau@essensium.com>
References: <1336598986-9518-1-git-send-email-stijn.souffriau@essensium.com>
 <1336598986-9518-5-git-send-email-stijn.souffriau@essensium.com>
Message-ID: <20120510130444.0aef3383@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed,  9 May 2012 23:29:46 +0200,
Stijn Souffriau <stijn.souffriau@essensium.com> a ?crit :

> ---
>  package/gnupg/gnupg.mk               |   11 +++++++++++
>  package/libassuan/libassuan.mk       |    5 +++++
>  package/libgcrypt/libgcrypt.mk       |    1 +
>  package/libgpg-error/libgpg-error.mk |    1 +
>  package/libksba/libksba.mk           |    5 +++++
>  package/libpth/libpth.mk             |    5 +++++
>  6 files changed, 28 insertions(+), 0 deletions(-)

I am not sure we want to support building gnupg for the host. It is not
needed as a build time dependency of anything, and gnupg is available
in virtually all GNU/Linux distributions, and as far as I know, there
are no specific version compatibility problems that would require the
gnupg version on the host to be exactly the same as the one used on the
target.

I'd like to avoid seeing Buildroot replacing the package management
system of the host distribution, for tools that are as common as gnupg.
Things like u-boot-tools, or sam-ba require packages because they are
typically not available in Linux distros, but it's not the case of
gnupg.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
