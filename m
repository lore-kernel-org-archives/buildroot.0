From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 20 Apr 2017 08:26:04 +0300
Subject: [Buildroot] uboot-tools autobuild failures
In-Reply-To: <CANQCQpb0U3tO7Z-Lsz1pxmekaKYC8JyU7BJgtcXwLDWDgh1xNw@mail.gmail.com>
References: <CANQCQpb0U3tO7Z-Lsz1pxmekaKYC8JyU7BJgtcXwLDWDgh1xNw@mail.gmail.com>
Message-ID: <20170420052604.qyirbyf2xr4rfyiu@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,

On Wed, Apr 19, 2017 at 08:55:58PM -0500, Matthew Weber wrote:
> It looks like all of these recent failures are because the python swig
> build does a "$(if $(shell which swig 2> /dev/null),_libfdt.so)" to
> determine if the host system has swig and if so, try to build the
> python bindings.  Obviously not taking into account any prefix we'd
> provide to the host/ in out build.
> 
> http://autobuild.buildroot.org/?reason=uboot-tools-2017.03
> 
> I don't directly have a need for those bindings, would a patch that
> disables this swig detect be reasonable at this point?  Other option
> would be to rewrite how they're doing it to search a prefix path vs
> using the shell's which.  Then work upstreaming of that change.

This was discussed in the past with no conclusion.

http://lists.busybox.net/pipermail/buildroot/2017-March/187638.html
http://lists.busybox.net/pipermail/buildroot/2017-March/187681.html
http://lists.busybox.net/pipermail/buildroot/2017-March/187700.html

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
