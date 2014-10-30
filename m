From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2014 22:22:16 +0100
Subject: [Buildroot] [PATCH v6 1/3] package/dovecot: New package
In-Reply-To: <1414613646-24490-1-git-send-email-bernd.kuhls@t-online.de>
References: <1414613646-24490-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141030222216.128e1cb1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 29 Oct 2014 21:14:04 +0100, Bernd Kuhls wrote:
> ---
> v6: no changes
> v5: bumped to 2.2.15
> v4: bumped to 2.2.14
> v3: DOVECOT_CONF_OPT -> DOVECOT_CONF_OPTS
> v2: - Reworked dependencies (Thomas)
>     - added MySQL/SQLite support
>     - removed cruft from CONV_OPT not needed for buildroot (Thomas)
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/Config.in          |    1 +
>  package/dovecot/Config.in  |   56 +++++++++++++++++++++++++
>  package/dovecot/dovecot.mk |   97 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 154 insertions(+)
>  create mode 100644 package/dovecot/Config.in
>  create mode 100644 package/dovecot/dovecot.mk

Applied, thanks. I've done a few changes though:

    [Thomas:
     - slightly adjust the prompt of options in the Config.in file
     - fix license: it's just LGPLv2.1, no exceptions. Parts of the code
       are under public domain, or under the MIT license, but the
       combination is under LGPLv2.1.
     - rewrap one comment in the .mk file.]

Also, could you:

 * Send a patch to add an init script, if applicable? Since dovecot is
   a POP3/IMAP server, it would make sense to have an init script
   available for it, so that it works "out of the box" in at least a
   default way for users.

 * Check if iconv is needed or not when the toolchain doesn't have
   locale support? You have $(if $(BR2_PACKAGE_LIBICONV),iconv) in
   DEPENDENCIES. But the iconv package is not selected.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
