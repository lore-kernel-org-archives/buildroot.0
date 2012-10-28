From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Oct 2012 11:48:11 +0100
Subject: [Buildroot] [PATCH 06/47] package/celt051: new package
In-Reply-To: <508C31BF.20806@mind.be>
References: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
 <1351113973-17237-7-git-send-email-yann.morin.1998@free.fr>
 <508C31BF.20806@mind.be>
Message-ID: <201210281148.11878.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Saturday 27 October 2012 Arnout Vandecappelle wrote:
>   Package should be called celt, not celt051

Nope, see below.

> On 24/10/12 23:25, Yann E. MORIN wrote:
> > Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>
> > Reviewed-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
> [snip]
> > diff --git a/package/multimedia/celt051/celt.mk b/package/multimedia/celt051/celt.mk
> > new file mode 100644
> > index 0000000..9baaa82
> > --- /dev/null
> > +++ b/package/multimedia/celt051/celt.mk
> > @@ -0,0 +1,30 @@
> > +#############################################################
> > +#
> > +# celt051
> > +#
> > +#############################################################
> > +
> > +# Although version newer than 0.5.1.3 exists, we're
> > +# stuck with 0.5.1.3 for use by Spice (coming later)
> 
>   How come spice requires a specific version of celt?

The build instructions say:
    celt = 0.5.1.3 (this is important, newer versions use a
    different protocol)

    (from: http://www.spice-space.org/page/Building_Instructions)

Also, their ./configure enforce this check.

> > +CELT051_VERSION         = 0.5.1.3
> > +CELT051_SOURCE          = celt-$(CELT051_VERSION).tar.gz
> 
>   If it's called celt, this is the default so can be left out.

I called it 'celt051' because it's not the latest version, and I want to
make it clear that the version shall *not* be updated. See the discussion
we had with Thomas last August:
    http://lists.busybox.net/pipermail/buildroot/2012-August/057562.html

I think we should keep calling it 'celt051' and not just 'celt', so that
the version is never updated.

To be noted: celt is now deprecated, as it was merged into Opus, as
it's now standardised by RFC6716:
    http://www.celt-codec.org/  (at the bottom of the page)
    http://opus-codec.org/
    https://tools.ietf.org/html/rfc6716

However, spice still requires celt-0.5.1.3.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
