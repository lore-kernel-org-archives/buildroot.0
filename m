From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jan 2019 22:57:47 +0100
Subject: [Buildroot] [PATCH v3 15/17] package/liquid-dsp: use the new
 fftw-{single, double, long-double} packages
In-Reply-To: <20190101215058.GE23435@scaer>
References: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
 <20181231133030.25991-16-thomas.petazzoni@bootlin.com>
 <20190101215058.GE23435@scaer>
Message-ID: <20190101215747.GG23435@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Gwenha?l, All,

On 2019-01-01 22:50 +0100, Yann E. MORIN spake thusly:
> On 2018-12-31 14:30 +0100, Thomas Petazzoni spake thusly:
> > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > 
> > Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > ---
[--SNIP--]
> Since those three fftw variants can now be enabled at the same time,
> we'd end up with:
>     LIQUID_DSP_DEPENDENCIES = fftw-single fftw-double fftw-long-double
>     LIQUID_DSP_LDFLAGS = -lfftw3f -lfftw3 -lfftw3l
> Is that really what we want?

OK, seeing patch 17 in this seriesm the above does not really matter,
since liquid-dsp eventually keeps support for a single variant.

So, maybe it makes sense to drop the variants before switching to the
new packages?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
