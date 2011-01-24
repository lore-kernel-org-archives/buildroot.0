From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Jan 2011 22:20:45 +0100
Subject: [Buildroot] [PATCH 08/10] Remove .py or .pyc depending on
	Python configuration
In-Reply-To: <ae3e42bc699cefc69cc523fb3969c94c32ca3a9d.1295866866.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Mon, 24 Jan 2011 12:01:36 +0100")
References: <cover.1295866866.git.thomas.petazzoni@free-electrons.com>
	<cover.1295866866.git.thomas.petazzoni@free-electrons.com>
	<ae3e42bc699cefc69cc523fb3969c94c32ca3a9d.1295866866.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87aaiqq9qq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> We do this at a global level since several packages can install
 Thomas> Python modules.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  Makefile |    8 ++++++++
 Thomas>  1 files changed, 8 insertions(+), 0 deletions(-)

 Thomas> diff --git a/Makefile b/Makefile
 Thomas> index 7e08cf3..1f37a1f 100644
 Thomas> --- a/Makefile
 Thomas> +++ b/Makefile
 Thomas> @@ -438,6 +438,14 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 Thomas>  	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
 Thomas>  	-rmdir $(TARGET_DIR)/usr/share 2>/dev/null
 Thomas>  endif
 Thomas> +ifeq ($(BR2_PACKAGE_PYTHON),y)
 Thomas> +ifeq ($(BR2_PACKAGE_PYTHON_PY_ONLY),y)
 Thomas> +	find $(TARGET_DIR)/usr/lib/ -name '*.pyc' -print0 | xargs -0 rm -f
 Thomas> +endif
 Thomas> +ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
 Thomas> +	find $(TARGET_DIR)/usr/lib/ -name '*.py' -print0 | xargs -0 rm -f
 Thomas> +endif
 Thomas> +endif

The outermost conditional is not really needed.

-- 
Bye, Peter Korsgaard
