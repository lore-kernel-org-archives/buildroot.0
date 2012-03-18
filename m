From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 18 Mar 2012 18:37:30 +0100
Subject: [Buildroot] [PATCH] netsnmp: add option to enable debugging code
In-Reply-To: <1331845467-5100-1-git-send-email-luca@lucaceresoli.net>
References: <1331845467-5100-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <201203181837.30186.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 15 March 2012 22:04:27 Luca Ceresoli wrote:
> +ifneq ($(BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING),y)
> +       NETSNMP_CONF_OPT += --disable-debugging
> +endif

 Peter, is it correct that you prefer to have both the positive and the
negative option in such a situation?  I.e.

ifeq ($(BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING),y)
       NETSNMP_CONF_OPT += --enable-debugging
else
       NETSNMP_CONF_OPT += --disable-debugging
endif

or alternatively

NETSNMP_CONF_OPT += --$(if $(BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING),en,dis)able-debugging

 Otherwise,
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
