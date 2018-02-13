From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 13 Feb 2018 18:14:41 +0200
Subject: [Buildroot] Reg: Add a downloaded tar file directly to rootfs
In-Reply-To: <CAAMHf5FGV7Mj+suBO7133FNpGGh+tXUKuM4rR1SQM4t2deyVaA@mail.gmail.com>
References: <CAAMHf5HizKFeDaj2v=fv0CCNh+pJhmh=Vrs+Gy0LRnKODDSk=A@mail.gmail.com>
 <20180212191719.4lkypyewitvwongq@tarshish>
 <CAAMHf5FGV7Mj+suBO7133FNpGGh+tXUKuM4rR1SQM4t2deyVaA@mail.gmail.com>
Message-ID: <20180213161441.z2sunxu76yhsk6aq@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ravi,

Please keep the list on Cc.

On Tue, Feb 13, 2018 at 03:09:16PM +0530, ravi chandran wrote:
>            Thanks for your response. By the way it is possible to mention a
> custom repo URL  against any config option, so that buildroot can download
> the tar file and copy it inside the BR2_ROOTFS_OVERLAY  location .

BR2_ROOTFS_OVERLAY points to a directory tree that is copied over the rootfs. 
To fetch a tar file from somewhere you can use BR2_ROOTFS_POST_BUILD_SCRIPT, 
and extract it in $TARGET_DIR. See the details in the manual:

  http://nightly.buildroot.org/manual.html#rootfs-custom

baruch

> On Tue, Feb 13, 2018 at 12:47 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> >
> > On Tue, Feb 13, 2018 at 12:10:16AM +0530, ravi chandran wrote:
> > >      I am having a set of directories and files(actually contain some
> > > add-on packages), which needs to be populated inside /srv directory  of
> > > target system. I need a way to download the archived file and put it
> > under
> > > one of the directory of the rootfs. And during the target system
> > > initialization, using init script i will extract the files and populate
> > it
> > > under the /srv directory.
> > >
> > >      could some please provide some hint, what is the right way to do
> > this
> > > in buildroot?
> >
> > You can use BR2_ROOTFS_OVERLAY or BR2_ROOTFS_POST_BUILD_SCRIPT or a
> > combination of both. See the detail on these and other local
> > customizations in
> > chapter 9 "Project-specific customization" of the Buildroot manual:
> >
> >   http://nightly.buildroot.org/manual.html#customize
> >
> > baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
