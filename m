From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 12 May 2014 22:59:40 +0200
Subject: [Buildroot] Discussing libudev,
	was: Re: [PATCH v6 09/32] mesa3d: dri2 does not need udev support
References: <pil74bx9op.ln2@ID-313208.user.individual.net>
 <20140512205324.GD3619@free.fr>
Message-ID: <sap74bxb7p.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
news:20140512205324.GD3619 at free.fr: 

> Now, this should be well integrated with the existing udev providers.

Hi,

reading the current code I am not sure what BR2_PACKAGE_HAS_UDEV means.

Currently only eudev and systemd select BR2_PACKAGE_HAS_UDEV, both are system 
daemons while libudev being only a subset of them. I am not sure if libudev 
should be a udev provider at all. My current patch includes

depends on !BR2_INIT_SYSTEMD
depends on !BR2_PACKAGE_EUDEV

Regards, Bernd
