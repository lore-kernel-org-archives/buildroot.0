From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 31 May 2016 15:28:38 +0100
Subject: [Buildroot] [PATCH] mesa3d: use -mno-compact-eh for Code
 Sourcery MIPS
In-Reply-To: <20160531135936.4f2c0691@free-electrons.com>
References: <1464689755-63804-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160531135936.4f2c0691@free-electrons.com>
Message-ID: <574D9F96.7030908@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 31/05/16 12:59, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 31 May 2016 11:15:55 +0100, Vicente Olivert Riera wrote:
> 
>> +# mesa3d doesn't like the new compressed exception handling of the Code
>> +# Sourcery MIPS toolchain and it fails to compile. Using -mno-compact-eh
>> +# fixes the problem.
>> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS),y)
>> +MESA3D_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mno-compact-eh"
>> +MESA3D_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -mno-compact-eh"
>> +endif
> 
> Isn't an upstreamable fix to mesa3d configure script a better solution?
> See package/libffi/0002-Fix-use-of-compact-eh-frames-on-MIPS.patch in
> Buildroot.

-mcompact-eh is only supported in Mentor tools currently. My patch is a
workaround for a broken toolchain feature. I'm not sure which
place is best. I suggest Buildroot is appropriate here as the issue is
specific to Mentor tools which are only used in cross compile
environments like Buildroot.

> Do you know when code can be built with this "Compact EH" feature and
> when code cannot? I.e how many packages are going to be potentially
> affected by this?

No, I believe this will be a toolchain bug. However Mentor have stopped
listing MIPS on their website so the chance of a fix seems low.

Regards,

Vincent.

> Thanks,
> 
> Thomas
> 
