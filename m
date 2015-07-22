From: Brendan Heading <brendanheading@gmail.com>
Date: Wed, 22 Jul 2015 22:03:57 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150722224607.190c7886@free-electrons.com>
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
 <20150722224607.190c7886@free-electrons.com>
Message-ID: <CA+BsyQ5=nGz6W+a+QXPeZSKpyV8vfFfcwibrgC_WXHT0dXQK+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> Which webkit did you look at? The one in package/webkitgtk/ which is
> going to be deprecated and that we don't really care about? Or the
> webkitgtk24 package submitted by Gustavo (only in patchwork for now,
> not merged yet).
>

Ah, sorry about that. Should have checked first.

The newer webkit being picked up by Gustavo's patch seems to check the
feature macros so in principle it shouldn't have this problem.

That makes me curious, though. Gustavo, you said in your comments you
disabled MIPS support due to the absence of __sync_fetch_and_add_8 -
however, webkit appears to provide its own substitute for this function in
the event that it is undefined by the compiler ? (see
Source/WTF/wtf/Atomics.cpp). At first glance I would have thought this
should cover all the relevant cases, but no doubt you identified an issue.

regards

Brendan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150722/ac3f397d/attachment.html>
