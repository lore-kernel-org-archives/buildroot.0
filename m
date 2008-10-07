From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 7 Oct 2008 16:48:30 +1100
Subject: [Buildroot] svn commit: trunk/buildroot/package:  logrotate
In-Reply-To: <20081006204112.DFD173C807@busybox.net>
References: <20081006204112.DFD173C807@busybox.net>
Message-ID: <20081007054830.GE5127@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 06, 2008 at 01:41:12PM -0700, wberrier at uclibc.org wrote:
> Added: trunk/buildroot/package/logrotate/logrotate.conf
> ===================================================================
> --- trunk/buildroot/package/logrotate/logrotate.conf	                        (rev 0)
> +++ trunk/buildroot/package/logrotate/logrotate.conf	2008-10-06 20:41:12 UTC (rev 23610)
> @@ -0,0 +1,14 @@
> +compress
> +
> +include /etc/logrotate.d
> +
> +/var/log/messages /var/log/auth.log /var/log/user.log {
> +	rotate 7
> +	daily
> +	delaycompress
> +	missingok
> +	sharedscripts
> +	postrotate
> +		/usr/bin/killall -HUP syslogd
> +	endscript
> +}

I don't like including this configuration by default. I don't think it
can easily be overridden (it's copied in after the target_skeleton), and
most systems don't have /var/log/auth.log etc by default.

Same for packages that include init scripts by default :(

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
