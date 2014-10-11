From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Oct 2014 16:28:05 +0200
Subject: [Buildroot] [PATCH 1/5] dash: bump to version 0.5.8-1
In-Reply-To: <54358DA3.1030103@zacarias.com.ar>
References: <1412774389-11297-1-git-send-email-gustavo@zacarias.com.ar>	<87eguieaky.fsf@dell.be.48ers.dk>
 <5435748A.3090106@zacarias.com.ar>	<87k34acu9a.fsf@dell.be.48ers.dk>
 <543580C6.1090600@zacarias.com.ar> <87y4sqbds4.fsf@dell.be.48ers.dk>
 <54358DA3.1030103@zacarias.com.ar>
Message-ID: <54393E75.2090206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/10/14 21:16, Gustavo Zacarias wrote:
> On 10/08/2014 03:46 PM, Peter Korsgaard wrote:
> 
[snip]
>>  > It's possible, probably best in System Configuration an option that
>>  > selects the appropiate package.
>>  > I wouldn't pull in busybox though, only make the option available if
>>  > BR2_PACKAGE_BUSYBOX.
>>  > And make the symlink in target-finalize to avoid touching the packages
>>  > much (actually making them simpler).
>>
>> Yes, we can do something like that if there's interest / need. I
>> personally don't care enough about it do it myself, but I do want
>> reproducible builds.
>>
>> A real config with multiple (non busybox) shells is imho quite unlikely
>> though.
> 
> I'll give it a shot, it shouldn't be hard.
> Yes it would be odd for multiple non-busybox shells to exist, that was
> my reasoning that any full shell would step on /bin/sh, see? ;)

 Hi Gustavo,

 We discussed the sh stuff at the BR developer meeting and it would be nice if
we had:

- a config option in the system menu that lets the user select the shell: none,
busybox, dash, bash, zsh (default busybox);

- the config option selects the appropriate package;

- target-finalize creates the symlink;

- if sh is busybox, then it's up to the user to choose the appropriate
FEATURE_SH_IS_* option in busybox; we will still create the symlink to busybox
from buildroot.


 Will you take this up? Thanks!


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
