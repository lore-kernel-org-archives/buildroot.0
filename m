From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 16:14:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/rsyslog: fix wrong symlink for
 systemd service
In-Reply-To: <1505902234-4876-1-git-send-email-brain@jikos.cz>
References: <1505902234-4876-1-git-send-email-brain@jikos.cz>
Message-ID: <ee432188-a035-f7c2-91f6-e195dae13098@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-09-17 12:10, Petr Kulhavy wrote:
> The symlink to /etc/systemd/system/syslog.service was pointing 4 levels up
> to /usr/lib instead of 3 levels up.
> 
> This wasn't an issue on the actual system (/../ equals to / ) but was causing a
> deadlink in the TARGET directory.
> 
> Signed-off-by: Petr Kulhavy <brain@jikos.cz>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/rsyslog/rsyslog.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
> index bbf7d95..e32505b 100644
> --- a/package/rsyslog/rsyslog.mk
> +++ b/package/rsyslog/rsyslog.mk
> @@ -91,7 +91,7 @@ define RSYSLOG_INSTALL_INIT_SYSTEMD
>  	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>  	ln -sf ../../../../usr/lib/systemd/system/rsyslog.service \
>  		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/rsyslog.service
> -	ln -sf ../../../../usr/lib/systemd/system/rsyslog.service \
> +	ln -sf ../../../usr/lib/systemd/system/rsyslog.service \
>  		$(TARGET_DIR)/etc/systemd/system/syslog.service
>  endef
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
