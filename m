From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Jun 2013 08:21:17 +0200
Subject: [Buildroot] Changes in the Buildroot autobuilders
In-Reply-To: <20130617175407.GA3202@free.fr>
References: <20130616180054.58f52914@skate> <20130616170305.GI3495@free.fr>
 <20130616191806.7b4a899a@skate> <20130616172508.GL3495@free.fr>
 <20130616200540.5a370504@skate> <20130617074535.GB16699@lukather>
 <20130617094958.33eaff88@skate>
 <CAEBucnCWYyj23_RyLtP3p-B6zmBYiYOA4LiODMEdxEr7x4D+xw@mail.gmail.com>
 <20130617175407.GA3202@free.fr>
Message-ID: <51BFFC5D.4040600@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/06/13 19:54, Yann E. MORIN wrote:
> On 2013-06-17 11:20 -0500, Spenser Gilliland spake thusly:
>> >Are we sure we want to add more variables to the .mk files.  One of
>> >Buildroot's main differentiators is the cleanliness of these files in
>> >comparison to other packaging methods.

  +1

  At least on the short term, the number of maintainers will be small and 
the number of packages per maintainer will be large. Some maintainers 
will also be fairly ephemeral - e.g. Maxime added support for systemd a 
year ago, but probably by now he doesn't consider himself a maintainer of 
it anymore. Also the rules may be a little more complex than based on 
package name.

  So I think a nice solution would be to add a script in support/scripts 
that explicitly encodes all the maintainers - maintainers can add 
themselves with patches (just like in the kernel). The a.b.o would fetch 
the script once a day just before sending out its daily mails, and call 
it with everything it knows about the build failure set in the environment.

>> >
>> >As an alternative, this information could be pulled from the git log
>> >and anyone who has made a change to the package directory in the past
>> >would be subscribed to errors.
> No, I am not in favour of this solution.
>
> Being a 'maintainer' should be voluntary, opt-in, and explicit.

  +1 too.

  However, Spenser points out in another mail:

> I think many people would like to know if something they did may have
> triggered a bug, not just the maintainer of the package.

  I could agree with sending mails automatically to the authors of a 
package commit if the commit was done in the last week or so.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
