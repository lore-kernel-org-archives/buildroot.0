From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 02 Mar 2015 21:37:24 +0100
Subject: [Buildroot] Kernel Patches Not Applied
In-Reply-To: <36A43B0E1E88D84791516F9D44BC48331B4A722A@corpmail01.corp.sensis.com>
References: <36A43B0E1E88D84791516F9D44BC48331B4A722A@corpmail01.corp.sensis.com>
Message-ID: <54F4CA04.8050601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Nicholas,

On 26/02/15 19:29, Crast, Nicholas wrote:

> I am currently using buildroot-2014.11, and I am having issues patching my
> kernel. My kernel is a custom (untarred) source, so the build output is in
> output/build/linux-custom.

 Patches are not applied on a custom local source tree
(BR2_LINUX_KERNEL_CUSTOM_LOCAL). The typical use case for this is when you have
a local checkout of the source code which is managed by something like git
submodules or gerrit or whatnot.

 If you want to apply patches to a custom source tree, use
BR2_LINUX_KERNEL_CUSTOM_TARBALL with a file: or scp: URL.


 Regards,
 Arnout


[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
