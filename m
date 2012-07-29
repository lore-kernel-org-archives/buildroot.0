From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 29 Jul 2012 17:10:08 +0200
Subject: [Buildroot] Understanding More about applying patches
In-Reply-To: <CALo-6+icxYrcFpMD=GtSjfhcMzOAhQ0quKxhgHxf006quMmo5g@mail.gmail.com>
References: <CALo-6+igesYYe2-Wj342CauvCgUZAFnUm9TtmW8+ObmUQvmkNQ@mail.gmail.com>
 <CALo-6+h1H16cYK9HZ7=gf98X3KNSc79D8xMkf=JCQ9d7ph_8Sg@mail.gmail.com>
 <CALo-6+icxYrcFpMD=GtSjfhcMzOAhQ0quKxhgHxf006quMmo5g@mail.gmail.com>
Message-ID: <50155250.6080002@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/28/12 18:59, Charles Krinke wrote:
> Assuming I have the last part correct, the next step is to add a patch
> after the configure step but before the build step.

  The patch step is the step after the extract step and before the configure
step. It's not a good idea to add patches after the configure step: if it
doesn't depend on the configuration, then there's no point doing it after
the configure step, but if it does depend on the configuration, than there's
a big risk that the patch won't work.

  It may be possible/necessary to update the configuration after the configure
step, e.g. updating the config.h.  Again, this should be avoided because it's
not very robust, but if there is no other way, you can do it in the
POST_CONFIGURE_HOOKS with a $(SED) statement.

  Fortunately, your other e-mails indicate that this won't be necessary.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
