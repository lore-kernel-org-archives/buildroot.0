From: Brendan Heading <brendanheading@gmail.com>
Date: Thu, 23 Jul 2015 20:03:06 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <55B12F52.9090900@zacarias.com.ar>
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
 <CA+BsyQ5=nGz6W+a+QXPeZSKpyV8vfFfcwibrgC_WXHT0dXQK+A@mail.gmail.com>
 <55B12F52.9090900@zacarias.com.ar>
Message-ID: <CA+BsyQ5XyMpWvFz2Y_NZTuQk3cB62xLj7Bb1tt89LcWB8_khkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
>
>> mips & mips64 are disabled for a whole different reason, which is endian
> breakage.
> mipsel & mips64el are enabled in fact, and use the libatomic trick, which
> are also used for i386 and superh (though superh is disabled in general
> because of segfaults, i kept the kludge for informational purposes). The
> kludge is also kept for mips for the same reason.
> Regarding the atomics fallback it's sort of accurate, however seems to be
> failing for some reason.
> I don't have those builds built at the moment to check the details.
> If you look at the comment inside Atomics.cpp it states that gcc >= 4.8
> will handle all of this, which is the reason for libatomic, so i doubt any
> more fixing will go into webkitgtk regarding this, specially since it
> requires 4.7-4.8+ to build anyway.
> Regards.
>

Thanks for explaining. I agree with you, it's pointless going to a lot of
trouble to support much older compilers unless there's a really good
reason.

I have a CI20 here, which is a mipsel arch. I will have a play with it some
time during the next couple of days and report back.

regards

Brendan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150723/9ee6c98a/attachment.html>
