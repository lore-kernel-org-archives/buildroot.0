From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 19 Apr 2019 09:55:36 +0200
Subject: [Buildroot] [PATCH] package/luajit: bump to version 2.1.x
 developpment version
In-Reply-To: <54ef5dd8-6497-dfe6-2e5a-d6eebfac3890@mind.be>
References: <1554216575-24134-1-git-send-email-jugurtha.belkalem@smile.fr>
 <20190403091856.274fdc7e@windsurf>
 <CAHpTZwkvHogtHue284vA0qUnUT7ygzA3O2Qx=Hdjor3tfKt2Bw@mail.gmail.com>
 <54ef5dd8-6497-dfe6-2e5a-d6eebfac3890@mind.be>
Message-ID: <481d2280-a981-cd2e-1640-b12b9c8349ce@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 14/04/2019 ? 22:06, Arnout Vandecappelle a ?crit?:
>  [Please don't remove the quoted text entirely, but quote inline like below.]
> 
> On 03/04/2019 11:15, Jugurtha BELKALEM wrote:
>> Hi,
>>
>> To answer the question of Fran?ois : The luajit2.1.0-beta3 version in
>> http://luajit.org/download.html has not been changed since 2 years (last
>> change in May 2017), so I guess it is better to take a version which is up
>> to date.
> 
>  I feel a bit uncomfortable to bump a package to an unreleased version of a
> project that is apparently not going anywhere (only a handful of commits in the
> last year).

luajit2.1.0-beta3 doesn't seems a release version but it's packaged by Debian
testing, Fedora 26+, Ubuntu 18.04.

https://repology.org/project/luajit/versions

> 
>  Note that any issues are likely to be runtime issues. So it really depends on
> the users of luajit (if such users even exist...) to decide if they're willing
> to take that risk.

ok

> 
>> To answer the question of Thamas : We have successfully tested bcc on a
>> raspberry PI 3, however; the purpose of this patch is to check that it does
>> not break the build process in buildroot (for example luajit2.1.0 is adding
>> support for aarch64; we need to ensure that it is safe).
> 
>  So, IIUC, bcc depends on luajit (not plain Lua)? But it is fine with the
> existing luajit version, only then you don't have aarch64 support?

exact.

> 
>  In that case, maybe it's better to make the version dependent on the
> architecture, like we sometimes do for other packages. See for instance the arc
> versions of binutils, gcc, gdb, glibc.

Ok, maybe we should be careful with API break between 2.0.x and 2.1.x...

Best regards,
Romain

> 
>  Regards,
>  Arnout
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
