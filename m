From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Apr 2020 22:32:42 +0200
Subject: [Buildroot] [PATCH] package/python-requests: backport from
 upstream
In-Reply-To: <20200407221549.681860-1-romain.naour@gmail.com>
References: <20200407221549.681860-1-romain.naour@gmail.com>
Message-ID: <20200408223242.59bb895e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  8 Apr 2020 00:15:49 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> As reported by the dockerCompose runtime test, there
> is a runtime issue due to python-requests package
> that restrict the dependency to all known version
> at the time of the release:
> 
> The python-requests is limited to python-idna < 2.9 but
> since the version bump [1] the DockerCompose test is broken.
> 
> pkg_resources.ContextualVersionConflict: (idna 2.9 (/usr/lib/python3.8/site-packages), Requirement.parse('idna<2.9,>=2.5'), {'requests'})
> 
> Upstream again the idna maximum version [2], backport
> this patch.
> 
> [1] 237d31bf5289a46583aa4bbc1fb7ed008b798de5
> [2] https://github.com/psf/requests/commit/c46f55bd48dabc02f033d252f8c64e2011f37361
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/498144417
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...ncies-to-major-instead-of-minor-5342.patch | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/python-requests/0001-Limit-dependencies-to-major-instead-of-minor-5342.patch

I've applied, but the commit title was really not great "backport from
upstream" doesn't mean much as a commit title. Also, I found the commit
log quite confusing, so I reworded it quite significantly.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
