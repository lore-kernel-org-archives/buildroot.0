From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 17 Apr 2015 00:09:59 +0200
Subject: [Buildroot] possibly silly question about top-level Makefile
In-Reply-To: <alpine.LFD.2.11.1504161749400.8332@localhost>
References: <alpine.LFD.2.11.1504161749400.8332@localhost>
Message-ID: <55303337.80002@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/04/15 23:57, Robert P. J. Day wrote:
> 
[snip]
> nconfig: $(BUILD_DIR)/buildroot-config/nconf outputmakefile
>         @mkdir -p $(BUILD_DIR)/buildroot-config
>         @$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
> 
> config: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>         @mkdir -p $(BUILD_DIR)/buildroot-config
>         @$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
> 
> isn't the "mkdir" command in *all* of those redundant?

 Good catch!

 Patch follows.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
