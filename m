From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Nov 2014 18:45:04 +0100
Subject: [Buildroot] [PATCH 2/7] package/uclibc: enable wordexp
In-Reply-To: <545BAF17.2090009@zacarias.com.ar>
References: <1415281013-1077-1-git-send-email-gustavo@zacarias.com.ar>
 <1415281013-1077-3-git-send-email-gustavo@zacarias.com.ar>
 <20141106182251.1c12ea40@free-electrons.com>
 <545BAF17.2090009@zacarias.com.ar>
Message-ID: <20141106184504.3133a975@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 06 Nov 2014 14:25:43 -0300, Gustavo Zacarias wrote:

> Yes, that's true.
> The series is RFC, i can add an exception for external toolchains, or
> alternatively just disable this for uClibc in general - after all
> enabling all the big versions is bloaty enough.

I just had a look at ifupdown source code, and wordexp() is pretty
central in the code, not sure we can easily replace it with something
else without significantly patching the stuff.

I don't really have a good answer here. Maybe as you suggest disabling
ifupdown entirely for uClibc toolchains? I've also checked
Crosstool-NG, and all its default uClibc configuration files have
wordexp disabled, so both Buildroot pre-built toolchains predating the
wordexp addition and all Crosstool-NG uClibc toolchain would be
affected by the problem.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
