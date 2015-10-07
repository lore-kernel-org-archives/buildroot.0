From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Oct 2015 23:09:55 +0100
Subject: [Buildroot] [PATCH v5 2/2] Patch to assembler to strip LOCK
 prefix.
In-Reply-To: <1444211584.2759.10.camel@intel.com>
References: <1443786554.3328.21.camel@intel.com> <56116CAE.3070100@mind.be>
 <1444211584.2759.10.camel@intel.com>
Message-ID: <56159833.6080005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07-10-15 10:53, Kinsella, Ray wrote:
> Hi Arnout,
> 
> On Sun, 2015-10-04 at 19:15 +0100, Arnout Vandecappelle wrote:
>>  We now have a toolchain wrapper both for internal and external toolchains. This
>> will allow you to reliably pass options to the compiler. So we'd preferably use
>> that approach.
> 
> Ok - I will investigate - any examples I can look at?
> 
>>  Also, we think it's worthwhile to add a new subarchitecture for the Quark in
>> arch/Config.in.x86. This should set the arch and tune options to i586, but the
>> toolchain wrapper can then carry an option that adds -Wa,-momit-lock-prefix=yes.
>> This also fixes the problem for external toolchains.
> 
> Ok - I actually proto-typed this and I couldn't get it to work reliably,
> hence the nasty patch.

 Should be fairly simple with the toolchain wrapper. I think it it best to
refactor toolchain/toolchain-wrapper.mk a little to create a new variable to
contain the BR_ADDITIONAL_CFLAGS, and then conditionally add the -Wa,-momit-...
option to it.

> I should have it on a branch (I hope), I can dust it off. 
> 
>>  So the proposal is that you create a first patch that adds BR2_x86_quark and
>> adds -Wa,-momit-lock-prefix=yes, and then a second patch that adds the Galileo2
>> defconfig.
> 
> ok 
> 
>>  I have now marked both patches as Changes Requested in out patch tracking
>> system, so please resubmit a new version that fixes the above comments,
>> otherwise we'll forget about your contribution.
> 
> ok - will followup.
> (is the patch tracking system public?)

http://patchwork.ozlabs.org/project/buildroot/list/

 If you create a login with the same email address as the one you send patches
from, then you can update the state of your own patches (e.g. mark them as
Superseded when you send a new version).

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
