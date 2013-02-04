From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Feb 2013 23:51:50 +0100
Subject: [Buildroot] [PATCH v4] pkg-infra: add <pkg>_CONFIG_FIXUP to fix
	*-config files
In-Reply-To: <1359550000-10585-1-git-send-email-stefan.froberg@petroprogram.com>
 ("Stefan =?utf-8?Q?Fr=C3=B6berg=22's?= message of "Wed, 30 Jan 2013
 14:46:40 +0200")
References: <1359550000-10585-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <87sj5b1ym1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stefan" == Stefan Fr?berg <stefan.froberg@petroprogram.com> writes:

 Stefan> This patch will add <pkg>_CONFIG_FIXUP variable to buildroot infra.
 Stefan> It's purpose is to inform buildroot that the package in question
 Stefan> contains some $(STAGING_DIR)/usr/bin/*-config files and that we
 Stefan> want to automatically fix prefixes of such files.

 Stefan> It is often the case that many packages call these
 Stefan> files during their configuration step to determine 3rd party
 Stefan> library package locations and any flags needed to link against them.

 Stefan> For example:
 Stefan> Some package might try to check the existense and linking flags
 Stefan> of NSPR package by calling $(STAGING_DIR)/usr/bin/nspr-config --prefix.
 Stefan> Without this fix. NSPR would return /usr/ as it's prefix which is
 Stefan> wrong when cross-compiling.
 Stefan> Correct would be $(STAGING_DIR)/usr.

 Stefan> All packages that have <pkg>_INSTALL_STAGING = YES defined and
 Stefan> also install some config file(s) into $(STAGING_DIR)/usr/bin must
 Stefan> hereafter also define <pkg>_CONFIG_FIXUP with the correspondig
 Stefan> filename(s).

Committed, thanks.

-- 
Bye, Peter Korsgaard
