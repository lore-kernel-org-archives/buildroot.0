From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Jul 2015 13:05:29 -0300
Subject: [Buildroot] [PATCH] inadyn: fix init script and default config
 file
In-Reply-To: <20150714175909.30648ed9@free-electrons.com>
References: <1436109171-30701-1-git-send-email-thomas.petazzoni@free-electrons.com>	<55A51BB2.4090304@zacarias.com.ar>	<20150714171916.56ef4a3f@free-electrons.com>	<55A52996.9090403@zacarias.com.ar>
 <20150714175909.30648ed9@free-electrons.com>
Message-ID: <55A53349.6040507@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/07/15 12:59, Thomas Petazzoni wrote:

> Ah, yes, I see. So maybe we should instead have:
>
> ENABLED="no"
>
> in /etc/default/inadyn
>
> and in the SXXinadyn, if ENABLED=="no", do something like:
>
> Starting inadyn: SKIPPED
>
> or something like that.
>
> Thoughts?

Yes, the initscripts enable/disable logic is pending (my fault probably, 
though i didn't follow the conclusions with detail).

> Ah, you're talking about inadyn -b option, while I was thinking of the
> start-stop-daemon option. Then it definitely makes sense, and I can get
> rid of the background option in the example config file.
>
> Sounds OK?

Yup, it's mostly covering for user omission since it costs nothing.
With the addition of -- -b :)
It also makes the systemd service more resilient, since it normally 
doesn't expect a background (at least via BR default config).
Regards.
