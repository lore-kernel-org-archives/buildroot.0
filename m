From: Vadim Kochan <vadim4j@gmail.com>
Date: Fri, 22 Mar 2019 06:59:46 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-03-20
In-Reply-To: <20190321070043.3390386D73@whitealder.osuosl.org>
References: <20190321070043.3390386D73@whitealder.osuosl.org>
Message-ID: <20190322045946.hpus3subzuiobdhd@vkochan-ThinkPad-T470p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

On Thu, Mar 21, 2019 at 07:00:38AM -0000, Thomas Petazzoni wrote:
> Hello,
> 
> Build statistics for 2019-03-20
> ===============================
> 
>       branch |  OK | NOK | TIM | TOT |
>    2018.02.x |  30 |   3 |   0 |  33 |
>    2018.11.x |  39 |   0 |   0 |  39 |
>    2019.02.x |  33 |   3 |   1 |  37 |
>       master | 226 |  66 |   2 | 294 |
> 
> Results for branch '2018.02.x'
> ==============================
> 
> Classification of failures by reason
> ------------------------------------
> 
>                    attr-2.4.48 | 1 
>                  mplayer-1.3.0 | 1 
>              qt5location-5.6.3 | 1 
> 
> 
> Detail of failures
> ------------------
> 
>         bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/97de444eae5e8baf191b05e31f07ca00558bfda8 |     
This made me crazy until I realized that Blackfin adds "_" to all
symbols. So, it really can be fixed (I checked) if to prepend symbols in
libattr/libattr.lds with "_" (at least for each libattr_* symbol).

Regards,
Vadim Kochan
