From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 07 Nov 2014 07:07:46 -0300
Subject: [Buildroot] [PATCH 0/7] [RFC] systemV init without busybox
	series
In-Reply-To: <CABbD_XDLDuUNQWQRhK4KjAmVmZgTTUbZuJnXR=+83kMK_Xm23g@mail.gmail.com>
References: <1415281013-1077-1-git-send-email-gustavo@zacarias.com.ar>	<20141106182413.198106d0@free-electrons.com>	<545BB09D.2080805@zacarias.com.ar>
 <CABbD_XDLDuUNQWQRhK4KjAmVmZgTTUbZuJnXR=+83kMK_Xm23g@mail.gmail.com>
Message-ID: <545C99F2.8070208@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/07/2014 06:12 AM, K?roly Kasza wrote:

> Hello guys,

Hello.

> first, I'm happy that somebody else has the more/less same aim as me: to
> make Buildroot able to create a more full Linux experience.
> I think there are still some fundamental Linux tools' full versions are
> missing, like shadow-utils to make Busybox circumventable,
> but that's another story.

My objective for this is differnet, somewhat less ambitious, which is to
get the option of SysV-init without busybox in a workable/clean state,
otherwise why are we given an option that's broken?

> Regarding start-stop-daemon: I think that while downloading, configuring
> and compiling dpkg is a more straight solution to get st-st-d, it's a
> bit unnecessary to just get one .c file to produce one simple binary.
> For this patch, I mostly used package/cache-calibrator as a template,
> which basically does the exact same method.

In general i try to make things clean and without patches if possible
since it helps future version bumps where patches might not apply
cleanly. Also the policy in general is to make patches upstreamable
which isn't the case.
But ultimately it's not my decision and i'm doing a "dirty trick" (so to
speak) in that i'm using a very full package as a small one. You're
doing the same, just in another way.
So my dilemma and reason not to send the dpkg/start-stop-daemon package
is that, well, should be ship it with the small and lean trick or do so
as dpkg with unrealistic expectations this will bring from some users?

> Also, I think patching may still be needed for st-st-d for uClibc
> compatibility, as uClibc tend not to have the O_NOFOLLOW preprocessor
> macro declared in fcntl.h if __USE_GNU is not defined - and I think dpkg
> configure does not define that?

That's because you're stripping everything out, that's taken care of in
autotools and lib/compat, see, there's a reason for it :)
Regards.
