From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 03 May 2013 18:46:37 +0200
Subject: [Buildroot] [PATCH v2 1/3] barebox: add custom version option
In-Reply-To: <CAHkwnC-ZiO0Fyd2=QaE8RPuWFfzsf4o_6VUpzVo5tOFLPxMLkA@mail.gmail.com>
References: <1366184503-16875-1-git-send-email-fabio.porcedda@gmail.com>
 <1366184503-16875-2-git-send-email-fabio.porcedda@gmail.com>
 <20130501231009.787484f5@skate>
 <CAHkwnC9xHJAHNauNewEGRof4u6YUsLyCsjm5PQgPhCKPwM53rg@mail.gmail.com>
 <20130503105531.1b38a88e@skate>
 <CAHkwnC-ZiO0Fyd2=QaE8RPuWFfzsf4o_6VUpzVo5tOFLPxMLkA@mail.gmail.com>
Message-ID: <5183E9ED.4080604@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/05/13 11:17, Fabio Porcedda wrote:
> On Fri, May 3, 2013 at 10:55 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
[snip]
>> I don't really have a strong opinion about this thing, probably Peter
>> and Arnout have more ideas than I do on this.

  I don't. I started to reply this morning, then realized that I couldn't 
formulate it consistently, so I gave up.

  The _LATEST symbol name has the disadvantage that your build is not 
reproducible when you update buildroot, because the meaning of "latest" 
will have changed. However, this is already the case for all other 
packages (which don't allow choosing the version).

  With the version number in the symbol name, at least you are warned by 
make oldconfig when the version has changed, because it will offer the 
choice again.

  That said, I find this disadvantage so minor that it is not worth the 
effort of changing the symbol name all the time. So either option is fine 
for me.


>> The only thing I care about is to not make modifications specifically
>> on Barebox that are inconsistent with what is done on U-Boot, the
>> kernel, or other version-selectable components. For example, U-Boot
>> still allows to chose between several recent versions, which would make
>> it inconsistent with the patches you're proposing, and that's the thing
>> I don't like.
>
> In the patch set v3 barebox is consistent with the kernel.
>
> If you are speaking just about consistency, I can send a patch for U-Boot too.
> IMHO the kernel way is more flexible, so if we must choose only one method,
> the kernel way is better.
>
> A problem with having only the latest three version available
> is that barebox and u-boot release frequency are very different.
> Barebox have 12 release per year, U-Boot only 4.
> The latest three release of U-Boot cover nine months but the latest
> three release of barebox cover only three months.
> So if a defconfig use a specific barebox version, that defconfig can
> be used only for three months.
> I think that three months is not enough.

  I agree with that one.  In fact, I don't think it makes much sense to 
have the option to go for an earlier version, also for U-Boot. If you 
need an earlier version (e.g. because you have patches that won't apply 
to the current version), chances are that it is not one of the few that 
are offered by buildroot. BTW, a nice addition would be to require 
_CUSTOM_VERSION before you can specify a patch directory, so that this 
consistency is guaranteed to some extent.

  So I think that Fabio's basic approach (offer only the latest version, 
but also have the option to specify the version) is the best one.

> It's better if i send patch for U-Boot too?

  I would say yes, that would be nice.


  But let's hear what Peter has to say as well.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
