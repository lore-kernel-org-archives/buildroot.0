From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 12 Aug 2015 07:38:16 +0300
Subject: [Buildroot] [PATCH] wf111: Add mdev dependency
In-Reply-To: <CAE21AQqJwCZMRDj3C+JEHjoNJvprxhZusW6TTfNWVwLaL7UziA@mail.gmail.com>
References: <1439277422-26111-1-git-send-email-cdhmanning@gmail.com>
 <20150811114020.GD25261@tarshish>
 <CAE21AQqJwCZMRDj3C+JEHjoNJvprxhZusW6TTfNWVwLaL7UziA@mail.gmail.com>
Message-ID: <20150812043816.GG25261@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Charles,

On Wed, Aug 12, 2015 at 08:11:08AM +1200, Charles Manning wrote:
> Are you saying I should explain here or in the commit notice?

In commit log.

> Actually udev would work too.

Recent kernels gained the ability to load firmware directly without any help 
form userspace, so this is probably another option.

> The wf111 driver set uses hotpug to perform the firmware patching
> (loading .xbv files).
> 
> From what I have experienced, fw patching is required when you first
> fire up a new module and when you change modes (sta only vs ap).

Since there are different ways to load the firmware we generally don't make 
firmware or driver packages build depend on any specific firmware loading 
mechanism.

baruch

> On Tue, Aug 11, 2015 at 11:40 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> > On Tue, Aug 11, 2015 at 07:17:02PM +1200, Charles Manning wrote:
> >> wf111 really needs mdev
> >
> > Please explain why.

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
