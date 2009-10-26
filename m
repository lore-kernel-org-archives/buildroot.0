From: Anders Darander <anders.darander@gmail.com>
Date: Mon, 26 Oct 2009 08:32:11 +0100
Subject: [Buildroot] [RFC; PATCH] Use gdbserver from external toolchain
In-Reply-To: <20091024182538.69233120@surf>
References: <2c9a759f0910220247u18c004epcb564aa65aa02d2b@mail.gmail.com>
	<20091024182538.69233120@surf>
Message-ID: <2c9a759f0910260032ga08329eo22bcca5cf5ae9415@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Oct 24, 2009 at 17:25, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> This feature is of course very welcome, but I'd like to see the
> external toolchain support to be extended to toolchains not generated
> by Crosstool-NG (Codesourcery toolchains, for example, are still on my
> TODO-list).

Yes, this would definitely be desirable.

> Can we imagine a way of making this more generic ? Maybe we could
> detect the toolchain ?type? and act differently depending on this type ?

Currently I see no way on changing the menuentries depending on the
toolchain type (here I assume type is Crosstool-NG, Codesourcery,
etc...) Thus we will not know if there is any gdbserver in the
toolchain...

However, in the ext-tool.mk, we should be able to at least query the
toolchain for the configuration and parse that information, and decide
from what source the toolchain comes.

I could implement such a feature, although, I'd probably only be able
to verify that it works on a crosstool-NG based toolchain. The
necessary logics for other toolchains will have to be provided by
someone using them.

I'll see if I can squeeze such an implementation into the work
schedule for this week.

Regards,
Anders
