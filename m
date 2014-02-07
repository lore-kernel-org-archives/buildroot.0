From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Fri, 7 Feb 2014 13:19:49 -0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140207161407.375d1d43@skate>
References: <20140207073009.C5A85100E3A@stock.ovh.net>
 <20140207135324.4c7cbe3f@skate>
 <CAAEAJfAOUEyLD=UqWwjQ9gQZrFtSshk496M_8hnYmz=tN-cGNw@mail.gmail.com>
 <20140207155511.7ad8ec55@skate>
 <CAAEAJfAU4iwiFCAdyYgHx7G6iH_31C=jDO7MtXodvCdy1H-GnQ@mail.gmail.com>
 <20140207161407.375d1d43@skate>
Message-ID: <CAAEAJfA0Os3YxtzgfzfpKpwJNSgu=df3FfK7HbuEveAV_RqVig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 7 February 2014 12:14, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Ezequiel Garc?a,
>
> On Fri, 7 Feb 2014 13:07:22 -0200, Ezequiel Garc?a wrote:
>
>> Old nios2 kernel ports does not have setns system call. I've confirmed
>> at least v3.7 (the one I use on production stuff) lacks setns. Latest
>> v3.12 (development kernel) *does* support setns.
>>
>> I guess the toolchain people just set it to be unimplemented.
>>
>> Want a patch masking lxc package on nios2?
>
> If indeed most nios2 kernels do not support the setns system call,
> that's probably the best solution. Moreover, I would say it's fairly
> unlikely that people would use nios2 to do Linux Containers, no?
>

You can bet on that any day.

> Be sure to indicate above the dependency why it was added:
>
>         # nios2 kernels do not provide the setns syscall
>         depends on !BR2_nios2
>
> Thanks!
>

Sure.
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
