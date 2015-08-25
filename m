From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Aug 2015 20:48:33 +0200
Subject: [Buildroot] [PATCH 1/3] [v3] libgudev: New package
In-Reply-To: <1440431056-25983-1-git-send-email-nroach44@gmail.com>
References: <1440431056-25983-1-git-send-email-nroach44@gmail.com>
Message-ID: <20150825204833.57f5a846@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nathaniel,

On Mon, 24 Aug 2015 23:44:14 +0800, Nathaniel Roach wrote:
> As libgudev recently was split from the main systemd/udev source,
> 	this library is now required to build certain packages.
> 
> This library is only relevant to systemd, as the code it contains
> 	is still contained in eudev.
> 
> Add the package and tweak systemd's Config.in message accordingly.
> 
> ---
> Changes v2 -> v3
> (Changes as suggested by Yann E. MORIN)
>  - Separate libgudev and network-manager portions into
> 	discrete patches, and a new patch for libmbim

Applied after doing a few changes:

    [Thomas:
     - don't show the dependency comment when systemd is not available,
       since libgudev is anyway useless when you're not using systemd.
     - fix the license, it's LGPLv2.1+ and not GPLv2+
     - remove useless empty lines in the .mk file.]

In addition to this, two comments:

 * Your SoB line should be before the first "---". Otherwise, it gets
   removed by git when applying the patch (anything after the first
   "---" gets ignored by git in terms of commit log)

 * Don't indent the second line of paragraphs with a tab, we don't do
   this in general for Buildroot commit logs.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
