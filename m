From: Christian Stewart <christian@paral.in>
Date: Thu, 11 Feb 2021 13:11:06 -0800
Subject: [Buildroot] [PATCH v1 1/3] package/runc: bump to version
 1.0.0-rc93
In-Reply-To: <87y2fuioz5.fsf@dell.be.48ers.dk>
References: <20210210235203.2819535-1-christian@paral.in>
 <87y2fuioz5.fsf@dell.be.48ers.dk>
Message-ID: <CA+h8R2pVwUCSAZKmfZdZdoTRQnXxdP-SkBb=PxjhcbhpMEEc_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Thu, Feb 11, 2021 at 7:49 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Christian" == Christian Stewart <christian@paral.in> writes:
>
>  > https://github.com/opencontainers/runc/releases/tag/v1.0.0-rc93
>
> Is this meant for master or next?

Master.

> It is in the same series as security bumps, but I see the release notes
> talks about a feature-rich release?

Runc is now on their 93rd release candidate. Now is not the time to
decide to stop at #92.

> It also mentions the following:
>
> For packagers the following changes have been made which will have impact on
> your packaging of runc:
>
>     The "selinux" and "apparmor" buildtags have been removed, and now all runc
>     builds will have SELinux and AppArmor support enabled. Note that "seccomp"
>     is still optional (though we very highly recommend you enable it).
>
> But I see no changes related to this?

I don't have seccomp enabled on my systems, and docker + runc is still
working as per this series.

Additionally, I see that there are still conditional build tags
"linux,cgo,seccomp" in the code, which exclude seccomp unless the
seccomp build tag is set. So I don't think that the note in the
release notes is accurate - you still need the "seccomp" build tag for
runc to have seccomp support.

So everything is fine to merge this to master as-is. (Tested as well).

Best regards,
Christian Stewart
