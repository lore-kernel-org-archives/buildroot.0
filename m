From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Aug 2017 09:57:42 +0200
Subject: [Buildroot] [PATCH 00/10] libssl: new package
In-Reply-To: <CAFSsvmoy15xjrs7d5-etO9-d6oWJdZGDcXgKdZjeQ7TWFngmXA@mail.gmail.com>
References: <20170804185521.12320-1-Adamduskett@outlook.com>
 <d7c29c3c-8cbb-60fc-9374-c3e33417e964@mind.be>
 <CAFSsvmoy15xjrs7d5-etO9-d6oWJdZGDcXgKdZjeQ7TWFngmXA@mail.gmail.com>
Message-ID: <32e05249-20bd-73ee-3b62-ea5d8e1c2c76@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Adam,

On 05-08-17 03:19, Adam Duskett wrote:
> Hi
> 
> I appreciate the fast response.
> On Fri, Aug 4, 2017 at 5:05 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>  Hi Adam,
>>
>>  Wow, that's fast work!
>>
> 20 hours of solid work really isn't fast.

 If you do those 20 hours of work within two days, I consider it really fast!

 And sorry for my slow response this time over, I'm suffering a little from bad
internet connection on my holidays and when it got better, there was more recent
stuff that bypassed this in the LIFO queue...

>> On 04-08-17 20:55, Adam Duskett wrote:
>>>  - Add libssl as a new virtual package, and add OpenSSL as the only option.
>>>    This prevents any package from breaking.
>>
>>  I briefly mentioned before but clearly didn't explain enough: this will not
>> fly. The problem is that we want existing configurations to keep working without
>> a package silently disappearing. So the following procedure should work:
[snip]
> I want to first say this: I appreciate your response and your feedback.
> 
> However;
> 
> I don't have time nor the energy to rebase and made all the changes
> you have requested,
> then some more arbitrary changes that other people will request that
> aren't outlined in the
> buildroot manual.

 What can we change in the manual to make this better? Adding a paragraph to
explain that existing .config's should never break, would that help? Something like:

==== Stable interface

Buildroot doesn't have much of an interface, except for the `.config`
configuration file. To make it easy to continuously upgrade Buildroot, we make
sure that a `.config` file that worked in a previous release, still yields the
same combination of packages after an update. In some cases, this is not
possible, e.g. because a configuration option has been renamed or removed. For
this, the legacy handling approach [ref:...] must be implemented. In some more
complicated cases, even legacy handling does not help and other solutions to
maintain backward compatibility must be found.

 Does that more or less sum up the issue here? Anything that can be improved
about the text?


 About the "arbitrary changes" you mention, I guess you refer to the fact that
we first asked you NOT to make libssl a virtual package, and now we're changing
our mind again? Well, indeed, it's a case of "advancing insight" as we say in
Dutch. In addition, the very reason I didn't accept your first implementation of
a virtual package was because it would break existing .configs, and this would
block the adoption of libressl entirely. Now, at least, we have the libressl
package in Buildroot (though admittedly it is of limited use if almost no
package makes use of it).


> As it sits, feel free to reject the series if you so wish to.  For the
> next year, I am going to be solid
> booked and I don't have time to fix this.

 That's a pity, we really valued your contributions, especially since you are
able to deal with complicated stuff.

 Could you at least take a look at the alternatives I proposed and give an
opinion on which one you think is most appropriate? Or perhaps you can even
think of a third alternative? That will make life easier for anyone who is
willing to take over this series.


> Again, I appreciate everything you guys are doing (And I certainly
> don't have the time nor the energy
> to make 100+ patches for a package that nobody actually cares about :] )

 I don't think nobody cares about this - as proven by the discussion on IRC, I'd
say.


> Sorry for wasting your time!

 Absolutely not. Free software projects with 100+ contributors only work because
people throw out ideas that are improved on by others.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
