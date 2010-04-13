From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 16:59:03 +0200
Subject: [Buildroot] [PATCH 03/21] udpcast: convert to the autotools
 infrastructure
In-Reply-To: <87d3y4k1dq.fsf@macbook.be.48ers.dk>
References: <cover.1271077873.git.thomas.petazzoni@free-electrons.com>
	<cover.1271077873.git.thomas.petazzoni@free-electrons.com>
	<b7fe41a1f4c9fc78ea89fe332a7d98d2922ed83f.1271077873.git.thomas.petazzoni@free-electrons.com>
	<87d3y4k1dq.fsf@macbook.be.48ers.dk>
Message-ID: <20100413165903.33f58597@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Apr 2010 19:48:49 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Thomas> +UDPCAST_CONF_ENV = ac_cv_type_stat64=yes
> 
>  Thomas> -		$(if
>  Thomas> $(BR_LARGEFILE),ac_cv_type_stat64=yes,ac_cv_type_stat64=no) \
> 
> Why are you now forcing 64bit here?

Good question. When I wrote the change, I remember thinking about this,
but I really don't remember why I did the change this way. Definitely,
we should be conservative and keep it as it was.

> Not a big deal, but you seem to forgot the final newline in several
> files - Is there any reason why?

Simply because in the text editor I'm using, having a final newline or
not does not make any visible difference, so I always forget about this.

I've pushed updated versions of the patches, to fix the udpcast large
file thing, and to add the newlines at the end of files. You can pull
from:

 git://git.busybox.net/~tpetazzoni/git/buildroot autotools-conversion

I'm not spamming again the list by resending everything, but if you
think it's worth, I'll do so.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
