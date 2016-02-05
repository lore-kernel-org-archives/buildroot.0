From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Feb 2016 14:09:09 +0100
Subject: [Buildroot] [PATCH 1/1] protobuf: apply patch to compile for
 PowerPC
In-Reply-To: <1851498233.1377552.1454670293384.JavaMail.zimbra@datacom.ind.br>
References: <1453986515-9505-1-git-send-email-casantos@datacom.ind.br>
 <20160205000613.504940f9@free-electrons.com>
 <1851498233.1377552.1454670293384.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20160205140909.764ff2e6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Henrique,

On Fri, 5 Feb 2016 09:04:53 -0200 (BRST), Henrique Marks wrote:

> I agree with you, but let me say that the original patch just corrects a "syntax error" in the code !
> 
> + #define GOOGLE_PROTOBUF_ATOMICOPS_ERROR \
> +-#error "Atomic operations are not supported on your platform"
> ++"Atomic operations are not supported on your platform"

Correct. In fact I thought it was only with recent compilers, but it is
probably incorrect regardless of the gcc version, and it doesn't fail
in all cases because we ensure that protobuf is only built on
architecture on which protobuf has built-in support for atomic
operations. And therefore you don't fall into the #else cases where
this bogus error macro is used.

> This syntax error correction was submitted upstream, but wasnt
> applied to protobuf 2.6.1, just to protobuf 3x series. As we cannot
> drive the push to protobuf 3.x series right now (but we can in the
> near future, as soon as the first 3.x appears), we submitted a patch
> to buildroot.

Sure. But in this case, we prefer the patch to be a backport from
upstream, so that it is clearer when bumping that the patch can be
dropped.

And also, when a patch has been accepted by upstream, we have a higher
confidence that the patch is correct.

> Despite of this, the solution using the atomic patch you sent seems
> ok. We are using the patch we submmited for six months now,
> internally, and we try to send upstream everything, as soon as
> possible, so that we can keep up with the upstream tree. When your
> solution goes in, we can remove our internal patch (it is submmited
> in protobuf upstream 3.x anyway).

OK. Could you work on a proper patch series on the atomic series is
merged in master ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
