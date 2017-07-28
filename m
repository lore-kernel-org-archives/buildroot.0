From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Jul 2017 08:18:34 +0200
Subject: [Buildroot] [PATCH 04/14 v4] package/skeleton: split out into
 skeleton-custom
In-Reply-To: <597aa94a233d0_33a1157f84015740@ultri3.mail>
References: <e095a88e-5e31-29d3-54de-4102990304e7@mind.be>
 <597aa94a233d0_33a1157f84015740@ultri3.mail>
Message-ID: <20170728081834.5f4d349b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Jul 2017 00:02:34 -0300, Ricardo Martincoski wrote:

> This test you triggered ran on the runner e11ae361.
> 
> I borrowed your commit (e8e38e9e) and did some tests.
> 
> I got lucky and the test I triggered ran on the shared runner 4e4528ca and
> passed [2].
> Then I retriggered it to run on my private runner, while I was also running
> a resource intensive task (actually I was running the same test in the same
> commit locally with the default -j 0) and the test in the runner failed [3]
> (while the local test passed).
> 
> [2] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/25090126
> [3] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/25101360
> 
> 
> TestIPythonPy3 for instance seems to be have tidy timeout for math_floor_test.
> Its first execution [4] ran in the (free, as in free beer!) elastic runner from
> gitlab and failed. The second execution [5] ran in my private runner (a docker
> in my personal computer) and passed.
> 
> [4] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/25090131
> [5] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/25099593
> 
> Concerning the test infra (I say that including gitlab) we should choose a path
> to follow:
> 1) Use private runners

So it is possible to "contribute" as a private runner for your own CI
projects hosted on the public Gitlab ?

> 2) Adapt timeouts when a test sporadically fails and keep using the gitlab
> runners ([6] shows that we already use them)
> 
> [6] https://gitlab.com/buildroot.org/buildroot/-/jobs/24184768
> 
> I would go with option 2. We are not doing CI for now, so sporadic failures are
> not a big concern IMO.

The idea of using Gitlab is (amongst other things) to leverage the
public runners. That being said, sporadic failures are really not nice,
because they always cause confusion.

Why don't we significantly increase the timeout, like to several
minutes? In most cases, the test will be successful, and the expected
output will arrive in a few seconds. It's only when there is a real
problem in the test that we will hit the timeout, but in this case,
having the test take a few more minutes is not a big deal.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
