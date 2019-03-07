From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Mar 2019 21:43:01 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/efl: Fix build with mesa
In-Reply-To: <20190306231429.22849-1-vadim4j@gmail.com>
References: <20190306231429.22849-1-vadim4j@gmail.com>
Message-ID: <20190307214301.05f8ae74@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  7 Mar 2019 01:14:29 +0200
Vadim Kochan <vadim4j@gmail.com> wrote:

> efl does not compile with mesa without OpenGL ES because it checks for
> GL_ES_VERSION_2_0 and declares own GLintptr and GLsizeiptr types if such
> version is not defined, but mesa declares them too for OpenGL version
> 1.5, so fix it by add check also for OpenGL 1.5 where these types are
> defined.
> 
> Use patch from:
> 	https://git.enlightenment.org/core/efl.git/commit/?id=0d2b624f1e24240a1c4e651aa1cfe9a8dd10a573
> 
> Fixes:
> 	http://autobuild.buildroot.net/results/62ca120f1e54e8c3ae445f98b2624b526569f007
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
