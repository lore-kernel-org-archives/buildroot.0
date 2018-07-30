From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 30 Jul 2018 10:05:05 -0700
Subject: [Buildroot] [PATCH v6 4/4] chromium: new package
In-Reply-To: <1532941444387-0.post@n4.nabble.com>
References: <20180710234212.4297-1-joseph.kogut@gmail.com>
 <20180710234212.4297-5-joseph.kogut@gmail.com>
 <1532611912386-0.post@n4.nabble.com>
 <CAMWSM7ikcADGP3Y7_wpSjot8fD_OA_v+R7bZf3fD+APRR-Kc1A@mail.gmail.com>
 <1532700227020-0.post@n4.nabble.com>
 <CAMWSM7i=dS5gbqwDRM34KPsu_9ArgYj3cwHYdp3tQ+pE5=L2Rg@mail.gmail.com>
 <1532941444387-0.post@n4.nabble.com>
Message-ID: <CAMWSM7jKv1kqa3qkCs4wc6ut=HAMMPj58e=jswoXscUzYvwZ0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Hao,

On Mon, Jul 30, 2018 at 2:04 AM Hao HU <huhao526200@gmail.com> wrote:
> >>Did you allow the Chromium package to reconfigure, i.e., by deleting
> >>.stamp_configured, or running 'make chromium-dirclean all'?
> >
> > Before I tested if the use_gold=false worked or not, firstly I deleted the
> > folder
> /
> > /ouput/build/chromium--67.0.3396.79
> /
> > then I run $ make
> >
> > Is that right or not?

That will repeat the configure step, which is what you want. If
recompiling with use_lld=false doesn't work, the i386 build is still
broken, and needs fixed.

Can you switch the target architecture to x86_64? That build works properly.
