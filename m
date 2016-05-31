From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2016 16:44:15 +0200
Subject: [Buildroot] [PATCH] mesa3d: use -mno-compact-eh for Code
 Sourcery MIPS
In-Reply-To: <574D9F96.7030908@imgtec.com>
References: <1464689755-63804-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160531135936.4f2c0691@free-electrons.com>
 <574D9F96.7030908@imgtec.com>
Message-ID: <20160531164415.7f5c07b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 31 May 2016 15:28:38 +0100, Vicente Olivert Riera wrote:

> > Isn't an upstreamable fix to mesa3d configure script a better solution?
> > See package/libffi/0002-Fix-use-of-compact-eh-frames-on-MIPS.patch in
> > Buildroot.  
> 
> -mcompact-eh is only supported in Mentor tools currently. My patch is a
> workaround for a broken toolchain feature. I'm not sure which
> place is best. I suggest Buildroot is appropriate here as the issue is
> specific to Mentor tools which are only used in cross compile
> environments like Buildroot.

Hum, OK. This should probably have been explained in the commit log
and/or in a comment above the workaround. But if indeed
-mcompact-eh/-mno-compact-eh are available only in the Mentor
toolchain, then your proposal is the most appropriate one.

Or, alternatively, we could simply add this as a forced CFLAGS when
this toolchain is used, which would also avoid the need for a similar
workaround in the libffi package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
