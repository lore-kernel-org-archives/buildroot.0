From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Fri, 10 Jul 2015 16:02:41 -0500
Subject: [Buildroot] [PATCH v7 22/22] cpio: new package
In-Reply-To: <20150706123840.61ff3672@free-electrons.com>
References: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1433251718-3167-23-git-send-email-clayton.shotwell@rockwellcollins.com>
 <20150706123840.61ff3672@free-electrons.com>
Message-ID: <CANn-YGTt5AoiV=5ht_4krY6EvVNTih=tiYqDoty6WmykeqkFug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, Jul 6, 2015 at 5:38 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Clayton Shotwell,
>
> On Tue,  2 Jun 2015 08:28:38 -0500, Clayton Shotwell wrote:
>> Adding the cpio archive utility for the target and host. Patches have
>> been pulled from ArchLinux and Debian to fix CVE issues and compile
>> issues.
>>
>> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
>
> What is the motivation to have a host variant of cpio? cpio is already
> part of the mandatory programs that Buildroot checks for at the
> beginning of every build: it must be installed on the host system prior
> to running Buildroot.

Well I am not using it for anything in particular, I really just need
the target variant. I can remove the host option without any impact to
anything.

> If the ArchLinux patches apply without any adaptation, have you
> considered using:
>
> CPIO_PATCH = \
>         https://projects.archlinux.org/svntogit/packages.git/plain/trunk/cpio-2.11-stdio.in.patch?h=packages/cpio \
>         ...
>
> instead ?

I always forget that is an option because I cannot freely download
stuff behind our firewall. I'll look at changing the patches to links
to make things simpler but I may have issues testing that all the
links work properly.

>> +CPIO_VERSION = 2.11
>> +CPIO_SITE = http://ftp.gnu.org/gnu/cpio
>> +CPIO_LICENSE = GPLv3
>
> It's GNU stuff, so GPLv3+.

Good catch. I'll get that fixed.

Thanks,
Clayton

Clayton Shotwell
Senior Software Engineer, Rockwell Collins
clayton.shotwell at rockwellcollins.com
