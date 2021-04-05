From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Apr 2021 11:42:46 +0200
Subject: [Buildroot] [PATCH] package/python-pygments: security bump to
 version 2.7.4
In-Reply-To: <20210404185907.27471-1-peter@korsgaard.com>
References: <20210404185907.27471-1-peter@korsgaard.com>
Message-ID: <20210405114246.7ca59fcd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  4 Apr 2021 20:59:07 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issues:
> 
> - CVE-2021-20270: An infinite loop in SMLLexer in Pygments versions 1.5 to
>   2.7.3 may lead to denial of service when performing syntax highlighting of
>   a Standard ML (SML) source file, as demonstrated by input that only
>   contains the "exception" keyword
> 
> - CVE-2021-27291: In pygments 1.1+, fixed in 2.7.4, the lexers used to parse
>   programming languages rely heavily on regular expressions.  Some of the
>   regular expressions have exponential or cubic worst-case complexity and
>   are vulnerable to ReDoS.  By crafting malicious input, an attacker can
>   cause a denial of service
> 
> Python 2.x support was dropped in pygments 2.6, so adjust (reverse)
> dependencies:
> 
> Version 2.6
> -----------
> (released March 8, 2020)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
