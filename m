From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Aug 2013 11:09:14 +0200
Subject: [Buildroot] [PATCH 3 of 6 v2] linux: add support for custom
 Mercurial repository
In-Reply-To: <52087CBD.10501@mind.be>
References: <patchbomb.1374650577@BEANTN0L019720>
 <702ce86cc56aec78ac12.1374650580@BEANTN0L019720>
 <52087CBD.10501@mind.be>
Message-ID: <20130813110914.00c661dc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Mon, 12 Aug 2013 08:12:13 +0200, Arnout Vandecappelle wrote:

>  Given that string options can't be propagated from their legacy values, 
> and since the name of an option isn't really that important, I'd keep 
> the _GIT_ names for the mercurial options as well.
> 
>  If we do rename the option symbol names, then I would make sure that it 
> is propagated:
> 
> 	default BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL if BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL != ""
> 
> + add a comment to the .legacy file so these hacks can be removed
> eventually.

Hum, I'm not sure how this articulates with the _WRAP mechanism that
patch 1/6 is proposing. If we do this:

 	default BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL if BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL != ""

then why would we need the _WRAP thing?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
