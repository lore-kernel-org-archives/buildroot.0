From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 May 2014 18:12:27 +0200
Subject: [Buildroot] Enabling readline support in wpa_cli
In-Reply-To: <c0fce23a65a14e6cbd228a9ec03cf091@DB3PR04MB075.eurprd04.prod.outlook.com>
References: <6ef3c8ef78fb45e3b64d042d0a681898@DB3PR04MB075.eurprd04.prod.outlook.com>
 <c0fce23a65a14e6cbd228a9ec03cf091@DB3PR04MB075.eurprd04.prod.outlook.com>
Message-ID: <5370F2EB.5000601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/05/14 16:16, Oscar Hellstr?m wrote:
> I should probably have added the readline dependency as well, right?
> 

 Indeed, you should have something like

ifeq ($(BR2_PACKAGE_READLINE),y)
BR2_PACKAGE_WPA_SUPPLICANT_DEPENDENCIES += readline
...
endif


 BTW, a patch like this would typically has as subject:

wpa_supplicant: enable readline support in wpa_cli


 BTW 2: on this list, the policy is not to top-post, but to reply below the
relevant quoted text (like I was doing here).


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
