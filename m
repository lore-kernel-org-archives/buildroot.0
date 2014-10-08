From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Wed, 8 Oct 2014 16:02:28 +0100
Subject: [Buildroot] [PATCH 1/2] package/sysvinit: don't start logging
In-Reply-To: <1412779165-13366-1-git-send-email-gustavo@zacarias.com.ar>
References: <1412779165-13366-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <54355204.7040701@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/08/2014 03:39 PM, Gustavo Zacarias wrote:
> Don't try to start logging from /etc/inittab because busybox installs a
> S01logging script that handles that and can lead to duplicate logging
> processes.
> Let's handle the logging in each package that provides it since we can
> get multiple variants in the future like syslog-ng that have different
> initialization routines.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---

Thanks. That has always been bugging me but never got around to fix it
myself

Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>

-- 
markos
