From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Oct 2012 08:53:55 +0200
Subject: [Buildroot] [PATCH] netatalk: bump version
In-Reply-To: <1349108616-5814-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1349108616-5814-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20121025085355.379e9cb3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Mon,  1 Oct 2012 18:23:36 +0200, Maxime Hadjinlian wrote:
> Netatalk goes to version 3.0.
> The startup script has changed too, there is now only one binary called
> netatalk. No more afpd, cnid, ... at startup ! They are executed by netatalk.
> 
> All the config is done within /etc/afp.conf, look at :
> http://netatalk.sourceforge.net/3.0/htmldocs/upgrade.html
> for more info about the upgrade process.
> ---
>  package/netatalk/S50netatalk |   32 +++++++++++---------------------
>  package/netatalk/netatalk.mk |    4 ++--
>  2 files changed, 13 insertions(+), 23 deletions(-)

This update is apparently breaking the build in certain configurations:
http://autobuild.buildroot.net/results/4fada48332abc7f9bcd49a70debbc7950bc2263a/build-end.log

I see that your package as a dependency on berkeyleydb, but somehow,
the configure script fails to find it.

Can you look into it?

See
http://autobuild.buildroot.net/results/4fada48332abc7f9bcd49a70debbc7950bc2263a/
for the full configuration files.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
