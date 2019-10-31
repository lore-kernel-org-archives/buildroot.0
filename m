From: Matthew Weber <matthew.weber@collins.com>
Date: Thu, 31 Oct 2019 02:30:24 -0500
Subject: [Buildroot] [External] [PATCH v2 1/2] package/netdata: new
 package
In-Reply-To: <20191030093243.2936111-1-m.niestroj@grinn-global.com>
References: <20191030093243.2936111-1-m.niestroj@grinn-global.com>
Message-ID: <CANQCQpZtHBMFJUHxikL2vuYOj7iwnCXwOTQi=Svkk-FHLvuGwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcin,

On Wed, Oct 30, 2019 at 4:33 AM Marcin Niestroj
<m.niestroj@grinn-global.com> wrote:
>
> Always provide --disable-dbengine configuration option, because we do
> not support libjudy dependency that is required otherwise.
>
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
[snip]

> --- /dev/null
> +++ b/package/netdata/netdata.mk
> @@ -0,0 +1,56 @@
> +################################################################################
> +#
> +# netdata
> +#
> +################################################################################
> +

The package's default install step attempts to create folders in
$(TARGET_DIR)/var/lib/netdata, $(TARGET_DIR)/var/cache/netdata, and
$(TARGET_DIR)/var/log/netdata.  For the cache and log cases in the
default Buildroot skeleton, those point to ../tmp and results in a
race condition causing a "file exists error". To fix that target
install issue, I'd propose the following patch be added.

https://pastebin.com/TL3znCJs

Regards,
Matt


> --
> 2.23.0
>
