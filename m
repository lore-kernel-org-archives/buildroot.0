From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 19 May 2014 08:18:29 +0200
Subject: [Buildroot] [PATCH 1/1] netsnmp: Remove ldconfig calls
In-Reply-To: <1400013313-2281-1-git-send-email-bernd.kuhls@t-online.de>
References: <1400013313-2281-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <5379A235.2050101@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/05/14 22:35, Bernd Kuhls wrote:
> ldconfig breaks links created by gpu-viv-bin-mx6q.

 As far as I can tell, there is never any reason to call ldconfig during the
build. So, maybe a more fundamental solution would be to symlink
$(HOST_DIR)/usr/bin/ldconfig to /bin/true...

 Regards,
 Arnout

> 
> fixes
> http://autobuild.buildroot.net/results/ab5/ab57dd3729d529366808cbfc802f49360b2ec2b9/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
