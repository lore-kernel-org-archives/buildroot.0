From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 31 Mar 2016 13:23:01 -0300
Subject: [Buildroot] [PATCH] norm: fix build failure with old headers
In-Reply-To: <20160331181848.00984a4f@free-electrons.com>
References: <1459431938-28257-1-git-send-email-gustavo@zacarias.com.ar>
 <20160331181848.00984a4f@free-electrons.com>
Message-ID: <56FD4EE5.9000701@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31/03/16 13:18, Thomas Petazzoni wrote:

> Applied to master, thanks. It would be good to submit the patch
> upstream. Maybe the patch is not acceptable as-is because it will break
> with older versions of libnetfilter_queue, but I guess an autoconf
> check can be added for that.

Hi.
Indeed it's probably not acceptable for old netfilter_queue 
compatibility, though i made it the quick way since it was polluting the 
autobuilders.
It's waf, my famous friend, i'll try to cook up a failproof test for it, 
unfortunately netfilter_queue doesn't version the API in a visible way, 
so maybe a pkg-config though i need to consult the author/maintainer 
since it would be a new dependency to build.
Regards.
