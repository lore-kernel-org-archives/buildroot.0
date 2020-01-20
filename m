From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 20 Jan 2020 22:07:40 +0100
Subject: [Buildroot] [PATCH 1/4] core/pkg-infra: introduce download
 features concept
In-Reply-To: <55a401b6-2453-7d0f-1e19-fa0f306bc0aa@xes-inc.com>
References: <20200116193852.17683-1-vfazio@xes-inc.com>
 <CAMQcK5+-_N_Rwkx6E+w7eid5rKNVNjith7Feg8yYgzQX+dvtQQ@mail.gmail.com>
 <674b2ca7-cb45-c89d-a5e5-cfc230200db2@xes-inc.com>
 <b782018a-bec1-07d5-da24-128d4eba2a1b@mind.be>
 <20200117091755.69711c60@windsurf> <20200117164432.GK22540@scaer>
 <36d96c34-c5d2-26a3-6284-6e5035cc1ab9@mind.be>
 <55a401b6-2453-7d0f-1e19-fa0f306bc0aa@xes-inc.com>
Message-ID: <30e3a759-8dda-0aef-14b7-50f4403a2e27@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/01/2020 21:38, Vincent Fazio wrote:
> Arnout, Yann, et al
> 
> On 1/20/20 2:56 AM, Arnout Vandecappelle wrote:
>>
>> On 17/01/2020 17:44, Yann E. MORIN wrote:
>>
>> [snip]
>>> At some point in the past, Arnout expressed some concern about adding yet
>>> more variables,
>> ? That was more about internal variables, not user-facing variables. And also
>> about variables that are actually assigned to. Each variable that is set in
>> inner-generic-package gets multiplied a thousandfold and this puts pressure on
>> the internal tables in make.
>>
>>> and this feature thingy would be the opportunity to
>>> coalesce many variables into a single one (or rather, avoiud adding new
>>> variables).
>> ? Iff there are several users of it. So, as I said, it's a good idea if we get 4
>> features.
> 
> So it sounds like this is too much infrastructure change until we have 4
> definitive use-cases.
> 
> At this time, we only have one (git submodules). My intent with this series was
> to add the foundation for supporting git-lfs (which would be the second
> use-case) and others.
> 
> Based on the conversation, it seems like until we have a hard requirement from
> other backends (hg and svn as previously mentioned), this series is DOA and that
> git-lfs support should be added via some <pkg>_GIT_LFS define as was originally
> submitted here: http://lists.busybox.net/pipermail/buildroot/2018-April/219716.html
> 
> My main goal here is to add git-lfs support, regardless of how that needs to
> happen. If resubmitting the original patch gets that done, that's what I'll do.

 Yes, I think the original patch should be fine. Just also add git-lfs to
DL_TOOLS_DEPENDENCIES, and test if it still works correctly if you don't have
git-lfs installed on your host.

 Ideally there should also be a package in-tree that uses it, but I can imagine
that it will be hard to find one... Failing that, a test case would be nice -
but again, that may be difficult to implement without relying on some
server-side support for it.

 Regards,
 Arnout


> 
> Please let me know your thoughts.
> 
>>
>> ? Regards,
>> ? Arnout
> 
