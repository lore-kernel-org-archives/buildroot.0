From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 25 Oct 2017 01:16:37 -0700
Subject: [Buildroot] [PATCH] support/dependencies: always run
 check-host-tar.mk first
In-Reply-To: <e8fd5b1a-3576-773a-35a4-562679eaa31f@mind.be>
References: <1508878293-15873-1-git-send-email-jcmvbkbc@gmail.com>
 <e8fd5b1a-3576-773a-35a4-562679eaa31f@mind.be>
Message-ID: <CAMo8BfJ=_teK3Qzm9zOmxWR7wH+t+b0MQurtuJ6rcDy5BzoK3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Wed, Oct 25, 2017 at 1:09 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 24-10-17 22:51, Max Filippov wrote:
>> Make sure that if the tar dependency is present it is always the first
>> one in the DEPENDENCIES_HOST_PREREQ.
>
>  However, this is not a proper solution. It will break with top-level parallel
> build and it just looks hackish.

Oh, you're right.

>  The proper way to do it is to add a dependency on host-tar to all the other
> host-prereq packages. But that also doesn't scale well... I have to think a bit
> more about a good solution, but I wanted to flag the issue already.
>
>  One thing I though about is to put something like
>
> $(filter-out host-tar,$(DEPENDENCIES_HOST_PREREQ)): host-tar
>
> in check-host-tar.mk, but that only works if check-host-tar.mk is the *last* one
> to add anything to DEPENDENCIES_HOST_PREREQ...

Maybe we should treat check-host-tar.mk differently, rename it, make sure it's
included last and adds that dependency correctly?

-- 
Thanks.
-- Max
