From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 22:25:34 +0200
Subject: [Buildroot] [PATCH] linux-pam: unavailable for static builds
In-Reply-To: <1406762091-11590-1-git-send-email-gustavo@zacarias.com.ar>
References: <1406762091-11590-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140731222534.2f8cdc84@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 30 Jul 2014 20:14:51 -0300, Gustavo Zacarias wrote:
> Fixes:
> http://autobuild.buildroot.net/results/3bb/3bb8d4662995a11e8e6cc5fdaaba9e25d4c0e0ec/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/linux-pam/Config.in  |  6 ++++--
>  package/rsh-redone/Config.in | 16 ++++++++++------
>  package/util-linux/Config.in | 16 ++++++++++------
>  3 files changed, 24 insertions(+), 14 deletions(-)

I spent quite a bit of time messing up with --enable-static-modules in
linux-pam, in the hope to prove you I can get it to build in a static
fashion. But linux-pam build system doesn't handle the fact that it
should build libpam, then the modules, then libpam again with the
modules linked into it.

Therefore, I've applied your patch, after adding a few more details as
a comment in linux-pam's Config.in file.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
