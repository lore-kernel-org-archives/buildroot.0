From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 13:50:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/jsoncpp: broken with musl on x86
In-Reply-To: <1445374313-30804-1-git-send-email-joerg.krause@embedded.rocks>
References: <1445374313-30804-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20151021135029.4b4b9e42@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Tue, 20 Oct 2015 22:51:53 +0200, J?rg Krause wrote:
> This patch replaces a previous submission made by Bernd Kuhls some while ago
> [1].
> 
> The posix_memalign declaration is incompatible with musl for C++, because of
> the exception specification [2]. Note, the referenced patch is part of the a
> patch series to "Add musl support to GCC".
> 
> Instead of patching gcc in Buildroot we disable jsoncpp and any reverse
> dependendy with the musl toolchain on x86.
> 
> [1] https://patchwork.ozlabs.org/patch/505425/
> [2] https://gcc.gnu.org/ml/gcc-patches/2015-04/msg01084.html

It is indeed not very practical to fix gcc, since external toolchains
would continue to be affected. But isn't there a way of working around
the problem inside jsoncpp itself, so that we don't have to do this
complicated reverse-dependency propagation ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
