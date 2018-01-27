From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 27 Jan 2018 22:55:19 +0200
Subject: [Buildroot] post image blues (fakeroot and chown)
In-Reply-To: <8AE4BE7D9622DF41B76E1AD887AA1A47A52ED7C0@MARCM-SBS2011.marcmltd.local>
References: <8AE4BE7D9622DF41B76E1AD887AA1A47A52ED7C0@MARCM-SBS2011.marcmltd.local>
Message-ID: <20180127205519.tau3p34feo4uwx7x@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marc,

On Fri, Jan 26, 2018 at 03:52:23PM +0000, Marc Murphy wrote:
> I am in the final stages of getting the buildroot image output configured 
> and having an issue.
> 
> I have a couple of folders that I am using as partitions on the target. The 
> images are created using genimage in the post-image.sh script before being 
> included in the final complete image. But I have an issue with the folder 
> permissions and trying to correct them before the image is built.
> 
> On a normal linux system I would of course perform a:
> # sudo chown -R 0:0 some_folder
> 
> That would put the permissions in to the correct root user and group.
> 
> This can't be done in the post-image script as cannot use sudo as it 
> requires intervention of entering password.
> 
> I have then been trying to use fakeroot and it simply refuses to 
> persistently change the owner and group, ll will show creator when not 
> logged in as fakeroot but root when logged in as fakeroot.
> 
> Is there any "standard" way to do this ?

The standard way is to use BR2_ROOTFS_DEVICE_TABLE. See ?9.5.1 (Setting file 
permissions and ownership and adding custom devices nodes) in the Buildroot 
manual:

  https://buildroot.org/downloads/manual/manual.html#rootfs-custom

For more complicated changes that require root permissions, you can use 
BR2_ROOTFS_POST_FAKEROOT_SCRIPT (see the link above).

Hope this helps,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
