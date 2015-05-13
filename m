From: Lionel Orry <lionel.orry@gmail.com>
Date: Wed, 13 May 2015 07:44:23 +0200
Subject: [Buildroot] [git commit] czmq: unbreak static linking
In-Reply-To: <87617xh2tt.fsf@dell.be.48ers.dk>
References: <20150512184711.BDF2381DA3@busybox.osuosl.org>
 <20150512210011.4ed7af1d@free-electrons.com>
 <87a8x9h9uw.fsf@dell.be.48ers.dk>
 <20150512223405.595a8139@free-electrons.com>
 <87617xh2tt.fsf@dell.be.48ers.dk>
Message-ID: <CAKAx1ciU57KJKuZoQ+vTT5muE9tTM+kVgKF1wMzOq6D-L6xs4w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, May 13, 2015 at 12:02 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>
> Hi,
>
>>> I agree that it would be better if we could get this kind of fixes
>  >> upstream. I don't know how receptive upstream will be as this doesn't
>  >> affect "normal people" though.
>
>  > Well, upstream zeromq should be able to accept patches making their .pc
>  > file more correct.
>
> True.
>
>  >> That is arguable correct, but things are a bit more complicated as:
>  >>
>  >> - libzerozmq is written in C++ and uses libstdc++ but exposes a C api
>  >> - czmq is a higher level wrapper also written in C
>  >> - Test program (czmq_selftest) is a C program linking against libczmq
>  >> (and in term libzeromq)
>
>  > Right, but that still doesn't answer whether using gcc to link a
>  > C program against a C++ library is correct or not :-)
>
> I believe it is. How are people using E.G. libczmq to know that they
> need to link with g++ just because a library libczmq uses happens to use
> C++?
>
>
>  >> >  * Or using gcc to link with a C++ library is correct, and in this
>  >> >    case, libzmq.pc should be fixed to include -lstdc++ in Libs.private.
>  >>
>  >> While this is correct, it is not directly related to this. Czmq doesn't
>  >> use its own .pc file to know how to link the selftest program.
>
>  > I'm not talking about fixing the czmq .pc file, but the zeromq one. If
>  > zeromq uses C++, then its .pc file should have -lstdc++, no?
>
> Ahh, now I get it. Yes, fixing libzmq.pc to have a Libs.privat: -lstdc++
> should also work.
>
> I'll give it a try.

I agree, the libzmq.pc needs to be fixed. It is not specific to czmq
but to all software components which statically link against libzmq
but are not necessarily written in C++.
I have this issue on other projects and I manually add '-lstdc++'.

>
> czmq seems to be missing a dependency on host-pkgconf though.
>
> --
> Venlig hilsen,
> Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,
Lionel
