From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2016 21:01:22 +0200
Subject: [Buildroot] [PATCH v3] uboot-tools: fix FIT support and make it
 optional
In-Reply-To: <468666808.273843.1464715989675.JavaMail.zimbra@datacom.ind.br>
References: <1462535953-4427-1-git-send-email-casantos@datacom.ind.br>
 <1462736800-9552-1-git-send-email-casantos@datacom.ind.br>
 <1462736800-9552-2-git-send-email-casantos@datacom.ind.br>
 <20160528150755.78888529@free-electrons.com>
 <468666808.273843.1464715989675.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20160531210122.39a50d97@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 31 May 2016 14:33:09 -0300 (BRT), Carlos Santos wrote:

> > 3/ Improving FIT support for the host variant
> > 
> > 4/ Improving FIT support for the target variant  
> 
> Tasks 3 and 4 can not be separated because both depend on the new patch that makes FIT support really optional.

Of course they can be separated. Just include the patch that makes FIT
support really optional into patch (3) from my list.

> OK, I will make these changes. I'd like to emphasize, however, that
> currently uboot-tools is broken. FIT support is always compiled, so
> run-time dependence on "dtc" persists but dtc is not selected in
> Config.in{.host,}. This is the problem that my initial patch intended
> to fix.

Sure, that's why I reviewed your patch, and suggested a few
improvements that should be made to allow us to apply the patch. Once
the improvements are made, I believe we should be able to apply it
pretty quickly.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
