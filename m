From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 13 Jun 2013 07:28:09 -0300
Subject: [Buildroot] [PATCH] freetype: fix includedir
In-Reply-To: <51B961CA.6080405@mind.be>
References: <1371094112-7523-1-git-send-email-gustavo@zacarias.com.ar>
 <51B961CA.6080405@mind.be>
Message-ID: <51B99EB9.8010401@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/13/2013 03:08 AM, Arnout Vandecappelle wrote:
>  I think this is the wrong fix.
> 
>  The FREETYPE_CONFIG_SCRIPTS approach doesn't work in this case because
> this script doesn't use ${prefix} in front of it's includedir. I think
> the better fix is to use a custom POST_INSTALL_STAGING_HOOK that sets
> SYSROOT=$(STAGING_DIR) at the beginning of the script.
> 
>  The .pc file should be handled by our modified pkg-config.
> 
>  Regards,
>  Arnout

I've actually mentioned the pkgconfig file because of late fixing /
killing time, so as you said it really doesn't matter, it's handled
elsewhere.
Setting SYSROOT at the beginning of the script is wrong too IMHO, it's
very unconventional, we should just revert it back to the tried and
tested way that every other -config script works fine with:

includedir="${prefix}/include"
libdir="${exec_prefix}/lib"

I'll spin a V2.
Regards.
