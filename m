From: Floris Bos <bos@je-eigen-domein.nl>
Date: Sun, 10 Aug 2014 12:55:43 +0200
Subject: [Buildroot] [PATCH 1/1] postgresql: remove devfiles from target
In-Reply-To: <b8f2dfad-6831-48d9-a7fa-c4775bbcf0a6@email.android.com>
References: <1407605679-15342-1-git-send-email-bos@je-eigen-domein.nl>
 <b8f2dfad-6831-48d9-a7fa-c4775bbcf0a6@email.android.com>
Message-ID: <53E74FAF.6000306@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/10/2014 09:01 AM, Thomas De Schampheleire wrote:
> define POSTGRESQL_INSTALL_TARGET_FIXUP
> 	$(INSTALL) -dm 0700 $(TARGET_DIR)/var/lib/pgsql
> +	rm -f $(TARGET_DIR)/usr/bin/pg_config
> +	rm -rf $(TARGET_DIR)/usr/lib/postgresql/pgxs
> endef
> Not entirely sure here, but isn't the better approach for pg_config to add it to POSTGRESQL_CONFIG_SCRIPTS? This will ensure the file is fixed up for staging usr, and removed from target automatically.
>

Note that pg_config is an ELF executable compiled for the target 
architecture, and not a text script that can be easily fixed up.


Yours sincerely,

Floris Bos
