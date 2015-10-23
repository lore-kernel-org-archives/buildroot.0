From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Fri, 23 Oct 2015 09:12:02 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: use root-relative -f path for
	/sbin/ldconfig
In-Reply-To: <562952C7.30708@mind.be>
References: <1445502151-25735-1-git-send-email-bjorn.forsman@gmail.com>
 <562952C7.30708@mind.be>
Message-ID: <CAEYzJUEvAp4sfaykkY8dKi8_9G1YGLZ-3U=dgHj9HR3EHsUKXQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22 October 2015 at 23:19, Arnout Vandecappelle <arnout@mind.be> wrote:
> This makes me worried that it will do the wrong thing on some other build
> hosts. In fact, using /sbin/ldconfig is fundamentally broken since we can't be
> sure that it's compatible with the target dynamic linker.

If you don't want to apply this patch, that is totally fine. It just
fixes a warning I saw while debugging an issue that ended up being
fixed by the next patch:

[PATCH 2/2] Makefile: add -C flag for /sbin/ldconfig

The 2nd patch is the one I really care about, it currently blocks me
from running Buildroot in my preferred environment.

If you want to completely remove use of (host) /sbin/ldconfig, that's fine too.

Just tell me what to do :-)

- Bj?rn
