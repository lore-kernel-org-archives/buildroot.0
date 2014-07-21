From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 22:55:20 +0200
Subject: [Buildroot] [PATCH 2/2] perf: Don't build backtrace for ARC
In-Reply-To: <39A54937CC95F24AA2F794E2D2B66B1356CF6175@de02wembxa.internal.synopsys.com>
References: <1390914658-18198-1-git-send-email-mjonker@synopsys.com>
 <CAAXf6LWJqKV-FFUXycBMNvOFZ+CyosFMPb9khmr9x9=Ug6q7xQ@mail.gmail.com>
 <CAAXf6LWKMo_fM0C7f0XL41L=5OiKjsfN1mXt0h68QM0UC2Nk3g@mail.gmail.com>
 <39A54937CC95F24AA2F794E2D2B66B1356CF6175@de02wembxa.internal.synopsys.com>
Message-ID: <20140721225520.4a9ef088@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anton Kolesov,

Please fix your e-mail client to wrap lines at a reasonable length.
Thanks!

On Mon, 21 Jul 2014 09:39:05 +0000, Anton Kolesov wrote:

> Call to backtrace() function fails for ARC, because for some reason
> unwinder from libgcc returns early. Thus usage of backtrace() should
> be disabled in perf explicitly, because build system only checks for
> existence of this call and since it is there it tries to use. However
> at runtime the output will not be the one expected: it will contain
> only several functions from the top of stack, instead of the complete
> backtrace.

Thanks for this explanation. I've committed the patch after adding this
explanation right above the code that disables backtrace for perf on
ARC.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
