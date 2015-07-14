From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Jul 2015 11:24:50 -0300
Subject: [Buildroot] [PATCH] inadyn: fix init script and default config
 file
In-Reply-To: <1436109171-30701-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1436109171-30701-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <55A51BB2.4090304@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/07/15 12:12, Thomas Petazzoni wrote:

>   * Fix the configuration file to use an existing dyndns_system and
>     avoid a failure at startup.

You definitely don't want this, if it's not configured and requires 
configuration for any sane usage let it be so.
You don't want to do this kind of thing by default:
https://en.wikipedia.org/wiki/NTP_server_misuse_and_abuse

Also trusting that 'background' is in the config doesn't seem foolproof 
either, dropping it and adding -b to the initscript sounds better to me.

Regards.
