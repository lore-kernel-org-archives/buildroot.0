From: Marc Lindahl <marc@bowery.com>
Date: Tue, 7 Nov 2006 11:53:08 -0500
Subject: [Buildroot] Suggestion, Keep version in a separate file.
In-Reply-To: <byfTFYWKDbpt.qCRz32F5@mailout.dof.se>
References: <byfTFYWKDbpt.qCRz32F5@mailout.dof.se>
Message-ID: <c1096ed97bcbb70a39804f0aad20be24@bowery.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Nov 7, 2006, at 2:43 AM, Ulf Samuelsson wrote:

>
> That sounds like it would make the buildroot system overly complicated
> for an rare edge case.
> You can do that by managing your .config files - many ways to do that
> already....
>
> => I really do not see
>     how I can, using .config,
>     select between
>     package-1.18 and
>     package-1.19 unless
>     there is support for
>     it in the Config.in files.
>     (Which there isn't)
>     so I have to use two
>     different versions of
>     buildroot and this is
>     making life more
>     complex.
>
>     Anyway, what's so complex
>     about adding an extra
>     include statement in
>     the Makefile?
>
>     include $(BR2_VERSION_INFO)

one more thing that could cause serious confusion in the normal case...


>
>     and set this to ".versions"
>     in the main Config.in as
>     default.
>     If a user wants a different
>     set of package versions
>     then it is easy to select
>     another file.
>
>     By using different .config
>     files you easily can maintain different projects using different 
> Version Info files.
>
>
>     I doubt this is a corner
>     case.  Anyone that is supporting more than one
> project runs into this problem.


I disagree that to manage separate projects within the same buildroot 
tree makes any sense whatsoever.  It opens the opportunity that 
unrelated projects could intermingle - cross-pollinating bugs, etc.

I really for the life of me can't figure out why you'd want to do that 
- normally you want a bunch of builds all using the same packages (e.g. 
debugging, emulator, eval board, target hardware, etc.) - in which case 
you really want to be sure that your packages are all the same, else 
you debug a different version than you release!

perhaps you can give a real-world example or two?

buildroot already supports the speed optimization to relocate the 
package directory... you could have all your projects pointing to the 
same one without the intermingling problem.

for separate projects why wouldn't you have separate buildroot trees - 
I know I would for no other reason than the usual contractual 
non-disclosures that come with consulting jobs.
