From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Nov 2014 20:56:48 +0100
Subject: [Buildroot] [PATCH 3/9] ifupdown: new package
In-Reply-To: <1416330117-4458-4-git-send-email-gustavo@zacarias.com.ar>
References: <1416330117-4458-1-git-send-email-gustavo@zacarias.com.ar>
 <1416330117-4458-4-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <546BA480.7050807@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/11/14 18:01, Gustavo Zacarias wrote:
> +define IFUPDOWN_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) BASEDIR=$(TARGET_DIR) -C $(@D) install
> +endef

 The bundled install tries to symlink ifdown->ifup, without removing ifup first.
So when it's installed a second time, or when busybox is selected, it errors out.

 Adding an $(RM) $(TARGET_DIR)/sbin/ifdown solves it.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
