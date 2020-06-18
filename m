From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 23:36:09 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-web2py: needs python-yatl
In-Reply-To: <20200611205607.1869425-2-fontaine.fabrice@gmail.com>
References: <20200611205607.1869425-1-fontaine.fabrice@gmail.com>
 <20200611205607.1869425-2-fontaine.fabrice@gmail.com>
Message-ID: <20200618233609.47c3bb58@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 11 Jun 2020 22:56:07 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> python-yatl is a mandatory dependency of python-web2py since version
> 2.18.4 and
> https://github.com/web2py/web2py/commit/0663088d7f7c3257eaa9cdd8415483372d3c80b7
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9d627152920973effeb48ad03c27a1c69fa83931
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-web2py/Config.in        | 1 +
>  package/python-web2py/python-web2py.mk | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

I agree with Asaf: python-yatl is not needed at build time, only the
host variant is. And in fact, it was the same with python-pydal. So I
did a preparation patch that dropped python-pydal as a build-time
dependency. Then I applied your patch on top of that, and changed it to
also treat python-yatl as a runtime dependency. host-python-pydal and
host-python-yatl remain build time dependencies of course.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
