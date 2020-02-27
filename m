From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Feb 2020 08:58:00 +0100
Subject: [Buildroot] [PATCH] package/docker-compose: update patch to
 allow all pyyaml 5.x versions
In-Reply-To: <20200226221911.9177-1-peter@korsgaard.com>
References: <20200226221911.9177-1-peter@korsgaard.com>
Message-ID: <20200227085800.15ee6358@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 26 Feb 2020 23:19:11 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> The recent bump of python-pyyaml to version 5.3 causes a runtime failure in docker-compose:
> 
> pkg_resources.ContextualVersionConflict: (PyYAML 5.3 (/usr/lib/python3.8/site-packages), Requirement.parse('PyYAML<5.2,>=3.10'), {'docker-compose'})
> 
> https://gitlab.com/buildroot.org/buildroot/-/jobs/442151461
> 
> Fix it by adjusting 0003-support-PyYAML-up-to-5.1-version.patch to allow all
> pyyaml 5.x versions, similar to what upstream has done post-1.24.1:
> 
> https://github.com/docker/compose/commit/c818bfc62c0574009175d832c1a8a2857bf1b1bf
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .../docker-compose/0003-support-PyYAML-up-to-5.1-version.patch | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
