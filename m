From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Oct 2012 15:14:40 +0200
Subject: [Buildroot] [git commit] fs/skeleton: remove /etc/TZ
In-Reply-To: <877gqgm36w.fsf@macbook.be.48ers.dk>
References: <20121024071711.0DF3599913@busybox.osuosl.org>
 <20121024143009.23f6b698@skate>
 <877gqgm36w.fsf@macbook.be.48ers.dk>
Message-ID: <20121024151440.63792051@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wed, 24 Oct 2012 15:04:23 +0200, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  Thomas> On Wed, 24 Oct 2012 09:16:50 +0200, Peter Korsgaard wrote:
>  >> commit: http://git.buildroot.net/buildroot/commit/?id=5a61fbd82394f9bc9317535b717a2e1dd51dea7d
>  >> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>  >> 
>  >> Defaulting to UTC (which is what uClibc will default to when /etc/TZ is
>  >> missing) seems more sensible than US Mountain Time Zone in the default
>  >> rootfs skeleton.
> 
>  Thomas> And with glibc/eglibc?
> 
> As far as I understand it (e)glibc doesn't use /etc/TZ:
> 
> https://www.gnu.org/software/libc/manual/html_node/TZ-Variable.html
> 
> https://www.kernel.org/pub/linux/libs/uclibc/Glibc_vs_uClibc_Differences.txt
> 
> time functions
> --------------
> 1) Leap seconds are not supported.
> 2) /etc/timezone and the whole zoneinfo directory tree are not supported.
>    To set the timezone, set the TZ environment variable as specified in
>    http://www.opengroup.org/onlinepubs/007904975/basedefs/xbd_chap08.html
>    or you may also create an /etc/TZ file of a single line, ending with a
>    newline, containing the TZ setting.  For example
>    echo CST6CDT > /etc/TZ
> 3) Currently, locale specific eras and alternate digits are not supported.
>    They are on my TODO list.

Ok. I know remember, on glibc I used /etc/localtime. I have patches
here that allow to configure the installation of a certain number of
zoneinfo files, and set a default zoneinfo, when glibc is used. I
should probably submit them someday.

Thanks for the clarification,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
