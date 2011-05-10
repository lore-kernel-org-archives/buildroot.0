From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 10 May 2011 10:35:44 +0200
Subject: [Buildroot] [PATCH] sh: Fix Buildroot sh targets to match
	gnuconfig targets
In-Reply-To: <20110510102047.1fffa641@surf>
References: <1304946773-5734-1-git-send-email-phil.edworthy@renesas.com>
	<201105101001.31879.yann.morin.1998@anciens.enib.fr>
	<20110510102047.1fffa641@surf>
Message-ID: <201105101035.44673.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Tuesday 10 May 2011 102047 Thomas Petazzoni wrote:
> On Tue, 10 May 2011 10:01:31 +0200
> "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> wrote:
> 
> > On Tuesday 10 May 2011 084704 Thomas Petazzoni wrote:
> > > Just curious, as I have never used Buildroot to build a toolchain for
> > > non-MMU platforms (only used pre-built Blackfin toolchains so far). How
> > > does this elf2flt thing fits into the toolchain build process ?
> > 
> > elf2flt provides its own linker to replace ld when the output is the flat
> > ELF format. When installing, elf2flt renames the original ld coming from
> > the binutils, installs its own ld.elf2flt linker and a ld wrapper that
> > checks the arguments. If the format is flat ELF, then the wrapper calls to
> > the ld.elf2flt linker; otherwise, it calls to the original linker.
> > 
> > So one first installs binutils as usual, and then install elf2flt.
> 
> Thanks Yann for these details. I'm wondering if this actually works
> fine in Buildroot or not.

At least, it works fine in crosstool-NG! ;-)

> Do you know if elf2flt has a well-known upstream location, so that we
> can use it instead of having the source code inside the BR tree?

The (very light!) home seems to be hosted at uClinux.org:
  http://uclinux.org/bFLT/

The latest release tarball I could find is really really old:
  http://uclinux.org/pub/uClinux/utilities/elf2flt-20020214.tar.gz

Crosstool-NG is using the cvs repository:
  http://cvs.uclinux.org/cgi-bin/cvsweb.cgi/elf2flt/

And:
  cvs -z3 -d:pserver:anonymous at cvs.uclinux.org:/var/cvs co -P elf2flt

The repository is not really live, but was last touched 5 weeks ago (which
is not that old). It mostly gets fixes nowadays.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
