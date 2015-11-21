From: Jaap Crezee <jaap@jcz.nl>
Date: Sat, 21 Nov 2015 20:53:34 +0100
Subject: [Buildroot] [PATCH 2/2 v3] package/nodejs: add version 4.1.2
In-Reply-To: <CAFGQKxeC83GJHc5+kHb3gJyyeXdSMJ6fFrSL8eRQXCjPVaHQ_A@mail.gmail.com>
References: <cover.1445291882.git.yann.morin.1998@free.fr>
 <eb34ab6d35a15dfbec70263091f58c3e7ec2efab.1445291882.git.yann.morin.1998@free.fr>
 <CAFGQKxcBe5fzTCrQQxBXH7OtAf_qy7v+5TeAfFxhzY1C9QhS8g@mail.gmail.com>
 <20151020162527.GA3738@free.fr>
 <CAFGQKxeC83GJHc5+kHb3gJyyeXdSMJ6fFrSL8eRQXCjPVaHQ_A@mail.gmail.com>
Message-ID: <5650CBBE.4080604@jcz.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,


Can somebody please add the following (might not be completely right, that's why I post it
like this):

[jaap at jaap /data/work/zupr/git/buildroot ]$ git diff
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 5128901..8d0ecad 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -32,7 +32,7 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
        # On supported architectures other than ARM, no special requirement
        default y if !BR2_arm
        # On ARM, at least ARMv6+ with VFPv2+ is needed
-       default y if !BR2_ARM_CPU_ARMV5 && BR2_ARM_CPU_HAS_VFPV2
+	default y if !BR2_ARM_CPU_ARMV5 && BR2_ARM_CPU_HAS_VFPV2 || BR2_ARM_CPU_HAS_NEON

 choice
        prompt "Node.js version"
[jaap at jaap /data/work/zupr/git/buildroot ]$

To my oppinion Neon is a VFPv2 succesor. NodeJS builds and runs fine with Neon selected
instead of VFPv2 for Cortex-A9.


Kind regards,

Jaap Crezee
