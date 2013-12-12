From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 12 Dec 2013 23:00:18 +0100
Subject: [Buildroot] [PATCH] package/libgles: postpone the check for a
 missing GLES provider
In-Reply-To: <52A8710F.7040406@orange.com>
References: <52A730B0.3020104@orange.com>
 <1386702439-10093-2-git-send-email-yann.morin.1998@free.fr>
 <52A842A3.3010302@mind.be> <201312111325.49600.yann.morin.1998@free.fr>
 <52A862B4.50103@orange.com> <52A8710F.7040406@orange.com>
Message-ID: <52AA31F2.8070900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/12/13 15:05, David Corvoysier wrote:
> Sorry, I did another try from a clean environment and the second solution
> didn't work either: LIBGLES_DEPENDENCIES has the right (modified) value
> when it the LIBGLES_CONFIGURE_CMDS is evaluated, but not when the
> dependencies themselves are evaluated (I think it happens in
> pkg-generic.mk).

  Yes that's right. In this case, there's no workaround AFAICS...


  Thomas, do you remember what was the reason to include external.mk 
after package/*/*.mk rather than before? If there is no specific reason 
for it, we could move it.

  I also feel that the way the opengl stuff is handled now is a bit 
hacky, but I don't have any better ideas.


  Regards,
  Arnout


> So, the build doesn't fail on the LIBGLES_CONFIGURE_CMDS test, but if the
> xx_userland package has not been installed beforehand, it is not
> installed automatically when libgles is built.
>
> David
>
> Le 11/12/2013 14:03, David Corvoysier a ?crit :
>> Guys,
>>
>> The first solution did not work (as yann pointed out, the variable is
>> not exported), but the second does.
>> Who's in for a patch (me ?)
>>
>> David
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
