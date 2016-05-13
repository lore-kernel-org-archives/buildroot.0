From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 13 May 2016 16:48:18 +0300
Subject: [Buildroot] [PATCH] libinput: remove unneeded patch
In-Reply-To: <20160513152314.19eebd42@free-electrons.com>
References: <e86e590ddd7ea6cbc8886ed86d78ee48ae1265db.1463119792.git.baruch@tkos.co.il>
 <20160513075625.GT2419@tarshish>
 <20160513152314.19eebd42@free-electrons.com>
Message-ID: <20160513134818.GU2419@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, May 13, 2016 at 03:23:14PM +0200, Thomas Petazzoni wrote:
> On Fri, 13 May 2016 10:56:25 +0300, Baruch Siach wrote:
> > On Fri, May 13, 2016 at 09:09:52AM +0300, Baruch Siach wrote:
> > > The log_msg symbol conflict was fixed in libevdev commit e4c315fc1603 (Rename
> > > symbols leaking from static library to avoid name clashes, 2014-08-18) that
> > > was included in version 1.3. Remove the patch that used to fix this issue.  
> > 
> > I meant libevdev version in this last line, since it's a libevdev commit. 
> > We're at 1.4.6 on that.
> 
> You're already saying "libevdev" in your commit log. But the fact that
> you're removing a patch from libinput is not clear. I guess it's
> because libinput links against libevdev, but this should be made
> clearer in your commit message.

I see. It's just that the patch being removed itself says:

  This fixes a conflict between libevdev and libinput on the definition
  of the log_msg() symbol.

So I thought is should be self evident.

Should I respin with a clearer commit log?

Thanks for reviewing,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
