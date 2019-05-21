From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 May 2019 09:55:16 +0200
Subject: [Buildroot] [PATCH] package/atop: fix BUG_85180 build timeout
In-Reply-To: <20190521091551.384da8a1@windsurf.home>
References: <20190520212723.63754-1-giulio.benetti@micronovasrl.com>
 <20190521091551.384da8a1@windsurf.home>
Message-ID: <757973bf-7d43-f3d6-8364-b4353d42b317@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/05/2019 09:15, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 20 May 2019 23:27:23 +0200
> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
> 
>> With Microblaze Gcc version < 8.x build hangs on compiling last files
>> before linking. This is due to bug 85180:
>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
>> Bug shows up building atop with -g2 and -g3.
>>
>> If BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y and BR2_ENABLE_DEBUG=y force using
>> -g1 passing it to CFLAGS.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/94a/94aa00f776b8a3491ac0b3212c95f5e666c5a29a/
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> 
> I am a bit confused: the other instances of bug 85180 are worked around
> by passing -O0 (in glibmm, opus, chocolate-doom, jasper), but here you
> do the work around using -g1.
> 
> Is it expected ? Can't we have the same work around in all situations ?

 I think it's just that in *this* case, it is also solved by using -g1 instead
of -g2, which is less "aggressive" than passing -O0. However, I agree with
Thomas that it's better to use the same solution everywhere, even if it is
suboptimal.

 Just to be sure: in some cases, -Os also works, but not in all cases, right?
Otherwise I'd actually prefer -Os instead of -O0.

 Regards,
 Arnout
