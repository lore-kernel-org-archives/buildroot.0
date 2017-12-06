From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 6 Dec 2017 07:46:38 -0600
Subject: [Buildroot] [PATCH 2/2] kvmtool: bump to f77d646ba0
In-Reply-To: <20171206085958.3671c8a1@windsurf.lan>
References: <20171203033321.13460-1-matthew.weber@rockwellcollins.com>
 <20171203033321.13460-2-matthew.weber@rockwellcollins.com>
 <20171203145407.78bab7c2@windsurf.home>
 <CANQCQpaQzSj_4cKDAnGViSySBFgWmywc2mjdWgEiG2WfW7eLXg@mail.gmail.com>
 <CANQCQpZF8+b7PyYLmw6ZZCX=CTv=rQQmtkJj0ogF3wdPF+unTw@mail.gmail.com>
 <20171206085958.3671c8a1@windsurf.lan>
Message-ID: <CANQCQpZZCcsSgn-Gz2ErsM9jcu--wJTb9QeK_KveGSV9kx8s1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Dec 6, 2017 at 1:59 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
> On Tue, 5 Dec 2017 20:05:42 -0600, Matthew Weber wrote:
>
> > Gustavo, the latest kvmtool switched to doing the final link with gcc
> > vs originally ld.  I believe this is the right fix.
> >
> >       3 --- a/package/kvmtool/kvmtool.mk
> >       4 +++ b/package/kvmtool/kvmtool.mk
> >       5 @@ -33,7 +33,7 @@ KVMTOOL_LICENSE_FILES = COPYING
> >       6  # If more packages need this (unlikely) an ld wrapper might be a better
> >       7  # solution, using gcc -dumpspecs information.
> >       8  KVMTOOL_EXTRA_LDFLAGS = \
> >       9 -       $(if $(BR2_x86_64),-m elf_x86_64)
> >      10 +       $(if $(BR2_x86_64),-m64)
>
> If kvmtool is now building with gcc, do we need -m64 at all ?
>

That's true, gcc would already be assuming m64 based on the target's
arch vs the linker wouldn't have been able to infer that.  I'll remove
and kickoff a test.

> Also Matt: I wouldn't expect much feedback from Gustavo, he has stopped
> contributing to Buildroot earlier this year, and has removed himself
> from the DEVELOPERS file.

Noted.
