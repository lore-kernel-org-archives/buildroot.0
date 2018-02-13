From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 13 Feb 2018 14:47:13 +0200
Subject: [Buildroot] [PATCH 1/2] musl: add more kernel headers guards
In-Reply-To: <20180213133230.3a99ae2c@windsurf.lan>
References: <00926ed70cd14972bac0ce653b1f383b4a31492c.1518524870.git.baruch@tkos.co.il>
 <20180213133230.3a99ae2c@windsurf.lan>
Message-ID: <20180213124713.hrfr3bh3eigputkr@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Feb 13, 2018 at 01:32:30PM +0100, Thomas Petazzoni wrote:
> On Tue, 13 Feb 2018 14:27:49 +0200, Baruch Siach wrote:
> > Kernel version 4.15 (not 4.16 as the musl commit log claims) allows
> > disabling of more parts of the kernel headers definitions. Add upstream
> > musl patch that defines the relevant macros. This solves issues of
> > networking related symbols redefinition in kernel headers that cause
> > headers conflicts. With that in place a subsequent commit will limit the
> > musl/kernel headers conflict avoidance workaround in Buildroot to kernel
> > headers older than 4.15. This workaround has been introduced in commit
> > 196932cd91 (toolchain: workaround musl/kernel headers conflict).
> > 
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> Thanks for those patches, it's great to see that you continue to
> follow this header conflict issue. You didn't specify explicitly if you
> intend them for master or next. At this point, I don't see a reason to
> need them for master, so it's probably material for next. Do you agree ?

Of course. Sorry. I didn't say that explicitly because I thought it obviously 
belongs to next. These patches would better see lots of autobuilders testing. 
Until the musl toolchains get rebuilt, only internal musl toolchain builds 
will actually test this code.

By the way, you should probably update the email address in your DEVELOPERS 
entry.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
