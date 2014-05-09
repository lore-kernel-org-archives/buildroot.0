From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 9 May 2014 10:34:12 -0300
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140507093155.18034c1d@free-electrons.com>
References: <20140507063009.23A95100E55@stock.ovh.net>
 <20140507093155.18034c1d@free-electrons.com>
Message-ID: <20140509133412.GE764@arch.cereza>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07 May 09:31 AM, Thomas Petazzoni wrote:
> >      nios2 |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/9cd30031a40f768f6090cfba44c880fb2406672b/
> 
> Ezequiel?
> 

fio does a configure-time test to see if fallocate() is there, which passes
successfully. Then BR builds fio passing LARGE_FILE flags which makes the
toolchain try fallocate64(), which is not implemented.

However, I'm not sure how to either make the configure-time fallocate test
fail (so fio knows there's no fallocate), or prevent BR from passing the
LARGE_FILE flags.

Disable fio for nios2?
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
