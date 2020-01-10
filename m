From: Carlos Santos <unixmania@gmail.com>
Date: Fri, 10 Jan 2020 11:34:53 -0300
Subject: [Buildroot] [PATCH] package/libpam-tacplus: fix build for nios2
In-Reply-To: <20200110151346.00a462d8@windsurf>
References: <20200110121439.16180-1-unixmania@gmail.com>
 <20200110151346.00a462d8@windsurf>
Message-ID: <CAJ4jsaeoYbSZwcBNarp3Wk8-O6iU+yyxgnq5HPnOzNiKWeXyXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 10, 2020 at 11:13 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Fri, 10 Jan 2020 09:14:39 -0300
> unixmania at gmail.com wrote:
>
> > From: Carlos Santos <unixmania@gmail.com>
> >
> > Pull an upstream patch that prevents compilation errors due to an unused
> > return value.
> >
> > Add patch not yet applied upstream to prevent another failure because of
> > the formatters used to print size_t and ssize_t values.
> >
> > Upstream status: https://github.com/kravietz/pam_tacplus/pull/136
> >
> > Fixes:
> >   http://autobuild.buildroot.net/results/cf15b09bd7501c017a4e8cf9fb80857197d4a433/
> >
> > Signed-off-by: Carlos Santos <unixmania@gmail.com>
>
> Thanks. Your commit title saysa "fix build for nios2". Indeed, the
> autobuilder failures are only on nios2, but I don't see how this
> problem is nios2 specific. Isn't it more specific to a particular
> version of gcc, the kernel headers or C library ?

The failure due to the unused return value happens because pam_tacplus
by default uses the -Werror flag, so any recent GCC would trigger it.
Anyway, the upstream code already avoids the problem.

I didn't have time to check the printf formats on other architectures
but it's certainly not specific to nios2, since it is related to the
actual size and type size of size_t.

-- 
Carlos Santos <unixmania@gmail.com>
