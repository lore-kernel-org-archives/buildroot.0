From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 29 Jul 2019 10:55:54 -0700
Subject: [Buildroot] [RFC PATCH 4/4] Add linker override to config
 options
In-Reply-To: <CAJ4jsad2fnpgqUq0bqtXz9f2ZQ9CJhEo2KcTi49NKqO5-a4PpQ@mail.gmail.com>
References: <20190724173538.22913-1-joseph.kogut@gmail.com>
 <20190724173538.22913-5-joseph.kogut@gmail.com>
 <CAJ4jsad2fnpgqUq0bqtXz9f2ZQ9CJhEo2KcTi49NKqO5-a4PpQ@mail.gmail.com>
Message-ID: <CAMWSM7j=Hk4ws2S4oFD3_gbkYfDL9r1ZELvrktVSBbaB-KEDHg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos,

On Fri, Jul 26, 2019 at 7:25 PM Carlos Santos <unixmania@gmail.com> wrote:
>
> On Wed, Jul 24, 2019 at 2:35 PM Joseph Kogut <joseph.kogut@gmail.com> wrote:
> >
> > Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> [...]
> >
> > +ifeq ($(BR2_LINKER_LLD),y)
> > +TOOLCHAIN_WRAPPER_ARGS += -DBR_LINKER='"lld"'
>
> Sorry for the nitpicking but Buildroot normally uses the "BR2_" prefix
> fo perhaps this should be "BR2_LINKER"
>

Correct, most constants are prefixed with BR2_*, with the exception of
definitions in the toolchain wrapper. I chose BR_LINKER to remain
consistent with the other code in the wrapper.

Best,
Joseph
