From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 12 May 2010 23:47:39 +0200
Subject: [Buildroot] Status of external toolchain support
In-Reply-To: <4BEB1F7B.8010301@carallon.com>
References: <4BEAE23A.2000906@carallon.com>
	<201005122319.35163.yann.morin.1998@anciens.enib.fr>
	<4BEB1F7B.8010301@carallon.com>
Message-ID: <201005122347.39990.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will, All,

On Wednesday 12 May 2010 23:36:59 Will Wagner wrote:
> > So yes, we also have to select threading model in buildroot, and it has to
> > match the external toolchain capabilities.

> I understand that options that affect packages have to be set the same. 
> I can also see that you need to know if the toolchain supports threads 
> or not, however once you have an external toolchain surely the packages 
> you build with it do not care what version of threading is used.

The only two (non-toolchain) packages, gdb and dmalloc, that depends on
threads, refer to !BR2_PTHREADS_NONE.

> If you need to tell buildroot the type of threading used (linuxthread 
> old/new or nptl) then currently buildroot does not check that they match 
> up, as I have an nptl toolchain but am unable to select that in 
> buildroot so it is set to linuxthreads new, but I got no error.

Oh, I see what you mean:
- the prompt for the threading model is wrong when dealing with external
  toolchains: we only need to know if threads are supported or not
- a check is missing to check coherency btw external toolchain threading
  capabilties, and buildroot configuration.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
