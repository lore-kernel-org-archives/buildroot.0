From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Feb 2016 14:14:15 +0100
Subject: [Buildroot] [PATCH] qt: depends on BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <56CD9FD6.7040409@zacarias.com.ar>
References: <1456246089-19346-1-git-send-email-gustavo@zacarias.com.ar>
 <20160223222219.24b95205@free-electrons.com>
 <56CCDAF1.9070209@zacarias.com.ar>
 <20160223233023.6b376939@free-electrons.com>
 <56CD9FD6.7040409@zacarias.com.ar>
Message-ID: <20160224141415.1b6f3f16@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 24 Feb 2016 09:19:34 -0300, Gustavo Zacarias wrote:

> It seems it's both script & webkit that need atomics.
> However i think the arch supports list is flawed as well, webkit hasn't 
> worked for many of those architectures in the past - they build, yes, 
> but they'll probably crash on startup.
> But i'm not about to test all of them since that would require hardware, 
> so i'm removing sparc as well since it's a cliche that can't be fixed.

Fully agreed to remove SPARC from the list of supported architectures
for webkit and script. However, I believe it would still be good to add
the BR2_TOOLCHAIN_HAS_SYNC_4 dependency as well.

Regarding the architectures that build but don't work at runtime, I
guess all we can do is leave things are they are, and change them
when/if someone complains/reports an issue. We are indeed not going to
test Webkit/Script on every possible funky architecture.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
