From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 22:37:00 +0200
Subject: [Buildroot] [PATCH] package/network-manager: bump to version
 1.22.10
In-Reply-To: <20200324142949.287911-1-lkundrak@v3.sk>
References: <20200324142949.287911-1-lkundrak@v3.sk>
Message-ID: <20200329223700.743ad092@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Lubomir,

On Tue, 24 Mar 2020 15:29:49 +0100
Lubomir Rintel <lkundrak@v3.sk> wrote:

> Add separated license files, disable the "cloud configuration" tool. It
> requires libcurl and it is too unlikely to be useful.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

Thanks, but this patch broke legal-info: the hash of CONTRIBUTING has
changed. Also, the change of the hash of COPYING should have been
explained in the commit log (what has changed in COPYING ?).

> -NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.0+ (libnm)
> -NETWORK_MANAGER_LICENSE_FILES = COPYING CONTRIBUTING
> +NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.0+ (libnm), GFDL-1.3 (docs)

The library license is now LGPL-2.1+, this precisely was the change in
the CONTRIBUTING file.

Also, we don't care about the license of the documentation, since we
never install documentation on the target.

I fixed that up, improved the commit log. And applied. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
