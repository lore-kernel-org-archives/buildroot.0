From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 2 Mar 2018 00:30:50 +0200
Subject: [Buildroot] [PATCH next] 18xx-ti-utils: new package
In-Reply-To: <87fu5jfnem.fsf@dell.be.48ers.dk>
References: <d322743a2a05c94eb5e1403f726b2c55372df556.1519941102.git.baruch@tkos.co.il>
 <87fu5jfnem.fsf@dell.be.48ers.dk>
Message-ID: <20180301223050.zdh7n2xfm3u5eqja@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Thu, Mar 01, 2018 at 11:20:49PM +0100, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > These are spacial RF calibration utilities for TI Wilink 18xx
>  > modules.
> 
>  > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>  > ---
>  > v3:
>  >   * Propagate dependencies (Marcus)
>  >   * Add license information and hash
>  > +	help
>  > +	  TI Wilink calibration utilities.
>  > +
>  > +	  CONFIG_NL80211_TESTMODE must be enabled in the kernel
>  > +	  configuration for this package to work.
> 
> Would it make sense to force this option on in linux.mk like we do for
> other packages?

I don't think so. I don't like this magic config manipulation in the general 
case. CONFIG_NL80211_TESTMODE in particular is meant for those who really know 
what they are doing. As the kernel config option help text put it:

  Say N.

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
