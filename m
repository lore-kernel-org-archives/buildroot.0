From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 12 Mar 2017 19:31:19 +0200
Subject: [Buildroot] [PATCH 2/2] Makefile: add check of binaries
 architecture
In-Reply-To: <20170312151543.GC3739@free.fr>
References: <1489331191-32663-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1489331191-32663-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170312151543.GC3739@free.fr>
Message-ID: <20170312173119.qt6mcfxkalpzaeoj@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Mar 12, 2017 at 04:15:43PM +0100, Yann E. MORIN wrote:
> On 2017-03-12 16:06 +0100, Thomas Petazzoni spake thusly:
> > As shown recently by the firejail example, it is easy to miss that a
> > package builds and installs binaries without actually cross-compiling
> > them: they are built for the host architecture instead of the target
> > architecture.
> > 
> > This commit adds a small helper script, check-bin-arch, called from
> > the main Makefile as a TARGET_FINALIZE_HOOKS, to verify that all ELF
> > binaries have been built for the correct CPU architecture.
> 
> That is not possible in all situations.
> 
> For example, I have a board here with a kind of co-processor of a
> different architecture; the firmware for that co-processor is loaded
> at runtime. It is an ELF file, and it is in target/.
> 
> So I don't think it is possible to check that all ELF files are for the
> Buildroot-known target.
> 
> We already discussed this a while ago and came to the same conclusiong
> back then.

Maybe limiting the check to well knows target binary directories like 
target/{bin,sbin,usr/bin,usr/sbin,...} would help. This check won't catch all 
possible locations of target ELF binaries, but it's still a significant 
improvement over the current situation.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
