From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Oct 2013 08:53:37 +0200
Subject: [Buildroot] [PATCH] libcap-ng: doesn't build on AVR32,
 requires TLS support
In-Reply-To: <87fvsecbz5.fsf@dell.be.48ers.dk>
References: <1381077279-19561-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <871u3yfddd.fsf@dell.be.48ers.dk> <20131006232344.493a4ebc@skate>
 <87fvsecbz5.fsf@dell.be.48ers.dk>
Message-ID: <20131007085337.729422ca@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sun, 06 Oct 2013 23:42:54 +0200, Peter Korsgaard wrote:

>  Thomas> It wouldn't work with external toolchains, which is the reason why I
>  Thomas> excluded the AVR32 architecture rather than using a BR2_GCC_ENABLE_TLS
>  Thomas> condition.
> 
> Ok, but from your comment I believe it should also depend on
> BR2_GCC_ENABLE_TLS (E.G. it would break on other archs if you disable
> TLS support)?

If we make the package depend on BR2_GCC_ENABLE_TLS, then it would no
longer be visible for any external toolchain.

> If we start having other packages needing TLS, then we should perhaps
> provide the option for external toolchains as well, similar to how we do
> for the other toolchain settings.

I'm always a bit reluctant to add more and more toolchain options,
since they are a pain to maintain, and do not necessarily reflect real
use cases. Is it really an useful use-case to support non-TLS
toolchains on architectures where TLS support is available?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
