From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 04 Sep 2012 07:50:31 +0200
Subject: [Buildroot] Please help with pkg infrastructure
In-Reply-To: <1346689042.29515.6.camel@sven>
References: <1346689042.29515.6.camel@sven>
Message-ID: <504596A7.7040408@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/03/12 18:17, Sven Neumann wrote:
> So what am I doing wrong here, because PKG_VERSION ends up being
> "undefined" instead of defaulting to the value of
> $BR2_PACKAGE_RAUMFELD_BRANCH ?
>
I don't see anything wrong with your definitions. Try running 'make -p'
and see which _BRANCH symbols are defined.

BTW, if _BRANCH turns out to be an empty string, make interprets that
the same way as undefined. So in that case, the _VERSION can be expected
to de 'undefined'.


Regards,
Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
