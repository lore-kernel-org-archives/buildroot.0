From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Jan 2020 22:23:39 +0100
Subject: [Buildroot] Upcoming glibc-2.31 breaks busybox, strace.
In-Reply-To: <BN8PR12MB28683E6EF9441AEBAB2CF685D90F0@BN8PR12MB2868.namprd12.prod.outlook.com>
References: <BN8PR12MB28683E6EF9441AEBAB2CF685D90F0@BN8PR12MB2868.namprd12.prod.outlook.com>
Message-ID: <2cb40bdc-2c78-6edd-bcea-3db5cbba3ba7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23/01/2020 12:56, Evgeniy Didin wrote:
> Hi Thomas, all,
> 
> In February 2020 the new release of glibc is going to happen. There are at least
> two packages known which latest releases
> fail to build with latest revision of glibc: Busybox and strace.
> 
> For "strace" there is a patch in master branch which solves the error:
> https://github.com/strace/strace/commit/9afd83c11cb78a04954daaedb54b20214a35ec9c
> 
> For busybox there are at least two patches required:
> https://git.buildroot.net/busybox/commit/?id=6937487be73cd4563b876413277a295a5fe2f32c
> https://git.buildroot.net/busybox/commit/?id=d3539be8f27b8cbfdfee460fe08299158f08bcd9
> 
> Should we introduce these patches now or should we wait until glibc-2.31 is
> introduced in buildroot?

 It doesn't hurt to introduce those patches now, since it's possible for people
to use an external toolchain with glibc-2.31. In fact, I suspect that the ARC
people do exactly that :-)

 Regards,
 Arnout
