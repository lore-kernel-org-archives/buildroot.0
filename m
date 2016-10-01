From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 1 Oct 2016 09:20:25 +0200
Subject: [Buildroot] [PATCH] transmission: fix compile error
In-Reply-To: <2269cdc1-0f21-09dc-6df2-c3af51f1a04f@mind.be>
References: <20160929181259.GA16185@waldemar-brodkorb.de>
 <2269cdc1-0f21-09dc-6df2-c3af51f1a04f@mind.be>
Message-ID: <20161001072024.GA2232@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,
Arnout Vandecappelle wrote,

> > +--- a/libtransmission/platform-quota.c
> > ++++ b/libtransmission/platform-quota.c
> > +@@ -284,7 +284,7 @@ getquota (const char * device)
> > +       spaceused = (int64_t) dq.dqb_curblocks >> 1;
> > + #elif defined(__APPLE__)
> > +       spaceused = (int64_t) dq.dqb_curbytes;
> > +-#elif defined(__UCLIBC__)
> > ++#elif defined(__UCLIBC__) && (__UCLIBC_MAJOR__ == 0 || (__UCLIBC_MAJOR__ == 1 && __UCLIBC_SUBLEVEL__ <= 17))
> 
>  Shouldn't this also include __UCLIBC_MINOR__ == 0, so the condition doesn't
> trigger when uClibc-ng 1.1.0 is released?

Do you know of any hidden roadmap I am not aware of? ;)

best regards
   Waldemar
