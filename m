From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 22:46:07 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CA+BsyQ7p+dtTmE41+DvuyZ8n0jLgn_6agGpi5MuD2aUOR+e1Dw@mail.gmail.com>
References: <20150722063018.99E6B101957@stock.ovh.net>
 <20150722094349.424e7a3e@free-electrons.com>
 <CA+BsyQ4knrWo+cA7_Og91Lg3_eq+qCRZij+N5bx6nccE+g91jg@mail.gmail.com>
 <CA+BsyQ4EGBokRsDhTuzfPRzgQ99sEr75SG3B8UxLJfX64fmtNQ@mail.gmail.com>
 <55AF8CF6.7080709@zacarias.com.ar>
 <20150722144535.103766f3@free-electrons.com>
 <55AF91B5.8050806@zacarias.com.ar>
 <CA+BsyQ77MtQSbwE-XCyi3Q0=079pvd4Rx=OoVBr9X_7zx02NyQ@mail.gmail.com>
 <20150722165405.217f4e4f@free-electrons.com>
 <CA+BsyQ67ic88wTW173o4QWbZS8d=cnSRh_2RDp4Ffs8T2Lsyeg@mail.gmail.com>
 <55AFB950.10603@zacarias.com.ar>
 <20150722220606.58233cd0@free-electrons.com>
 <CA+BsyQ7p+dtTmE41+DvuyZ8n0jLgn_6agGpi5MuD2aUOR+e1Dw@mail.gmail.com>
Message-ID: <20150722224607.190c7886@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

On Wed, 22 Jul 2015 21:40:00 +0100, Brendan Heading wrote:
> > Let's have a look at the issue on a per-package basis. For webkit, can
> > it either avoid using atomic operations (like glib), or can we add a
> > configure.ac test for the availability of the atomic operations, and if
> > not available, attempt again with -latomic linked in?
> >
> 
> Had a quick look at webkit. If we are talking about the same problem, the
> offending section is in Source/WTF/wtf/Atomics.h : ("wtf" is a great name
> for this module, with the amount of conditional stuff in here!)

Which webkit did you look at? The one in package/webkitgtk/ which is
going to be deprecated and that we don't really care about? Or the
webkitgtk24 package submitted by Gustavo (only in patchwork for now,
not merged yet).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
