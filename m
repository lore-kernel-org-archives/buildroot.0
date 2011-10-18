From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Oct 2011 16:32:02 +0200
Subject: [Buildroot] [PATCH 1/2] package infra: add mirror support
In-Reply-To: <1318947295-24677-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318947295-24677-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20111018163202.504d5069@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 18 Oct 2011 11:14:54 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> +	if test -n "$(3)" ; then \
> +		case "$($(PKG)_SITE_METHOD)" in \
> +			git) exit ;; \
> +			svn) exit ;; \
> +			bzr) exit ;; \
> +			file) exit ;; \

I don't think you want to exit here, you want to continue to evaluate
the BR2_BACKUP_SITE solution below. For example, sources.buildroot.net
has http://sources.buildroot.net/libsvgtiny-12121.tar.gz, which is the
Subversion tarball of libsvgtiny. Same for
http://sources.buildroot.net/tslib-412d99d8b92c.tar.gz.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
