From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Apr 2020 15:00:57 +0200
Subject: [Buildroot] [PATCH 4/8] package/python3-cheetah: add special
 host variant
In-Reply-To: <20200323104909.16765-4-yegorslists@googlemail.com>
References: <20200323104909.16765-1-yegorslists@googlemail.com>
 <20200323104909.16765-4-yegorslists@googlemail.com>
Message-ID: <20200424150057.3f6981ff@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Mar 2020 11:49:05 +0100
yegorslists at googlemail.com wrote:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Needed to build mongodb.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python3-cheetah/python-cheetah.mk    | 18 ++++++++++++++++++

The name of the .mk file was wrong, it should have been python3-cheetah.mk.

With your version of the patch, check-package was complaining quite
loudly:

package/python3-cheetah/python-cheetah.mk:9: possible typo: PYTHON3_CHEETAH_VERSION -> *PYTHON_CHEETAH*
package/python3-cheetah/python-cheetah.mk:10: possible typo: PYTHON3_CHEETAH_SOURCE -> *PYTHON_CHEETAH*
package/python3-cheetah/python-cheetah.mk:11: possible typo: PYTHON3_CHEETAH_SITE -> *PYTHON_CHEETAH*
package/python3-cheetah/python-cheetah.mk:12: possible typo: PYTHON3_CHEETAH_LICENSE -> *PYTHON_CHEETAH*
package/python3-cheetah/python-cheetah.mk:13: possible typo: PYTHON3_CHEETAH_LICENSE_FILES -> *PYTHON_CHEETAH*
package/python3-cheetah/python-cheetah.mk:14: possible typo: PYTHON3_CHEETAH_SETUP_TYPE -> *PYTHON_CHEETAH*
package/python3-cheetah/python-cheetah.mk:15: possible typo: HOST_PYTHON3_CHEETAH_DL_SUBDIR -> *PYTHON_CHEETAH*
package/python3-cheetah/python-cheetah.mk:16: possible typo: HOST_PYTHON3_CHEETAH_NEEDS_HOST_PYTHON -> *PYTHON_CHEETAH

> +# Please keep in sync with
> +# package/python-cheetah/python-cheetah.mk

This comment fits on one line. And I've added the corresponding comment
in package/python-cheetah/python-cheetah.mk.

Applied with these changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
