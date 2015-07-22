From: Brendan Heading <brendanheading@gmail.com>
Date: Wed, 22 Jul 2015 12:24:54 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CA+BsyQ4knrWo+cA7_Og91Lg3_eq+qCRZij+N5bx6nccE+g91jg@mail.gmail.com>
References: <20150722063018.99E6B101957@stock.ovh.net>
 <20150722094349.424e7a3e@free-electrons.com>
 <CA+BsyQ4knrWo+cA7_Og91Lg3_eq+qCRZij+N5bx6nccE+g91jg@mail.gmail.com>
Message-ID: <CA+BsyQ4EGBokRsDhTuzfPRzgQ99sEr75SG3B8UxLJfX64fmtNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22 July 2015 at 11:48, Brendan Heading <brendanheading@gmail.com> wrote:
>
> It sounds like the kind of problem that should ordinarily be detected and
> handled by the configure script (ie automake). It strikes me as strange
> that the developer is supposed to know whether or not to link a library
> depending on what kind of code the compiler generated, so there must be
> something I'm missing.
>
> Since the problem doesn't seem to occur on i386/x86_64 I'm wondering if
> it's one of those cases where SPARC gcc is lagging ..
>

A bit of further info. buildroot is generating a toolchain for SPARC v8 (25
years young!), which doesn't have the instructions available to support all
of the atomic functions in GCC. It seems to support some of them, so naive
source code *thinks* that since the macro indicating the presence of atomic
support is defined, that all of the functions exist.

I guess there are a few options. We could find some way of disabling atomic
support completely when building for SPARC; or set up the LDFLAGS to always
link libatomic; or try to patch upstream to detect atomic features better -
the configure script could be extended to detect if libatomic is needed or
not.

regards

Brendan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150722/c3fa76e1/attachment.html>
