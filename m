From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 07 Jul 2014 17:52:33 +0200
Subject: [Buildroot] [PATCH] ARC: disable packages that require atomic
 builtins
In-Reply-To: <1404742914-21583-1-git-send-email-abrodkin@synopsys.com>
References: <1404742914-21583-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <53BAC241.9070808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/07/14 16:21, Alexey Brodkin wrote:
> In particular libtirpc is reported to be broken here: http://autobuild.buildroot.net/results/6bb90d3f2b840a1faacf152a1d93a909a2dc98d3
> 
> "rpcbind" in its turn selects "libtirpc", so it's required to disable it as well

 What about the packages that select libtirpc if !BR2_TOOLCHAIN_HAS_NATIVE_RPC?
argus, conntrack-tools, lmbench, nfs-utils, quota

> 
> As it is seen from http://autobuild.buildroot.org/results/3bd/3bda860a269dd9a4e38533cc9350892c68102618
> "zeromq" also uses "___sync_add_and_fetch_2" & "___sync_fetch_and_add_2" in
> "libpgm" so need to disable it.
> 
> And finally "zyre" selects "zeromq" so we disable it for ARC too.

 What about the other packages that use zeromq? cppzmq, czmq, filemq, mongrel2,
php-zmq, python-pyzmq, zmqpp?

 Because this is becoming a lot of changes, it's probably better to split into
two patches:

tirpc: disable on ARC

zeromq: disable on ARC


> 
> signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

 Signed-off-by should start with capital S (preferably use "git commit -s").


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
