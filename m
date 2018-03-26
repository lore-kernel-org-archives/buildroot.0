From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Mar 2018 23:15:53 +0200
Subject: [Buildroot] [PATCH] lshw: use data files provided by hwdata
In-Reply-To: <20180128044358.6696-1-casantos@datacom.ind.br>
References: <20180128044358.6696-1-casantos@datacom.ind.br>
Message-ID: <20180326231553.220ba9a1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 Jan 2018 02:43:58 -0200, Carlos Santos wrote:
> lshw is seldomly released, so its data files become easily outdated.
> Fortunately it looks for the files in several directories, so let it
> find the files at /usr/share/hwdata, since the hwdata collection is
> released on a monthly basis.
> 
> The manuf.txt and oui.txt files are not used at run time, so it's not
> necessary to install them.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  ...4-For-Buildroot-do-not-install-data-files.patch | 34 ++++++++++++++++++++++
>  package/lshw/Config.in                             |  3 ++
>  2 files changed, 37 insertions(+)
>  create mode 100644 package/lshw/0004-For-Buildroot-do-not-install-data-files.patch

I've applied to master, with the following changes:

    [Thomas:
     - rework commit log
     - replace patch by a simple removal of the /usr/share/lshw directory
     - add "runtime" comment in Config.in for the BR2_PACKAGE_LSHW
       dependency]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
