From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 15 May 2016 13:55:05 +0200
Subject: [Buildroot] [PATCH] libinput: fix missing static_assert symbol
In-Reply-To: <20160515094941.7402c3fa@gmx.net>
References: <9c014a2f0264db4085efccf537f76e8f1993c27b.1463282640.git.baruch@tkos.co.il>
 <20160515053404.GA658@tarshish> <20160515094941.7402c3fa@gmx.net>
Message-ID: <20160515135505.71404da2@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Sun, 15 May 2016 09:49:41 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Baruch,
> 
> On Sun, 15 May 2016 08:34:04 +0300, Baruch Siach <baruch@tkos.co.il> wrote:
> 
> > Hi Buildroot list,
> > 
> > On Sun, May 15, 2016 at 06:24:00AM +0300, Baruch Siach wrote:
> > > static_assert() in from C++. Don't use it in C code.
> > 
> > This is wrong. As upstream developer Jonas ?dahl pointed out, C11 also defines 
> > static_assert as a convenience macro for _Static_assert. uClibc{,-ng} however 
> > that does not provide this macro. Would it make sense to disable libinput for 
> > uClibc{,-ng}?
> 
> Or honor the second part of Jonas answer [1]: '... or define a no-op fallback
> when it is not defined.'
> 
> Seems a less radical solution than disable complete package (plus dependencies)
> for uClibc because of a minor issue?
> 

Thinking more about it, I think your suggested patch is a good enough solution
for buildroot purpose, so you can add my

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

in case you change the patch descriptions to mention it is not a C++ thing but
static_assert is from C11 standard [2] (and besides your patch changes the logic
from compile time error to possible run time error (dependent on NDEBUG flag)...

Regards,
Peter

[2] http://en.cppreference.com/w/c/error/static_assert

> Regards,
> Peter
> 
> 
> [1] https://lists.freedesktop.org/archives/wayland-devel/2016-May/028877.html
> 
> > 
> > baruch
> > 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
