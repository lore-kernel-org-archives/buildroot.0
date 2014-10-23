From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 23 Oct 2014 19:41:01 +0200
Subject: [Buildroot] [PATCH] Complain loudly if BR2_GLOBAL_PATCH_DIR
 does not exit
In-Reply-To: <5447DCCB.1030409@mind.be>
References: <1413880974-30138-1-git-send-email-sojka@merica.cz>
 <20141021165817.GI3912@free.fr>
 <CAGduivxejVSE-p42u+WRBbYqc-oMNSKdd6cEqBw4ROtuKUU5sA@mail.gmail.com>
 <87tx2wjpob.fsf@steelpick.2x.cz>
 <CAGduivy5cXHFqEj-ZV16XSUU8y+fEaDS2cOZu-OAJ16q=XkmTQ@mail.gmail.com>
 <5447DCCB.1030409@mind.be>
Message-ID: <CAGduivxCoA1ufF7joo_eAGXWkezS196Xn1kFfXfWctrcC3rM1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, Michal, Yann, all,

On Wed, Oct 22, 2014 at 6:35 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 22/10/14 13:54, Maxime Hadjinlian wrote:
>> Other question, why don't put that bit of code at the beginning of the
>> target stamp_patched ? Or at least in the target stamp_patched ?
>
>  Because we prefer to have checks for the validity of the .config immediately,
> before the build is started. Even a 'make savedefconfig' or 'make graph-depends'
> will trigger the error. For this particular one it is not so important, but for
> other checks it is really useful to have it before the build begins and not
> after half an hour of building.
Understood. Thanks for clearing that up.
>
>  Note that this is currently not always the case, e.g. dependencies.sh, external
> toolchain validity. But if possible, I prefer .config checks to be done in make.
>
>
>  Regards,
>  Arnout
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
