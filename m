From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jul 2019 22:34:19 +0200
Subject: [Buildroot] [PATCH] package/gcc: arc-2019.03/9.1.0: Fix
 compilation of glibc
In-Reply-To: <20190716215001.9181-1-abrodkin@synopsys.com>
References: <20190716215001.9181-1-abrodkin@synopsys.com>
Message-ID: <20190718223419.58050ad3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 17 Jul 2019 00:50:01 +0300
Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:

> When storing a TLS symbol to memory, always use an intermediate register
> to load it. Otherwise compiler generates instruction which couldn't be
> encoded and we see:
> ----------------------------->8---------------------------  
> In file included from gethstent_r.c:34:
> ../nss/getXXent_r.c: In function '__gethostent_r':
> ../nss/getXXent_r.c:168:1: error: unrecognizable insn:
>  }
>  ^
> (insn 25 24 26 5 (set (mem:SI (plus:SI (reg/f:SI 149 virtual-outgoing-args)
>                 (const_int 16 [0x10])) [0  S4 A32])
>         (plus:SI (reg:SI 25 r25)
>             (reg:SI 174))) "../nss/getXXent_r.c":160 -1
>      (nil))
> during RTL pass: vregs
> ../nss/getXXent_r.c:168:1: internal compiler error: in extract_insn, at recog.c:2304
> In file included from getnetent_r.c:34:
> ../nss/getXXent_r.c: In function '__getnetent_r':
> ../nss/getXXent_r.c:168:1: error: unrecognizable insn:
>  }
>  ^
> (insn 25 24 26 5 (set (mem:SI (plus:SI (reg/f:SI 149 virtual-outgoing-args)
>                 (const_int 16 [0x10])) [0  S4 A32])
>         (plus:SI (reg:SI 25 r25)
>             (reg:SI 174))) "../nss/getXXent_r.c":160 -1
>      (nil))
> during RTL pass: vregs
> ../nss/getXXent_r.c:168:1: internal compiler error: in extract_insn, at recog.c:2304
> ----------------------------->8---------------------------  

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
