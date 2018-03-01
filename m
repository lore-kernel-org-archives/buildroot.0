From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Mar 2018 21:54:19 +0100
Subject: [Buildroot] [PATCH 1/1] azmq: bump to version 1.0.2
In-Reply-To: <1519842208.25567.225.camel@impinj.com>
References: <20180227205125.8121-1-fontaine.fabrice@gmail.com>
 <87lgfem9h0.fsf@dell.be.48ers.dk>
 <MWHPR0601MB37534B75BE813D41A6C3920ED3C70@MWHPR0601MB3753.namprd06.prod.outlook.com>
 <87vaehlj1v.fsf@dell.be.48ers.dk> <1519842208.25567.225.camel@impinj.com>
Message-ID: <9013a807-b95c-fff0-8577-4ad38a40fe39@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-02-18 19:23, Trent Piepho wrote:
> On Wed, 2018-02-28 at 07:33 +0100, Peter Korsgaard wrote:
>>>>>>> "Trent" == Trent Piepho <tpiepho@impinj.com> writes:
>>
>>  >> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>>  >> Does this fix any big / security issues so it needs to go to master or
>>  >> s this for next?
>>
>>  > The previous version of azmq will not build with the boost version in 2018.02-rc2.
>>
>>  > It does work with buildroot 2017.11.2.
>>
>>  > Not sure exactly where the breakage point was between those releases.
>>
>> Ahh, so azmq-1.0 doesn't build in 2018.02-rc3? Odd, I don't see it in
>> the autobuilder
> 
> azmq is a header only library and buildroot disables the library's unit
> tests, so there is nothing to fail when buildroot "builds" the library.
>  But if you use it, it doesn't work with some asio changes that went
> into boost.
> 
> It would be interesting if buildroot could build and run a package's
> unit tests.  I wonder if autobuilders would be able to find many bugs
> that way?

 The runtime testing infrastructure is meant for exactly that. Well, it would
need to be extended with some way to build the unit tests and copy them to the
target - possibly in a post-build script.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
