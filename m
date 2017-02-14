From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 14 Feb 2017 18:01:23 +0200
Subject: [Buildroot] [BUILDROOT] Add a text file on "/tmp" directory
 during img compilation
In-Reply-To: <o7v72q$48j$1@blaine.gmane.org>
References: <288390896.7283593.1487081370913.ref@mail.yahoo.com>
 <288390896.7283593.1487081370913@mail.yahoo.com>
 <o7v72q$48j$1@blaine.gmane.org>
Message-ID: <20170214160123.3ewogltceen2c34i@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Grant, Thierry,

On Tue, Feb 14, 2017 at 03:17:46PM +0000, Grant Edwards wrote:
> On 2017-02-14, <thierry.xenomai43@yahoo.com> <thierry.xenomai43@yahoo.com> wrote:
> > I would like to add a text files and bin?files on "/tmp" directory
> > during the image making.
> 
> https://buildroot.org/downloads/manual/manual.html#rootfs-custom
> 
> You can configure buildroot to run a script after the root tree is
> done but but before the final image is created by setting the
> BR2_ROOTFS_POST_BUILD_SCRIPT option. Look under
> 
>   System Configuration
>     Custom scripts to run before creating filesystem images
> 
> In that script you can add/delete/remove files from the tree.
> 
> If all you want to do is add files, you can use the BR2_ROOTFS_OVERLAY
> option to point to a tree that is copied on top of the target tree.

That won't work with the default Buildroot configuration, since tmpfs is 
mounted over /tmp. You need to supply your own skeleton if you want to 
override this. See 'System configuration' -> 'Root FS skeleton' in menuconfig.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
