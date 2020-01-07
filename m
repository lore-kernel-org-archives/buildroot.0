From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 7 Jan 2020 21:23:33 +0100
Subject: [Buildroot] [PATCH] package/lvm2: install udev rules
In-Reply-To: <20200102152645.9994-1-p.debruijn@unilogic.nl>
References: <20200102152645.9994-1-p.debruijn@unilogic.nl>
Message-ID: <20200107212333.30209e73@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  2 Jan 2020 16:26:45 +0100
Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> Without the device-mapper udev rules, dm devices will not get a proper
> symlink like /dev/disk/by-label/LABEL, which in turn causes fstab
> LABEL= mounts to fails.
> 
> And by extension causes shenanigans with systemd, where it will
> unmount a manually mounted disk because it can't resolve the label.
> 
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  package/lvm2/lvm2.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
