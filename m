From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 15 Apr 2017 00:48:48 +0200
Subject: [Buildroot] [PATCH][autobuild] Use last 4 lines of log instead
 of 3 when getting failure reason
In-Reply-To: <1478880282.3874.5.camel@synopsys.com>
References: <1477478717-19209-1-git-send-email-vzakhar@synopsys.com>
 <20161026135259.425f0f0a@free-electrons.com>
 <1477484955.30609.16.camel@synopsys.com>
 <1478880282.3874.5.camel@synopsys.com>
Message-ID: <08c71f7a-4b90-46de-897b-726e53603b64@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Coming back to this old issue...

On 11-11-16 17:04, Vlad Zakharov wrote:
> Hi Thomas, all.
> 
> I strongly believe that something should be done with the issue.
> Of course the approach that I have suggested may not be the best but we can discuss the subject to find better solution.
> It is not a good idea to leave everything as is because failure reason detection totally doesn't work if use up-to-date
> "make" utility. 
> 
> Thank you. 
> 
> On Wed, 2016-10-26 at 12:29 +0000, Vlad Zakharov wrote:
>> Hi Thomas.
>>
>> On Wed, 2016-10-26 at 13:52 +0200, Thomas Petazzoni wrote:
>>>
>>> Hello,
>>>
>>> On Wed, 26 Oct 2016 13:45:17 +0300, Vlad Zakharov wrote:
>>>>
>>>>
>>>> Latest versions of make produce a bit different output than older
>>>> versions do. They also print number of line in Makefile where the
>>>> failure occurred.
>>>>
>>>> E.g. latest make produces the following output:
>>>> ---------------------------------->8------------------------------------  
>>>> GNUmakefile:277: recipe for target 'cgiedit.o' failed
>>>> make[2]: *** [cgiedit.o] Error 1
>>>> package/pkg-generic.mk:201: recipe for target '/home/buildroot/autobuild/run/instance-2/output/build/privoxy-
>>>> 3.0.26/.stamp_built' failed
>>>> make[1]: *** [/home/buildroot/autobuild/run/instance-2/output/build/privoxy-3.0.26/.stamp_built] Error 2
>>>> Makefile:88: recipe for target '_all' failed
>>>> make: *** [_all] Error 2
>>>> make: Leaving directory '/home/buildroot/autobuild/run/instance-2/buildroot'
>>>> ---------------------------------->8------------------------------------  
>>>>
>>>> When with old version we get something like:
>>>> ---------------------------------->8------------------------------------  
>>>> make[2]: *** [cgiedit.o] Error 1
>>>> make[1]: *** [/home/buildroot/autobuild/run/instance-1/output/build/privoxy-3.0.26/.stamp_built] Error 2
>>>> make: *** [_all] Error 2
>>>> make: Leaving directory `/home/buildroot/autobuild/run/instance-1/buildroot'
>>>> ---------------------------------->8------------------------------------  
>>>>
>>>> So latest make produce much more "noise" and we have to analyze
>>>> at least 4 last lines of log to be sure that they contain a line
>>>> with failure reason.

 Instead of relying on make's "noise", why don't we just use the very last line
of build-time.log?


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
