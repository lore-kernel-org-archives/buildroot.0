From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 13 Mar 2015 12:27:41 +0200
Subject: [Buildroot] Changing permission recursively
In-Reply-To: <CA+TH9V=b-5KdMKQVWkZRZDh31qkKqBTqy+6MdqU3Sr+7wuGFkA@mail.gmail.com>
References: <CA+TH9VmbEdw=Zx3C1_fHcnK=FDum+6C6UbsVVad12yR3gmK7AA@mail.gmail.com>
 <20150312175527.GO2177@tarshish>
 <20150313073131.7a16aeb6@free-electrons.com>
 <CA+TH9V=b-5KdMKQVWkZRZDh31qkKqBTqy+6MdqU3Sr+7wuGFkA@mail.gmail.com>
Message-ID: <20150313102741.GQ2177@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Angelo,

On Fri, Mar 13, 2015 at 07:46:03AM +0100, Angelo Compagnucci wrote:
> 2015-03-13 7:31 GMT+01:00 Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>:
> > On Thu, 12 Mar 2015 19:55:28 +0200, Baruch Siach wrote:
> >
> >> How about running the following from a post build script (untested):
> >>
> >>       ${HOST_DIR}/usr/bin/fakeroot -- chown -R UID:GID ${1}/path/to/directory
> >
> > Does this actually works ?
> >
> > My understanding of fakeroot is that you have to execute all the
> > fakeroot'ed commands under the same fakeroot invocation for the changes
> > made by these commands to actually have an effect.

Right. I forgot that.

> Fakeroot environment is not kept between invocations. You should use
> -i and -s options of fakeroot command if you want to save/restore
> permissions between invocations.
> We should provide a path for the savefile in buildroot to handle this
> scenario, but from my trials, maintaining consistent such file file is
> quite challenging.

Another options is to simply cat a user provided script into 
$(FAKEROOT_SCRIPT) as part of the rootfs image generation at fs/common.mk.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
