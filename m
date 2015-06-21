From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 21 Jun 2015 14:34:51 +0200
Subject: [Buildroot] [PATCH 1/2] openssl: support building the binary
 without MMU
In-Reply-To: <20150621064540.534ebebc@free-electrons.com>
References: <1434711274-49716-1-git-send-email-benoit@wsystem.com>
 <20150621064540.534ebebc@free-electrons.com>
Message-ID: <5586AF6B.6020304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/21/15 06:45, Thomas Petazzoni wrote:
> Dear Beno?t Th?baudeau,
> 
> On Fri, 19 Jun 2015 12:54:33 +0200, Beno?t Th?baudeau wrote:
>> The commit 720893b62510438237b9923d744dd079ddb4f67d "openssl: disable
>> apps for NOMMU" prevented the openssl binary from being built without
>> MMU in order to fix a build failure without fork(). However, openssl is
>> designed to support the lack of fork() with -DHAVE_FORK=0, so allow the
>> openssl binary to be enabled without MMU thanks to this option.
>>
>> Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
> 
> Hum. But then it means that we have propagated the MMU dependency to
> all reverse dependencies of openssl (i.e packages that depend on
> openssl), but they may no longer need this dependency anymore.

 This is only about BR2_PACKAGE_OPENSSL_BIN, which is not selected by any package.


 Regards,
 Arnout

> 
> There is a fairly huge list of packages that "select
> BR2_PACKAGE_OPENSSL". How can we find out which ones will now build
> fine without MMU support ?
> 
> By the way, do you have a specific need for openssl on no-MMU
> platforms? If so, on which platform? We don't have many no-MMU users,
> so it's good when they speak up :-)
> 
> Thanks,
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
