From: Matt Fornero <Matt.Fornero@mathworks.com>
Date: Tue, 5 Jul 2016 15:16:57 +0000
Subject: [Buildroot] [PATCH v4] toolchain-external: Commonize
 /lib/<tuple> symlinks
In-Reply-To: <42f862e3-4e60-1e17-1cba-71355c592924@gmail.com>
References: <1459381580-18169-1-git-send-email-mfornero@mathworks.com>
 <1463766725-15724-1-git-send-email-mfornero@mathworks.com>
 <aaf6a41c-7fc4-91a1-7272-3f3cdb64a901@gmail.com>
 <42f862e3-4e60-1e17-1cba-71355c592924@gmail.com>
Message-ID: <29dffd9fd6594bca8449d2007871d3bc@ex13amer-00-ah.ad.mathworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: Romain Naour [mailto:romain.naour at gmail.com]
> Sent: Monday, July 04, 2016 7:18 AM
> To: Matt Fornero <Matt.Fornero@mathworks.com>;
> buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH v4] toolchain-external: Commonize
> /lib/<tuple> symlinks
> 
[snip]

> After some discussion with other developers, I suggest you to register
> the TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS from
> BR2_EXTERNAL instead of adding a new configuration option to
> Buildroot. That way you can customize easily what should be done for
> your specific toolchain.
> 
> I'm doing this for my CodeSourcery x86 standard toolchain which require
> another symlink in staging directory.
> 

Hi Romain,

If I understand this correctly, I would simply define a new package in the BR2_EXTERNAL directory that was responsible for creating the symlinks as a _POST_INSTALL_STAGING_HOOKS action, and then enable this package for configurations that used the "custom" Linaro toolchains?

-Matt
