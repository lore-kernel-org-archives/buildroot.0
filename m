From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 09:21:17 +0200
Subject: [Buildroot] [PATCH v8 04/14] core: add HOST_SANITIZE_RPATH_HOOK
 to TARGET_FINALIZE_HOOKS
In-Reply-To: <57156FEB.6030203@mind.be>
References: <1460929111-15615-1-git-send-email-s.martin49@gmail.com>
 <1460929111-15615-5-git-send-email-s.martin49@gmail.com>
 <20160418133325.4892c80b@free-electrons.com>
 <57156FEB.6030203@mind.be>
Message-ID: <20160419092117.5834e8d3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Apr 2016 01:38:19 +0200, Arnout Vandecappelle wrote:

> > One tricky aspect though is that not all host packages are guaranteed
> > to be built by the time TARGET_FINALIZE_HOOKS is called. Indeed,
> > TARGET_FINALIZE_HOOKS is guaranteed to be called after all *target*
> > packages have been built. But if a host package is needed just to
> > build a filesystem image for example, it is not guaranteed that it will
> > be built before TARGET_FINALIZE_HOOKS is called.
> 
>   Actually, it is run after all explicitly selected packages have been built. So 
> this is yet another reason to also add Kconfig options for host packages.

Well, while I do like the fact that you try to find more arguments to
add Kconfig options for host packages, I am not sure this particular
one is a good reason. Indeed, as the name TARGET_FINALIZE_HOOKS
suggests, it finalizes the _target_, so there is no point in
guaranteeing that all host packages have been built *before* the hooks
in TARGET_FINALIZE_HOOKS are executed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
