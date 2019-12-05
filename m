From: Christian Stewart <christian@paral.in>
Date: Wed, 04 Dec 2019 16:28:46 -0800
Subject: [Buildroot] [PATCH v1 3/4] package/docker-engine: bump to
 19.03.5
In-Reply-To: <871rtkl8xn.fsf@dell.be.48ers.dk>
References: <20191203045003.145746-1-christian@paral.in>
 <20191203045003.145746-3-christian@paral.in>
 <871rtkl8xn.fsf@dell.be.48ers.dk>
Message-ID: <87immv8vk1.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Peter Korsgaard <peter@korsgaard.com> writes:

>>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:
>  >  delete mode 100644 package/docker-engine/0001-Fix-faulty-runc-version-commit-scrape.patch
>
> Next to the text cases pointed out by Thomas, a more detailed commit
> message would be great - E.G. what happened to your patch that you are
> now dropping? Did it get applied upstream? Is it no longer needed? If
> so, why?

It's a really minor patch, I don't think anyone would care really that
it was dropped. I will be sure to mention it in future commit messages
(or if I need to submit a revision for this).

> I don't really understand the relation between containerd and runc, but
> containerd seems to bundle runc? If we backport runc to 2019.02.x do we
> then also need to backport containerd?

The "runc" package in Buildroot compiles the userspace binary "runc"
which is called by "containerd" at runtime to start namespaced processes
(aka containers). "runc" means "run container."

The "runc" version referenced in containerd is the client for the runc
binary and the interfaces between. Matching the expected versions to
each other is necessary but security releases should be compatible.

> According to https://github.com/opencontainers/runc/releases, this is a
> security bump so it should be marked as such and we presumably want to
> backport it to 2019.02.x even though that uses docker 18.09?

Not sure on this one.

Best regards,
Christian
