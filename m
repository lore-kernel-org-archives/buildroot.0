From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Mar 2016 09:19:20 +0100
Subject: [Buildroot] [PATCH 13/16] elf2flt: disable Werror to avoid
 build issues
In-Reply-To: <20160317014051.GN6588@vapier.lan>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-14-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160317014051.GN6588@vapier.lan>
Message-ID: <20160317091920.6c1453d5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mike,

On Wed, 16 Mar 2016 21:40:51 -0400, Mike Frysinger wrote:
> On 16 Mar 2016 22:43, Thomas Petazzoni wrote:
> > Some of the debugging printf use incorrect formats, which cause some
> > warnings. Due to the use of -Werror by default, the build breaks
> > unnecessarily. Therefore, disable -Werror when building elf2flt.
> 
> you should send a patch and/or open an issue.
> the build bot is clean for all the targets w/Werror:
> 	https://travis-ci.org/uclinux-dev/elf2flt

Sure, I'll reproduce and report. It's just some stupid printf specifier
issue with some of the funky bfd types.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
