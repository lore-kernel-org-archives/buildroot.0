From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Mar 2014 08:54:56 +0100
Subject: [Buildroot] [PATCH] libtool: revert a commit which
 re-introduced an already fixed problem
In-Reply-To: <532823A9.9010603@imgtec.com>
References: <1395078022-37381-1-git-send-email-Vincent.Riera@imgtec.com>
 <87txaw4gwt.fsf@dell.be.48ers.dk> <5327F9E1.1020301@mind.be>
 <532823A9.9010603@imgtec.com>
Message-ID: <53294D50.3040800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/18/14 11:44, Vicente Olivert Riera wrote:
> On 03/18/2014 07:46 AM, Arnout Vandecappelle wrote:
>> On 03/17/14 23:08, Peter Korsgaard wrote:
>>>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>>>>>>>> writes:
>>>
>>>   > The commit ed73d1d2e3703290e74bb076bc6dd0417aa3ba21 modified the
>>> changes
>>>   > made by the commit 4268d3967e2d691c151d6b5629e4051deb077b9a. The
>>> problem
>>>   > that was fixed by the former commit is present again due to those
>>>   > modifications. This patch reverts those modifications to have that
>>>   > problem fixed again.
>>>
>>>   > Fixes:
>>>   >   
>>> http://autobuild.buildroot.net/results/b86/b86a83c6549004f226e7255242e54ef4e50c5ec3/
>>>
>>>
>>> So this basically just reverts Arnouts fix for old automake versions? Do
>>> we understand why it doesn't work? Can we come up with a solution that
>>> both fixes the n64 issue and old automake?
>>
>>   I indeed never tested if the issue of 4268d39 was still fixed. I just
>> understood from the commit message that it is only relevant for the
>> libtool.m4 that is installed in the host dir, so I made use of that.
>>
>>   It should be rather easy to get this right then: a patch that fixes up
>> configure directly, rather than libtool.m4.
> 
> Hello Arnout,
> 
> how do you suggest to do it? Requiring an older automake would not be
> possible because of this:
> 
> dnl These are bootstrap requirements! Once built, libtool may work with
> dnl much older releases of autoconf and automake.  See release notes.
> dnl 1.11 is needed for color-tests, 1.11.1 fixes a security issue.
> AM_INIT_AUTOMAKE([1.11.1 gnu subdir-objects dist-xz color-tests
> parallel-tests])

 I meant: create a patch that fixes up the configure script directly.

 Can you give me a minimal defconfig that shows the problem (preferably
using an external toolchain, e.g. from the autobuilders)? Then I can try
to create that patch.


 Regards,
 Arnout


[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
