From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 12 Mar 2015 19:55:28 +0200
Subject: [Buildroot] Changing permission recursively
In-Reply-To: <CA+TH9VmbEdw=Zx3C1_fHcnK=FDum+6C6UbsVVad12yR3gmK7AA@mail.gmail.com>
References: <CA+TH9VmbEdw=Zx3C1_fHcnK=FDum+6C6UbsVVad12yR3gmK7AA@mail.gmail.com>
Message-ID: <20150312175527.GO2177@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Angelo,

On Thu, Mar 12, 2015 at 10:08:10AM +0100, Angelo Compagnucci wrote:
> I'm in the process of building a rootfs for a custom application and
> wondering the best way to change permissions recursively for a
> directory.
> 
> What I'm trying to achieve is to add some files via an overlay, but
> files should have a specific owner/permission which should be read
> from the buildroot's users table.
> 
> I cannot find something like that in the documentation. Instead, the
> documentation specifies how to add single files and change
> owner/permission accordingly.
> 
> If I understand correctly, I should create a new user (if necessary)
> with a specific UDI/GID and than use a POST_INSTALL_TARGET to change
> permission using that UID/GID.
> Alternatively, I can use FOO_PERMISSIONS with a per file granularity.
> 
> Is this correct?

How about running the following from a post build script (untested):

	${HOST_DIR}/usr/bin/fakeroot -- chown -R UID:GID ${1}/path/to/directory

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
