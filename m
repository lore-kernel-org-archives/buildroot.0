From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Apr 2021 22:54:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/gerbera: bump to version 1.8.0
In-Reply-To: <20210413082354.1470458-1-joerg.krause@embedded.rocks>
References: <20210413082354.1470458-1-joerg.krause@embedded.rocks>
Message-ID: <20210419225437.57d1c421@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 13 Apr 2021 10:23:54 +0200
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Also recreate config.xml by building and running Gerbera using:
> 
> ```
> ~/buildroot/output/target/usr/bin/gerbera --create-config > package/gerbera/config.xml
> 
> ```
> 
> Note, that Gerbera sets the `<home>` parameter now to the runtime user's home by
> default when generating the script. This is not appropriate when running Gerbera
> on an embedded Linux system as we usually do not have multiple users or even
> users at all. Therefore, we set the home directory to /var/lib/gerbera`.
> 
> As this directory is not created when installing Gerbera to the target,
> it is created by the start script.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/gerbera/S99gerbera   |   3 +
>  package/gerbera/config.xml   | 144 +++++++++++++++++------------------
>  package/gerbera/gerbera.hash |   2 +-
>  package/gerbera/gerbera.mk   |   2 +-
>  4 files changed, 73 insertions(+), 78 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
