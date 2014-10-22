From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 Oct 2014 11:35:21 +0200
Subject: [Buildroot] [PATCH] bash: fix linking for static builds with
 uClibc toolchains
In-Reply-To: <54477614.1040209@imgtec.com>
References: <1413897705-47811-1-git-send-email-Vincent.Riera@imgtec.com>
 <5446C703.7070501@mind.be> <54477614.1040209@imgtec.com>
Message-ID: <54477A59.1050000@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/10/14 11:17, Vicente Olivert Riera wrote:
> Dear Arnout Vandecappelle,
> 
> On 10/21/2014 09:50 PM, Arnout Vandecappelle wrote:
>>   Also, does musl allow redefining getenv?
> 
> Well, I did a test with a static build using the musl toolchain and it worked
> fine. So, yes, it seems that musl is ok with the getenv redefinition.

 Perhaps it's a good idea to mention this analysis explicitly in comments.
Something like:

# bash wants to redefine the getenv() function. To check whether this is
# possible, AC_TRY_RUN is used which is not possible in cross-compilation.
# On uClibc, redefining getenv is not possible; on glibc and musl it is.


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
