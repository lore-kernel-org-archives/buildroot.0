From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Nov 2016 10:49:18 +0100
Subject: [Buildroot] [PATCH] tslib: bump version to 1.2
In-Reply-To: <1479486965-23362-1-git-send-email-martink@posteo.de>
References: <1479486965-23362-1-git-send-email-martink@posteo.de>
Message-ID: <20161119104918.1e0dbf1d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Nov 2016 17:36:05 +0100, Martin Kepplinger wrote:
>  * The first patch is removed because the input-raw plugin is now enabled
>    in tslib's provided ts.conf
> 
>  * The second patch added 2 programs to tslib. The whole patch is removed
>    because:
>    - ts_finddev is now part of tslib.
> 
>    - inputattach is part of the 'Linux console project' located
>      here: https://sourceforge.net/projects/linuxconsole/
> 
> Signed-off-by: Martin Kepplinger <martink@posteo.de>

Applied to next, thanks!

> If we want to keep the inputattach program, wouldn't it be the more correct
> way to include that 'Linux console project' in buildroot?

Yes, it would definitely be more correct.

> Alternatively, I could come up with a new version of this patch, including
> only inputattach here again. (at least an updated version of it. that project
> is actively maintained.)

We normally don't include in Buildroot patches that add new features to
packages, so in fact this patch adding ts_finddev and inputattach
(which had been there for a very long time) was not even complying with
this rule.

It would however be good to have the "Linux console" project packaged,
so that if people were using the inputattach program from tslib, we can
tell them to enable the linuxconsole package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
