From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 15:47:13 +0200
Subject: [Buildroot] [PATCHv2] inadyn: fix init script and default
 config file
In-Reply-To: <1445090722-4297-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1445090722-4297-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20151018154713.70960ed5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Oct 2015 16:05:22 +0200, Thomas Petazzoni wrote:
> This commit does a number of fixes to the inadyn package to make it
> work properly "out of the box":
> 
>  * inadyn is installed in /usr/sbin, not /usr/bin, so we fix the path
>    in the init script
> 
>  * Use "printf" for the Starting and Stopping messages, so that the OK
>    / FAIL stay on the same line.
> 
>  * Pass the -q option to the start sequence, since it's passed in the
>    stop sequence.
> 
>  * Fix the configuration file to use an existing dyndns_system and
>    avoid a failure at startup.
> 
>  * Use a variable called ENABLED in /etc/default/inadyn to decide
>    whether to start the service or not. By default, it is not started,
>    as suggested by Gustavo, and an explicit ENABLED="yes" is needed.
> 
>  * Store the PID file in /var/run/inadyn.pid, like we do for all other
>    daemons.
> 
> Cc: Alex Suykov <alex.suykov@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---

Applied after dropping the silly comment in inadyn.conf, as suggested
by Yann.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
