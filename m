From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Jul 2015 09:26:27 +0200
Subject: [Buildroot] [PATCH] autobuild - acpid does not build against
 musl
In-Reply-To: <CA+BsyQ7vZTqjt9OKgj_tcBTx=rC9zHCxzmN4wSPJ=20TD=MRwA@mail.gmail.com>
References: <1437417346-18621-1-git-send-email-brendanheading@gmail.com>
 <20150720224152.11d13fa5@free-electrons.com>
 <CA+BsyQ7vZTqjt9OKgj_tcBTx=rC9zHCxzmN4wSPJ=20TD=MRwA@mail.gmail.com>
Message-ID: <20150721092627.0fa306db@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brendan,

On Tue, 21 Jul 2015 01:16:16 +0100, Brendan Heading wrote:

> I think the best course with this problem is to have a chat with the
> upstream musl guys (first choice) or patch the buildroot musl
> toolchain (second choice).

Neither of this is going to happen, I believe. TEMP_FAILURE_RETRY is a
glibc-ism, and the musl developers are generally not really interested
in adding glibc-isms.

Patching the buildroot musl toolchain is also not acceptable, as it
means we would no longer support musl external toolchains that don't
carry our patches.

> The absence of TEMP_FAILURE_RETRY will break more than one package so
> in retrospect it's probably more cleaner to try to fix it properly
> rather than add patches to every package where it shows up. The only
> downside is that acpid will be broken until it's resolved.

But that's still the only reasonable solution. The idea being that
those patches should be contributed to the upstream acpid project, so
that we can drop them from Buildroot the next time acpid makes an
official release.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
