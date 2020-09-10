From: Alexander Egorenkov <egorenar-dev@posteo.net>
Date: Thu, 10 Sep 2020 09:08:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/makedumpfile: fix build for
 powerpc target
In-Reply-To: <20200909232048.107b5922@windsurf.hq.k.grp>
References: <20200909164104.6246-1-egorenar-dev@posteo.net>
 <20200909232048.107b5922@windsurf.hq.k.grp>
Message-ID: <87r1rahzwg.fsf@posteo.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Is there an autobuilder failure for this? If so, there should be a link
> to it in your commit log. See for example this commit log:
>
>   https://git.buildroot.org/buildroot/commit/?id=a85ae8b297fd0526f57fe99d73087dd840ea6219
>

Fixed.

>
> I'm not sure the best solution here is to patch makedumpfile. Indeed,
> Buildroot's makedumpfile.mk is passing TARGET=$(BR2_ARCH), but there is
> nothing that "forces" makedumpfile to understand the BR2_ARCH values.
>
> So instead, I think we should have some logic in makedumpfile.mk that
> calculates the correct TARGET values depending on the CPU architecture.
> Something along the lines of:
>
> ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
> MAKEDUMPFILE_TARGET = ...
> else ifeq ($(BR2_arm)$(BR2_armeb),y)
> MAKEDUMPFILE_TARGET = ...
> else ifeq ...
> ...
> endif
>
> Perhaps if for some architectures the BR2_ARCH value is OK, you could
> finish this if sequence by:
>
> else
> MAKEDUMPFILE_TARGET = $(BR2_ARCH)
> endif
>
> and then of course, pass TARGET=$(MAKEDUMPFILE_TARGET)


Fixed. I find your suggestion a lot cleaner and like it better.

The new version of patch is on the way. 

Thanks for your constructive criticism
Regards
Alex
