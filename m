From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 06 Nov 2014 14:48:56 -0300
Subject: [Buildroot] [PATCH 2/7] package/uclibc: enable wordexp
In-Reply-To: <20141106184504.3133a975@free-electrons.com>
References: <1415281013-1077-1-git-send-email-gustavo@zacarias.com.ar>	<1415281013-1077-3-git-send-email-gustavo@zacarias.com.ar>	<20141106182251.1c12ea40@free-electrons.com>	<545BAF17.2090009@zacarias.com.ar>
 <20141106184504.3133a975@free-electrons.com>
Message-ID: <545BB488.9020200@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/06/2014 02:45 PM, Thomas Petazzoni wrote:

> I just had a look at ifupdown source code, and wordexp() is pretty
> central in the code, not sure we can easily replace it with something
> else without significantly patching the stuff.
> 
> I don't really have a good answer here. Maybe as you suggest disabling
> ifupdown entirely for uClibc toolchains? I've also checked
> Crosstool-NG, and all its default uClibc configuration files have
> wordexp disabled, so both Buildroot pre-built toolchains predating the
> wordexp addition and all Crosstool-NG uClibc toolchain would be
> affected by the problem.

Yes it's valid since it's bloat-land anyway, i'll wait for more feedback
but i'm inclined to just do that for v2.
And most of these standalone tools aren't happy with nommu anyway which
would be the only incentive to stick with uClibc.
Regards.
