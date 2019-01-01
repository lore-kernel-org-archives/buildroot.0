From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jan 2019 13:11:46 +0100
Subject: [Buildroot] [PATCH v3 02/17] package/fftw: break fftw-single
 into a dedicated package
In-Reply-To: <20190101130018.1e077516@windsurf>
References: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
 <20181231133030.25991-3-thomas.petazzoni@bootlin.com>
 <20190101110952.GG26917@scaer> <20190101130018.1e077516@windsurf>
Message-ID: <20190101121146.GM26917@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-01-01 13:00 +0100, Thomas Petazzoni spake thusly:
> On Tue, 1 Jan 2019 12:09:52 +0100, Yann E. MORIN wrote:
> > There is a minor nit, though: the various flavours do install some of
> > the same files. For example, with just this patch applied, and enabling
> > fftw-single and fftw's remaining long-double option:
[--SNIP--]
> Meh. This is not really nice. I see a few possible solutions:
> 
>  (1) Have the per-precision packages not install to STAGING/TARGET but
>      to some common intermediate location, and have the common fftw
>      package stay a real package, which does the actual final location.

That would be a first.

>  (2) Have the per-precision packages only install libraries, and
>      have the common fftw package install the rest that is
>      common/identical between variants.

I'm not convinced either...

> That being said, I still think (and it seems like your
> Reviewed-by/Tested-by also says the same) this patch series goes in the
> right direction, and we can live with this drawback for now.

Definitely. I have ideas on how to tackle this for the future...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
