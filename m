From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 May 2013 23:34:48 +0200
Subject: [Buildroot] [PATCH] acpid: fix obvious syntax error in
	addprefix call
In-Reply-To: <1369775868-3461-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 28 May 2013 23:17:48 +0200")
References: <1369775868-3461-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k3mi94av.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/acpid/acpid.mk |    2 +-
 Thomas>  1 file changed, 1 insertion(+), 1 deletion(-)

 Thomas> diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
 Thomas> index 4ad9f66..b557617 100644
 Thomas> --- a/package/acpid/acpid.mk
 Thomas> +++ b/package/acpid/acpid.mk
 Thomas> @@ -26,7 +26,7 @@ endef
 Thomas>  define ACPID_UNINSTALL_TARGET_CMDS
 Thomas>  	rm -f $(TARGET_DIR)/usr/sbin/acpid
 Thomas>  	rm -f $(TARGET_DIR)/usr/bin/acpi_listen
 Thomas> -	rm -f $(addprefix )$(TARGET_DIR)/usr/share/man/man8/,acpid.8 acpi_listen.8)
 Thomas> +	rm -f $(addprefix $(TARGET_DIR)/usr/share/man/man8/,acpid.8 acpi_listen.8)

And apparently since 2010. Committed, thanks.

-- 
Bye, Peter Korsgaard
