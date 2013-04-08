From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 08 Apr 2013 13:38:48 -0300
Subject: [Buildroot] syslog messages during boot not recorded?
In-Reply-To: <loom.20130408T181747-784@post.gmane.org>
References: <loom.20130408T181747-784@post.gmane.org>
Message-ID: <5162F298.7060909@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/08/2013 01:30 PM, Francesco Montorsi wrote:

> I installed some daemons wrote by me which are started at boot time by some 
> /etc/init.d scripts of mine. These daemons use many syslog() to provide 
> verbose debugging messages... however, for some reason, when I boot the 
> system and cat /var/log/messages, I do not see any message.
> If I start manually the daemons, the messages are correctly logged to 
> /var/log/messages... 
> 
> I think that this problem maybe because syslogd is startd AFTER all 
> /etc/init.d scripts have been processed.. is that right?

Hi.
Or maybe your busybox is configured to use the circular buffer (in RAM)
for logs (CONFIG_FEATURE_IPC_SYSLOG)... and you should just read your
logs with "logread"...
Regards.
