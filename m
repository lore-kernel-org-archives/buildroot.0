From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Oct 2014 14:05:18 +0200
Subject: [Buildroot] qemu compiling error
In-Reply-To: <543E3CBC.5080901@free.fr>
References: <543E3CBC.5080901@free.fr>
Message-ID: <543E62FE.4040803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/10/14 11:22, St?phane ANCELOT wrote:
> git compiling I have got target list unknown error

 Please read the section in the manual about submitting bug reports: you should
give us the result of 'make savedefconfig' and which buildroot version you're using.

 However, in this case it happens to be obvious from the output, because the
error message is right there:

[snip]
> ERROR: Unknown target name 'i386-softmmu'

 You gave i386-softmmu as the target name (configuration variable
BR2_PACKAGE_QEMU_CUSTOM_TARGETS) but that doesn't exist. You probably want to
set it to i386.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
