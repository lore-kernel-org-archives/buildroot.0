From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 22 Nov 2016 11:12:20 +0100
Subject: [Buildroot] [PATCH] ptpd2: fix bfin compile by avoiding gcc bug
In-Reply-To: <20161121220442.77263bd3@free-electrons.com>
References: <20161121183217.GA1046@waldemar-brodkorb.de>
 <20161121220442.77263bd3@free-electrons.com>
Message-ID: <20161122101219.GT27313@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> On Mon, 21 Nov 2016 19:32:18 +0100, Waldemar Brodkorb wrote:
> 
> > +# GCC bug with Os/O1/O2/O3
> > +# internal compiler error: in gen_add2_insn, at optabs.c:4454
> > +ifeq ($(BR2_bfin),y)
> > +PTPD2_CONF_ENV += CFLAGS="-O0"
> 
> You forgot to pass $(TARGET_CFLAGS) here. With your change, we loose
> TARGET_CFLAGS. So I've fixed that up and applied.
> 
> However, I continue to dislike such hacks: when the problem gets fixed
> by gcc, how will we notice?

Either when we get notice that the PR is closed, this time I need to
create one. But we have similar issues where we already have PR's.
Or we check when a new gcc release come out, if the results from
"grep bfin package/*/*mk" are still required.

I think better then never ending autobuild failures.

best regards
 Waldemar
