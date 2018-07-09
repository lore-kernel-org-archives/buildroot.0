From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Jul 2018 00:21:24 +0200
Subject: [Buildroot] [PATCH] systemd: add an option to use busybox's
 getty
In-Reply-To: <be826cad-71c5-10ac-aec2-bc4dc919e356@smile.fr>
References: <20180708195429.9693-1-jeremy.rosen@smile.fr>
 <be826cad-71c5-10ac-aec2-bc4dc919e356@smile.fr>
Message-ID: <2708cb51-e9fd-2176-a129-98202de43ddf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-07-18 10:02, Romain Naour wrote:
> Hi Jeremy,
> 
> Le 08/07/2018 ? 21:54, J?r?my Rosen a ?crit?:
>> Currently, the patch to replace agetty with busybox's getty is always
>> applied.
>>
>> this patch adds a compile-time option to systemd to choose either agetty
>> or busybox's getty and chooses the correct option depending on agetty being
>> selected in busybox
>>
> 
> As discussed privately, if you want an example on how apply a patch
> conditionally you can take a look at the gcc package [1].

 I don't think we want to apply patches conditionally. In fact, J?r?my's change
is much better, because it makes the patch upstreamable.

 That said, as discussed on IRC, a much easier approach would be to overwrite
systemd's getty unit files with custom buildroot unit files in case
UTIL_LINUX_AGETTY is not selected. Then the patch could be dropped entirely.

 Regards,
 Arnout

> This has been introduced by [2] but there is some other place where
> $(APPLY_PATCHES) is used (conditionally or unconditionally).
> 
> $(APPLY_PATCHES) is defined in package/Makefile.in but this way to use it is not
> documented in the manual [3].
> 
> Best regards,
> Romain
> 
> [1] https://git.busybox.net/buildroot/tree/package/gcc/gcc.mk#n41
> [2]
> https://git.busybox.net/buildroot/commit/?id=197006a41c1a0450bf6350d5742e186b5b0c69de
> [3] http://nightly.buildroot.org/manual.html#patch-policy
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
