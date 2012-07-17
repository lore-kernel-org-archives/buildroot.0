From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 20:41:13 +0200
Subject: [Buildroot] [PATCH v3 1/5] pkg-infra: add host-xxx-package macro
In-Reply-To: <1341266746-15301-1-git-send-email-arnout@mind.be>
References: <1341266746-15301-1-git-send-email-arnout@mind.be>
Message-ID: <20120717204113.30616375@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Tue,  3 Jul 2012 00:05:46 +0200,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

> Create host-generic-package, host-autotools-package and
> host-cmake-package macros.  Such a macro is more intuitive to use than
> the $(call ...,host) construct.  Also it speeds things up by having
> one less $(call ...) evaluation.
> 
> Also includes documentation update, but not for buildroot.html.
> 
> This brings the time for 'make -qp' (which is used by bash-completion)
> down from 1.85s to 1.35s on my laptop.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

I have merged this and the next 4 patches. I did a minimal test build
with some generic packages, autotools packages and cmake packages.
Besides minor formatting issues in the documentation, it all seemed to
work nicely. If not, I guess the autobuilders are going to tell us
fairly soon.

Now, the biggest thing is that I'll have to forget AUTOTARGETS,
GENTARGETS and CMAKETARGETS and remember autotools-package,
cmake-package and generic-package.

Thanks for doing this,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
