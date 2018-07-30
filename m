From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 30 Jul 2018 11:13:40 -0700
Subject: [Buildroot] [PATCH v6 4/4] chromium: new package
In-Reply-To: <1532971302383-0.post@n4.nabble.com>
References: <20180710234212.4297-1-joseph.kogut@gmail.com>
 <20180710234212.4297-5-joseph.kogut@gmail.com>
 <1532611912386-0.post@n4.nabble.com>
 <CAMWSM7ikcADGP3Y7_wpSjot8fD_OA_v+R7bZf3fD+APRR-Kc1A@mail.gmail.com>
 <1532700227020-0.post@n4.nabble.com>
 <CAMWSM7i=dS5gbqwDRM34KPsu_9ArgYj3cwHYdp3tQ+pE5=L2Rg@mail.gmail.com>
 <1532941444387-0.post@n4.nabble.com>
 <CAMWSM7jKv1kqa3qkCs4wc6ut=HAMMPj58e=jswoXscUzYvwZ0A@mail.gmail.com>
 <1532971302383-0.post@n4.nabble.com>
Message-ID: <CAMWSM7gVEwkEx6mmU=FNS-E1xukuoVNwfLqGZC5Kt7ALz-BH+g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 30, 2018 at 10:21 AM Hao HU <huhao526200@gmail.com> wrote:
>
> Do you mean recompiling with use_gold=false? Or I should try setting
> use_lld=false?
>

The problem is stricter defaults with LLD, so you want to disable LLD
for an i386 build, which means the proper flag is use_lld=false. I
haven't tried this, so it may not fix your problem.

> >Can you switch the target architecture to x86_64? That build works properl
>
> I have tested the x86_64, it worked, but my project needs to build on a i386
> arch.
>

If that's the case, the only solution is to link without LLD. The
Chromium team informed me that they still compile with Gold on i386.

Also, this is unrelated, but when you reply you're only addressing the
mailing list, so your messages are skipping my inbox and I only notice
when I check messages sent to the mailing list. Make sure to address
your messages to the correct recipient and CC the mailing list.
