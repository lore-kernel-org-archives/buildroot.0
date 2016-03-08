From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 21:00:48 +0100
Subject: [Buildroot] [PATCH] lttng-tools: fix musl build
In-Reply-To: <2690f7fc227aeaf837f2cd0e3f26e24209323446.1457461691.git.baruch@tkos.co.il>
References: <2690f7fc227aeaf837f2cd0e3f26e24209323446.1457461691.git.baruch@tkos.co.il>
Message-ID: <20160308210048.7b5c3b91@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue,  8 Mar 2016 20:28:11 +0200, Baruch Siach wrote:
> Add two patches fixing musl build issues:
> 
>   * musl doesn't provide the __GLIBC_PREREQ macro
> 
>   * musl requires sys/types.h for mode_t
> 
> Fixes:
> http://autobuild.buildroot.net/results/ac9/ac9aa3b6c468a0a6ba84758d3c9c8acc20d7fa00/
> http://autobuild.buildroot.net/results/40f/40f11afb0512a89dcdad332d28ff1c5fcc435e7f/
> http://autobuild.buildroot.net/results/3c6/3c66b5f05b482f33d1bc6eabe817f6d7aa21086d/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...ld-failure-when-__GLIBC_PREREQ-is-missing.patch | 55 ++++++++++++++++++++++
>  .../0002-Fix-add-missing-sys-types.h-header.patch  | 29 ++++++++++++
>  package/lttng-tools/lttng-tools.mk                 |  2 +
>  3 files changed, 86 insertions(+)
>  create mode 100644 package/lttng-tools/0001-Fix-build-failure-when-__GLIBC_PREREQ-is-missing.patch
>  create mode 100644 package/lttng-tools/0002-Fix-add-missing-sys-types.h-header.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
