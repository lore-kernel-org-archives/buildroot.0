From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 1 May 2009 19:52:10 -0300
Subject: [Buildroot] avr32 support question
In-Reply-To: <20090501162116.B66CF1C8467@whitealder.osuosl.org>
References: <20090501162116.B66CF1C8467@whitealder.osuosl.org>
Message-ID: <d6cda7730905011552q74d2e639rd0f1abe3d915ab4d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Chris,

On Fri, May 1, 2009 at 1:14 PM, Chris Bare <chris@bareflix.com> wrote:
> I'm working with the Atmel NGW100 using the buildroot from their website which
> is based on buildroot 20081218.

I've been working with AVR32 as well into buildroot. I use the NGW100
and a home made board as well.

> Recently I've seen some interesting patches go in (like for reducing the size
> of openssl). But when I compare the latest to the Atmel version, I see things
> missing, like the avr32-asm patch for openssl.

I removed the openssl patch. While it's nice to have, it was just an
AES asm optimization, this patch was in the way of keeping openssl
updated. The Atmel buildroot fork uses an openssl version that is at
least 3 releases behind, with several security updates in the between.
Without the patch going into mainstream, there is just no way we could
keep up supporting it indefenetly, rebasing and fixing conflicts at
each new release.

> I realize that ideally that should be integrated upstream in the openssl
> package, but I'm curious what other avr32 users are doing right now.

No need to sell me on that. This is very, very frustrating [1]

> Currently I'm sticking with the Atmel version, and have pulled in a few
> package updates from the buildroot head, but that doesn't seem like a good
> long term solution.
>
> Any thoughts or suggestions?

Indeed. A while back when I was faced with the same question, I
decided to use (and join) upstream buildroot. There are several
reasons:

1 - Atmel buildroot didn't had a public repository (I guess they have now)
2 - I couldn't fix it directly, and eventually sometimes my fixes
conflicted with their fixes.
3 - They lag too much behind the upstream development.

I belive the main reason why Atmel decided to fork was because
buildroot didn't do releases back then. It's not easy to point
custommers to a project when you are not sure if svn HEAD will work or
not. We have solved this issue now, and buildroot is getting a lot
more organized then before. We have a maintainer, and releases now.

The thing about buildroot is, if you want to do a finished product
with your own closed source packages, you must have your own tree. So,
reason 1 and 2 was quite a annoying for me. Then having to track 2
different trees isn't really nice.

Well, I hope it helps.

Kind Regards,
    Thiago A. Correa

[1] http://www.avrfreaks.net/index.php?name=PNphpBB2&file=viewtopic&t=77324
