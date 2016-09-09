From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 9 Sep 2016 20:25:44 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2016-09-08
In-Reply-To: <20160909063029.5604A101E05@stock.ovh.net>
References: <20160909063029.5604A101E05@stock.ovh.net>
Message-ID: <38cf65e0-d8f5-f400-1610-5765441b1c9e@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 09/09/2016 ? 08:30, Thomas Petazzoni a ?crit :
> Hello,
> 
> This is the list of Buildroot build failures that occured on
> 2016-09-08, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
> 
> Build failures related to your packages:
> 
>          arm |                     efl-1.18.0 | http://autobuild.buildroot.net/results/7d3b5297c80114e37e91c9b44222b207bc8d100c

BR2_PACKAGE_WAYLAND is enabled in this configuration but the new Wayland support
in 1.18.0 requires some more dependencies [1] like libdrm which will be added by
[2]. Also, the wayland support should be reworked to be handled by something like:

config BR2_PACKAGE_EFL_WAYLAND
	bool "Wayland"
	depends on BR2_PACKAGE_EFL_OPENGLES
	select BR2_PACKAGE_EFL_DRM
	select BR2_PACKAGE_EFL_GL_DRM
	select BR2_PACKAGE_WAYLAND

So the Wayland support should be completely disabled for now.

[1] https://www.enlightenment.org/about-wayland
[2] http://patchwork.ozlabs.org/patch/667161.
