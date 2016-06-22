From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 22 Jun 2016 19:58:23 -0300
Subject: [Buildroot] [PATCH] glibc: bump default to version 2.23
In-Reply-To: <57d9d2a6-9bcc-c512-4e09-6eb8f8958c76@mind.be>
References: <1466590187-21862-1-git-send-email-gustavo@zacarias.com.ar>
 <87r3bpwa02.fsf@dell.be.48ers.dk>
 <42d8119e5e64c7a67018770b3f029146@zacarias.com.ar>
 <20160622171317.79fbea7e@free-electrons.com>
 <312f3b85fab01ed234da9ff79ac982d0@zacarias.com.ar>
 <877fdhw8ek.fsf@dell.be.48ers.dk>
 <57d9d2a6-9bcc-c512-4e09-6eb8f8958c76@mind.be>
Message-ID: <576B180F.70309@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/06/16 17:38, Arnout Vandecappelle wrote:

>   My take on this: we should follow the stable branch of upstream. Since glibc
> has no concept of stable branches (in fact, none of the libc's do), we really
> should follow upstream releases aggressively.
>
>   In fact, I think it's quite unreasonable that we don't have stable updates for
> glibc (or any other libc). As a distro, it's our responsibility to make sure our
> users get stable updates, particularly for something as important as glibc.
> Since we (currently) don't have the bandwidth to do that, and since there simply
> is no viable upstream to rely on [*], we should probably consider dropping the
> multi-version glibc... Topic for discussion at the next BR developer meeting.
>
>
>   Regards,
>   Arnout
>
>   [*] I've checked if we could use another distro, but most are on glibc 2.19...
> Debian would be an option for glibc 2.22, but for 2.23 and 2.24 there will
> probably no viable distro.

Hi.
My $.02: Ubuntu 16.04 LTS is on 2.23.
In general we haven't seen big regressions with glibc upgrades compared 
to binutils/gcc.
Also, and don't take this as cockyness, i'm like the only one (except 
for Bernd one time) putting out security patches for glibc.
Currently my spare time is pretty thin, and backporting patches for two 
versions of glibc and testing them is much more work than a single version.
If we default to n-1 this means carrying on more patches since generally 
n-1 has more vulnerabilities than n when talking about glibc.
If in consequence i only post patches for n and we default to n-1, well, 
that sucks plain and simple, since we would be shipping known-vulnerable 
by default, and how many users will bother to switch to latest glibc?
Regards.
