From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Apr 2019 22:06:20 +0200
Subject: [Buildroot] [PATCH] package/luajit: bump to version 2.1.x
 developpment version
In-Reply-To: <CAHpTZwkvHogtHue284vA0qUnUT7ygzA3O2Qx=Hdjor3tfKt2Bw@mail.gmail.com>
References: <1554216575-24134-1-git-send-email-jugurtha.belkalem@smile.fr>
 <20190403091856.274fdc7e@windsurf>
 <CAHpTZwkvHogtHue284vA0qUnUT7ygzA3O2Qx=Hdjor3tfKt2Bw@mail.gmail.com>
Message-ID: <54ef5dd8-6497-dfe6-2e5a-d6eebfac3890@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 [Please don't remove the quoted text entirely, but quote inline like below.]

On 03/04/2019 11:15, Jugurtha BELKALEM wrote:
> Hi,
> 
> To answer the question of Fran?ois : The luajit2.1.0-beta3 version in
> http://luajit.org/download.html has not been changed since 2 years (last
> change in May 2017), so I guess it is better to take a version which is up
> to date.

 I feel a bit uncomfortable to bump a package to an unreleased version of a
project that is apparently not going anywhere (only a handful of commits in the
last year).

 Note that any issues are likely to be runtime issues. So it really depends on
the users of luajit (if such users even exist...) to decide if they're willing
to take that risk.


> To answer the question of Thamas : We have successfully tested bcc on a
> raspberry PI 3, however; the purpose of this patch is to check that it does
> not break the build process in buildroot (for example luajit2.1.0 is adding
> support for aarch64; we need to ensure that it is safe).

 So, IIUC, bcc depends on luajit (not plain Lua)? But it is fine with the
existing luajit version, only then you don't have aarch64 support?

 In that case, maybe it's better to make the version dependent on the
architecture, like we sometimes do for other packages. See for instance the arc
versions of binutils, gcc, gdb, glibc.

 Regards,
 Arnout
