From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Dec 2019 15:01:40 +0100
Subject: [Buildroot] [PATCH/next v3 2/5] package/ti-sgx-{km, um,
 demos}: bump to latest TI version
In-Reply-To: <20191115125001.28255-3-unixmania@gmail.com>
References: <20191115125001.28255-1-unixmania@gmail.com>
 <20191115125001.28255-3-unixmania@gmail.com>
Message-ID: <20191230150140.0f8167d5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 Nov 2019 09:49:58 -0300
unixmania at gmail.com wrote:

> From: Lothar Felten <lothar.felten@gmail.com>
> 
> ti-sgx-um
> 
> - Bump the version that matches TI SDK 06.00.00.07 plus one pull request
>   that updates the EGL/GLES headers required to build qt5base.
> - Rewrite the init script, following the current template and using the
>   pvrsrvctl command (pvrsrvinit does not exit anymore).
> - Remove powervr.ini, no longer used in the TI SDK.
> - Select and add a dependency on wayland, or else packages that link to
>   libEGL (e.g. cairo) fail to link due to a missing libwayland-server.
> - Update license file name.
> 
> ti-sgx-demos
> 
> - Bump the version that matches TI SDK 06.00.00.07 plus one pull request
>   (matching ti-sgx-um).
> 
> ti-sgx-km
> 
> - Bump the version that matches TI SDK 06.00.00.07.
> - Remove stray empty lines.
> - Fix license file path.
> 
> All packages
> 
> - Use HTTP to clone Git repositories.
> - Update URL in Config.in files, pointing to cgit and using HTTPS.
> - Add hashes for all license files.
> 
> The buildroot package only supports the target am335x. Support for other
> boards can be added by adding menu entries to select the correct target
> product.
> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
> Signed-off-by: Carlos Santos <unixmania@gmail.com>

I had to propagate the udev dependency from ti-sgx-libgbm, and then
applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
