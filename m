From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Aug 2015 10:58:09 +0200
Subject: [Buildroot] Analysis of build results for 2015-08-05
In-Reply-To: <20150807040727.GM8475@waldemar-brodkorb.de>
References: <20150806063016.4A0BB102D1F@stock.ovh.net>
 <20150806113014.163c6592@free-electrons.com>
 <20150807040727.GM8475@waldemar-brodkorb.de>
Message-ID: <20150807105809.04758555@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar,

On Fri, 7 Aug 2015 06:07:27 +0200, Waldemar Brodkorb wrote:

> > Waldemar, it seems to be a uClibc issue. Do you have some idea?
> 
> The reason for the failure is an unsupported combination of
> PIE and static.
> 
> I found a thread about it here:
> https://sourceware.org/ml/binutils/2012-02/msg00260.html
> 
> With Linux it seems you need dynamic linking of a PIE executable.
> 
> PIE is hardcoded in audit Makefile.am, so we would either need to
> make it conditional for static builds or disable the package for
> static builds.

Thanks. I've marked the package as not available for static builds. See:

  http://git.buildroot.net/buildroot/commit/?id=e43875916a6810b4ff8c65e27840f9da15b86c7a

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
