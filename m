From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 11 Apr 2014 09:51:09 +0100
Subject: [Buildroot] [PATCH 1/2] systemd: Build legacy pc files when
	liblogging is
In-Reply-To: <87lhvc6fzf.fsf@dell.be.48ers.dk>
References: <1397145566-11243-1-git-send-email-Vincent.Riera@imgtec.com>
 <20140410175032.GA24213@pc-eric> <87lhvc6fzf.fsf@dell.be.48ers.dk>
Message-ID: <5347ACFD.907@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/10/2014 10:18 PM, Peter Korsgaard wrote:
>>>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:
>
> Hi,
>
>   > Maybe some other packages depend on these compatibility libraries, so instead
>   > of referring to BR2_PACKAGE_LIBLOGGING in systemd.mk, it would be best to add
>   > a generic configuration option to systemd, as done for berkeleydb with
>   > BR2_PACKAGE_BERKELEYDB_COMPAT185. It could be named BR2_PACKAGE_SYSTEMD_COMPAT.
>
>   > Then, in package/liblogging/Config.in, we would have:
>
>   >   select BR2_PACKAGE_SYSTEMD_COMPAT if BR2_INIT_SYSTEMD
>
>   > And this would be removed when liblogging is fixed upstream.
>
> Yes, I agree.
>
>   > What do think of this?
>
> Care to send an updated patch series doing that?
>

I didn't do that in purpose, because I thought it would be a good idea 
to catch those packages that still look for legacy systemd files, so we 
could tell upstream about that, as I did for liblogging.

If we put that option as a generic one, then we will never remove it 
from there and we will be using the not-default systemd config forever.

-- 
Vincent
