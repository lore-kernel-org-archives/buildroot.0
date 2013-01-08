From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 08 Jan 2013 21:53:45 +0100
Subject: [Buildroot] [PATCH] new variable <pkg>_CONFIG_FIXUP
In-Reply-To: <20130107234206.1487aa87@skate>
References: <1357596078-7762-1-git-send-email-stefan.froberg@petroprogram.com>
 <1357596078-7762-2-git-send-email-stefan.froberg@petroprogram.com>
 <20130107231037.39a798cf@skate> <50EB4AE5.7070407@petroprogram.com>
 <20130107234206.1487aa87@skate>
Message-ID: <50EC8759.7010505@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/07/13 23:42, Thomas Petazzoni wrote:
> Dear Stefan Fr?berg,
>
> On Tue, 08 Jan 2013 00:23:33 +0200, Stefan Fr?berg wrote:
>
>> You mean checking first in if-statement if  $($(PKG)_CONFIG_FIXUP exist ?
>> What is the best way to detect if it exist ?
>
> Just test if the variable is not empty, i.e test -n.
>
> Like (untested):
>
> 	if test -n $($(PKG)_CONFIG_FIXUP) ; then \
> 		$(call MESSAGE, "Blabla") ; \
> 		for file in ...
> 			...
> 		done
> 	fi

  The test isn't necessary, the loop will not execute if it is empty.

  Stefan, sed will give an appropriate error if the file doesn't exist.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
