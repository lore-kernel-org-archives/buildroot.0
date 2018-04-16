From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 16 Apr 2018 15:31:43 +0300
Subject: [Buildroot] makedev capabilities support - capablities lost
 after booting the image
In-Reply-To: <1523881062231-0.post@n4.nabble.com>
References: <1523881062231-0.post@n4.nabble.com>
Message-ID: <20180416123143.jinljoxct6srmvzf@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alex,

On Mon, Apr 16, 2018 at 05:17:42AM -0700, AAlex_ wrote:
> setting the cappabilities of an executable via BR2_ROOT_FS_DEVICE_TABLE as
> descripted in [9.5.1. Setting file permissions and ownership and adding
> custom devices nodes] fails.
> When capabilities specified to an file they are set in the disk image, means
> if i mount the disk image file and check via getcap it get the excpected
> capabilities. 
> But if the builroot system boots, the capablities are lost.
> Is there another lib/flag? The buildroot system supports capabilities
> because I set it via an startscript within buildroot system, but this is not
> longer possible because I want to swtich to read only root_fs. This is the
> reason I want to set the capablilities via device_table.

Not all filesystems support extended attributes. What filesystem do you use? 
How do you generate your filesystem?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
