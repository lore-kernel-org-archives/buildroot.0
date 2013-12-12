From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Dec 2013 23:13:38 +0100
Subject: [Buildroot] [PATCH] package/libgles: postpone the check for a
 missing GLES provider
In-Reply-To: <52AA31F2.8070900@mind.be>
References: <52A730B0.3020104@orange.com>
 <1386702439-10093-2-git-send-email-yann.morin.1998@free.fr>
 <52A842A3.3010302@mind.be>
 <201312111325.49600.yann.morin.1998@free.fr>
 <52A862B4.50103@orange.com> <52A8710F.7040406@orange.com>
 <52AA31F2.8070900@mind.be>
Message-ID: <20131212231338.33eae486@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 12 Dec 2013 23:00:18 +0100, Arnout Vandecappelle wrote:

>   Thomas, do you remember what was the reason to include external.mk 
> after package/*/*.mk rather than before? If there is no specific reason 
> for it, we could move it.

No, I don't see a particular reason. It was merely based on the idea
that BR2_EXTERNAL "adds" more packages to the set of packages provided
by Buildroot, so it felt logical to include the BR2_EXTERNAL stuff
*after* the BR packages. But I don't see anything that prevents the
BR2_EXTERNAL stuff from being moved before the Buildroot packages
inclusions. And Yann has already submitted a patch that does this.

>   I also feel that the way the opengl stuff is handled now is a bit 
> hacky, but I don't have any better ideas.

Huh? Can you be more specific in what you find hacky? The way the
OpenGL stuff is handled today is kind of becoming the norm to handle
virtual packages, so it'd be good to understand what you think is hacky
in this implementation.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
