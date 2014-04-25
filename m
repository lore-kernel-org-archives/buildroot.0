From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Apr 2014 09:38:02 +0200
Subject: [Buildroot] [git commit] acpid: unavailable for external uClibc
 toolchains
In-Reply-To: <20140424204218.2F6159C9B8@busybox.osuosl.org>
References: <20140424204218.2F6159C9B8@busybox.osuosl.org>
Message-ID: <20140425093802.7c4c90da@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Thu, 24 Apr 2014 22:35:33 +0200, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=ec6aaa4706d6826aca4e48ea65bbebbd893f76d6
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> External non-patched uClibc toolchains lack the MSG_CMSG_CLOEXEC
> definition, so does internal uClibc <0.9.33, so exclude it for those
> scenarios. Fixes:
> http://autobuild.buildroot.net/results/6d4/6d471942788fa05f324649ab15e6ca382e46df9c/

Huh? This build failure is due to a difference between a patched
version of uClibc (available in the internal toolchain backend) and an
external uClibc toolchain. Haven't we said that we shouldn't really on
our uClibc internal toolchain having feature patches, and instead patch
the packages?

I'm sorry, but I disagree with the solution chosen here.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
