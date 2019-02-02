From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Feb 2019 15:03:20 +0100
Subject: [Buildroot] [PATCH 1/3] aircrack-ng: add optional hwloc
 dependency
In-Reply-To: <20190130172835.4761-1-fontaine.fabrice@gmail.com>
References: <20190130172835.4761-1-fontaine.fabrice@gmail.com>
Message-ID: <20190202150320.3edb8af6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Wed, 30 Jan 2019 18:28:33 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> hwloc dependency has been added in version 1.4 with
> https://github.com/aircrack-ng/aircrack-ng/commit/c31b27449962bc69638b32ec14e0ffdb8997dfcf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/aircrack-ng/aircrack-ng.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Series applied, thanks. I hesitated a bit on PATCH 2/3, because we
typically don't really care about building tests in the context of
Buildroot. However, since unit tests in aircrack-ng are unconditionally
built, and the result depends on whether cmoka is available or not, it
makes sense to have it as an optional dependency.

Also, could you start using the convention of "package/<foo>" prefixes
for your commit titles ? We have finally standardized a bit the format
of commit titles, see:

  http://nightly.buildroot.org/manual.html#submitting-patches

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
