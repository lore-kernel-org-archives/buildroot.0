From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 12 Jun 2014 14:54:24 +0200
Subject: [Buildroot] [PATCH] system: move system.mk recipes inside the
 "target-finalize" rule
In-Reply-To: <20140612102339.29e14cf3@free-electrons.com>
References: <1402390367-25418-1-git-send-email-fabio.porcedda@gmail.com>	<20140610223358.69a70e6e@free-electrons.com>	<CAHkwnC8N3v9ULfbqUeyjtCnb3Cpd6y=PPnwgjXBwSme6hywM5w@mail.gmail.com>	<539884A4.5060705@mind.be>	<CAHkwnC-dnWUJf=QR-6DEBwmkEoOoUuwDAWRj0EcQt5Cx8fOX0Q@mail.gmail.com>	<CAHkwnC_exQsbt7e9CJrzO6FA8HQGjJMWmVOkevUxjSYpHbdvJw@mail.gmail.com>	<20140612095615.1a20e62e@free-electrons.com>	<CAHkwnC9BWE=Mt2d8wqFK6pyzW99QFtuvFC=mixfh+tbpgzCYwQ@mail.gmail.com>
 <20140612102339.29e14cf3@free-electrons.com>
Message-ID: <5399A300.6080708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/12/14 10:23, Thomas Petazzoni wrote:
> Dear Fabio Porcedda,
> 
> On Thu, 12 Jun 2014 10:05:41 +0200, Fabio Porcedda wrote:
> 
>>> I think one of the concern with the hook thing was that the hooks would
>>> be spread all over the Buildroot tree. To mitigate this concern, maybe
>>> we could have a naming convention for those hooks that they should all
>>> start with TARGET_FINALIZE_<something>, like
>>> TARGET_FINALIZE_PURGE_LOCALES ?
>>
>> Ok fine, i like it, maybe using TARGET_FINALIZE_HOOK_PURGE_LOCALES is
>> too verbose?
> 
> If anything, the "HOOK" should be at the end. Not sure it's needed
> though if we have all variables prefixed by TARGET_FINALIZE_<something>.
> 
> That being said, now that I can think of it, we can anyway always grep
> all the hooks by grepping for "TARGET_FINALIZE_HOOKS", which will
> return all files doing:
> 
> TARGET_FINALIZE_HOOKS += <something>
> 
> So in the end, the name of make function being registered doesn't
> matter much, but still for consistency, I think it's good to have a
> common prefix for all of them.

 Well, the main reason to use the hooks approach is to be able to spread it out
over different makefiles, and in particular to be able to do package-specific
target-finalize things. Therefore, the hooks themselves should be named
<PKGNAME>_FOO_BAR.

 Also, for the hooks that are currently in use, we don't usually include HOOK in
the name.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
