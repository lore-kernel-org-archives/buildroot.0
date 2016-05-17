From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 May 2016 00:30:08 +0200
Subject: [Buildroot] [PATCH] Config.in.legacy: fallback to glibc when
 eglibc was selected
In-Reply-To: <20160517092642.05c8c118@free-electrons.com>
References: <1463469451-18931-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <D52038F0-6ED4-4510-B67C-D71ADB9008A3@free.fr>
 <20160517092642.05c8c118@free-electrons.com>
Message-ID: <8a38175e-d5c8-e2da-543d-7f45d36fc36c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/17/16 09:26, Thomas Petazzoni wrote:
> Hello,
>
> On Tue, 17 May 2016 09:23:03 +0200, Yann E. MORIN wrote:
>
>> BR2_TOOLCHAIN_BUILDROOT_GLIBC is part of a choice, so you can't select it.
>>
>> That's the limit of our legacy handling: it can't handle choices.
>
> Gah, yes, indeed. I guess the only option is to keep a:
>
> 	default BR2_TOOLCHAIN_BUILDROOT_GLIBC if BR2_TOOLCHAIN_BUILDROOT_EGLIBC
>
> but it's rather annoying to keep legacy code forever elsewhere than in
> Config.in.legacy. So I'd prefer that we don't do anything in fact: the
> number of users using eglibc in their configuration is probably pretty
> low.

  Agreed.

  Regards,
  Arnout

>
> Thanks for the review!
>
> Thomas
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
