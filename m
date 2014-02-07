From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Fri, 7 Feb 2014 13:07:22 -0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140207155511.7ad8ec55@skate>
References: <20140207073009.C5A85100E3A@stock.ovh.net>
 <20140207135324.4c7cbe3f@skate>
 <CAAEAJfAOUEyLD=UqWwjQ9gQZrFtSshk496M_8hnYmz=tN-cGNw@mail.gmail.com>
 <20140207155511.7ad8ec55@skate>
Message-ID: <CAAEAJfAU4iwiFCAdyYgHx7G6iH_31C=jDO7MtXodvCdy1H-GnQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 7 February 2014 11:55, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
[..]
>
> Have a look at config.log to see why it fails to detect that setns() is
> available.
>

Thanks for the tip:

| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_setns || defined __stub___setns
| choke me
| #endif

Old nios2 kernel ports does not have setns system call. I've confirmed
at least v3.7 (the one I use on production stuff) lacks setns. Latest
v3.12 (development kernel) *does* support setns.

I guess the toolchain people just set it to be unimplemented.

Want a patch masking lxc package on nios2?
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
