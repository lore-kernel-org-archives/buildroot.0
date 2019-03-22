From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 22 Mar 2019 12:40:25 +0100
Subject: [Buildroot] [PATCH v3 1/3] arch: add support for Andes
 32-bit(nds32)
In-Reply-To: <20190322083928.GA28644@app09>
References: <20190307021125.8530-1-nylon7@andestech.com>
 <20190307021125.8530-2-nylon7@andestech.com>
 <20190314222211.GB6876@scaer> <20190321023610.GB12833@app09>
 <20190321111854.GB2660@scaer> <20190322083928.GA28644@app09>
Message-ID: <20190322114025.GG2660@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nylon, All,

On 2019-03-22 16:39 +0800, Nylon Chen spake thusly:
> On Thu, Mar 21, 2019 at 07:18:54PM +0800, Yann E. MORIN wrote:
> > On 2019-03-21 10:36 +0800, Nylon Chen spake thusly:
> > > On Fri, Mar 15, 2019 at 06:22:11AM +0800, Yann E. MORIN wrote:
> > > > On 2019-03-07 10:11 +0800, Nylon Chen spake thusly:
> > > > > +config BR2_ANDES_NDS32_FPU
> > > > > +	bool "Enable FPU coprocessor"
> > > > > +	help
> > > > > +	  You can say y here if your Andes CPU have a Floating-Point Coprocessor
> > > > > +	  or if you need FPU support for your user-space programs.
> > > > So, the situation about FPU is always a bit icky for me.
[--SNIP--]
> BR2_ANDES_NDS32_FPU are selector, we can depend on it switch v3 or v3f
> toolcahin
> 
> After we add new defconfig(for v3f),I will be adding BR2_SOFT_FLOAT
>(-msoft-float) to arch/Config.in.nds32

Then if the v3f is currently the only supported alternative, do not
offer the FPU choice in this initial integration.

Adding support for the v3 (not f) and the FPU selection can be done in a
later patch, then.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
