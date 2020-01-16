From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Jan 2020 23:59:00 +0100
Subject: [Buildroot] [PATCH 1/4] core/pkg-infra: introduce download
 features concept
In-Reply-To: <674b2ca7-cb45-c89d-a5e5-cfc230200db2@xes-inc.com>
References: <20200116193852.17683-1-vfazio@xes-inc.com>
 <CAMQcK5+-_N_Rwkx6E+w7eid5rKNVNjith7Feg8yYgzQX+dvtQQ@mail.gmail.com>
 <674b2ca7-cb45-c89d-a5e5-cfc230200db2@xes-inc.com>
Message-ID: <b782018a-bec1-07d5-da24-128d4eba2a1b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Vincent,

 Thanks for these patches. Nice idea.


On 16/01/2020 20:53, Vincent Fazio wrote:
> Ryan,
> 
> On 1/16/20 1:49 PM, Ryan Barnett wrote:
>> Vincent,
>>
>> Please see my few comments while just quickly looking over this patchset.
>>
>> On Thu, Jan 16, 2020 at 1:39 PM Vincent Fazio <vfazio@xes-inc.com> wrote:
>> There should be more of a commit message which describe the feature
>> being added here. Initially I was unsure what was being proposed here
>> without looking at the changes.
> Yea, sorry about that. kinda fired it off a bit sooner than I expected. I'll
> expand the commit messages

 It's good to fire it off early (as an RFC) to avoid wasting work if it's going
in the wrong direction.

 ... which I think this is.

 I guess the idea is to generalize the submodules feature so it can be used by
several VCS systems, and to combine it with the transient option.

 However, I don't think the additional complexity is worth it.

 Separate _GIT_SUBMODULES = YES and _DOWNLOAD_TRANSIENT = YES are IMO easier to
understand than _DL_FEATURES = submodules transient, because we don't really
have the latter pattern anywhere else in Buildroot. In addition, it's hard to
remember if it's comma-separated or space-separated.

 I also think the infrastructural code becomes a bit harder to understand
(particularly how the features are parsed out in the git helper script).

 Bottom line: I think this is only worth it if we have at least four or so of
these features.

 Regards,
 Arnout
