From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 11 Apr 2014 15:40:55 +0200
Subject: [Buildroot] [Bug 7016] Git issues in resulting buildroot tar
In-Reply-To: <1396897179003-67022.post@n4.nabble.com>
References: <bug-7016-163@https.bugs.busybox.net/>
 <20140402073504.199469BF82@busybox.osuosl.org>
 <1396855570069-66989.post@n4.nabble.com>
 <CAAXf6LX0tqdsLEmk7bGVT-rUWrVdSew++GFDz-Cucw-Ueg0n9w@mail.gmail.com>
 <1396897179003-67022.post@n4.nabble.com>
Message-ID: <CAAXf6LVe44GvKeFNOXqNtvDw5O61-psQaWytmDw61BGBopjzFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Brian,

On Mon, Apr 7, 2014 at 8:59 PM, brianclements <brian@brianclements.net> wrote:
> Hi Thomas,
>
>>It is interesting that you can reproduce without docker.
>>Can you clarify how you started the system in this case? How do you
>>deploy the rootfs.tar file in this case?
>
>>One of the reasons that I asked about this, is that it is not correct
>>to simply start an application built with buildroot on an existing
>>system with other libraries, because they may not be compatible.
>>Therefore, you need to run as a 'full' system, like in qemu, or
>>possibly with chroot if the target and guest systems are of the same
>>architecture. See also
>>http://buildroot.uclibc.org/downloads/manual/manual.html#_chroot
>
>>Depending on how you are running in the non-docker case, you may be
>>experiencing precisely this problem in both cases.
>
> I'm sorry I misunderstood your question before. What I replicated was not
> the running of the git binary with the errors, but the building of the
> rootfs.tar from my host and not from within a docker container. In this case
> the two rootfs.tar images resulted in the same error with git once imported
> into Docker. I will have to look into your suggestions later for actually
> running this image using a different virtualization method then Docker and
> update you on it.
>
[..]
>
>>This even seems to be before the 'execve' call, but maybe this is just
>>a side-effect of the tracing display rather than the actual problem.
>>I'm not entirely sure if this helps you in analyzing the problem, though.
>>Could you check if '/usr/lib/git-core/git' is available and if it can
>>be executed?
>
> I have to admit the strace information and system calls are completely
> foreign to me at the moment. I'll have to dig into them a little bit too to
> see if they can shed some light on the situation.
>
> As for the git binary, it's actually in a different location
> "/usr/libexec/git-core", does that matter? Here is the status of it as it
> resides in the image:
>
> /usr/libexec/git-core # ls -hal git
> -rwxr-xr-x    1 root     root        1.2M Apr  7 06:49 git
> /usr/libexec/git-core # ./git --version
> git version 1.8.5.3
>
> it seems to run OK from that path. Did I do that right? Side note: git-clone
> most everything in that directory have the same permissions and seem
> accessible.
>
> Let me ask you this, can you possibly just compile a version of busybox with
> x86_64, largefile, and git and link me up with the resulting tar? (only
> probably around 10mb). That might be a quicker way to duplicate this error
> then me trying to learn my way through qemu and introduce another set of
> variables for me to mess up. That way I can see if a working version is even
> possible when implemented with Docker and we can possibly get rid of that
> variable as well, especially if your image works for you.

Just to let you know I haven't forgot about this, but I'm a little
short on time at the moment.
I will try to reproduce the issue in qemu as you suggested.
When I have more news I'll let you know.

In the mean time, if there is any progress at your side, let us know.

Best regards,
Thomas
