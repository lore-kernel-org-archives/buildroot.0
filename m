From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Mar 2014 07:42:04 +0100
Subject: [Buildroot] Segmentation fault while trying to remote debug
 with GDB and GDBServer
In-Reply-To: <20140302172058.5d9a49e1@skate>
References: <51ef4c3ec6f84eab802c23a14ecb48ae@DBXPR07MB142.eurprd07.prod.outlook.com>
 <20140302070650.GE3874@tarshish>
 <24eee2c96f804b55ae7767734d5a4f6e@DBXPR07MB142.eurprd07.prod.outlook.com>
 <20140302091205.GF3874@tarshish>
 <29f88dd2071c483bb7102687088ac6b3@DBXPR07MB142.eurprd07.prod.outlook.com>
 <20140302122406.GJ3874@tarshish>
 <99f27349e290444ba06497af087cb0d8@DBXPR07MB142.eurprd07.prod.outlook.com>
 <20140302171008.2014a1e0@skate> <20140302172058.5d9a49e1@skate>
Message-ID: <5316C73C.3090804@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/03/14 17:20, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 2 Mar 2014 17:10:08 +0100, Thomas Petazzoni wrote:
> 
>> The Eclipse plugin does set the solib-path (see
>> https://github.com/mbats/eclipse-buildroot-toolchain-plugin/blob/master/org.buildroot.cdt.toolchain/src/org/buildroot/cdt/toolchain/BuildrootLaunchConfigurationTabGroup.java#L70),
>> but that is apparently insufficient for gdb to find the correct dynamic
>> linker, especially when the host and target architectures are identical.
>>
>> Since there is apparently no way in Eclipse to set a gdb sysroot, I
>> believe the only solution is for the Eclipse plugin to generate a
>> simple gdbinit file:
>>
>> set sysroot /path/to/staging/directory
>>
>> and then instruct Eclipse to use it.
> 
> Or now that I think of it, maybe Buildroot should itself generate this
> gdbinit file. It may be useful even for users not using Eclipse.

 Even better: buildroot should generate a wrapper (yet another one!) that
passes -ex 'set sysroot ...' when calling cross-gdb.

 Can someone add that to the todo list on the wiki? (I'm currently offline.)

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
