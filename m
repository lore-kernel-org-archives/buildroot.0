From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Feb 2014 21:29:59 +0100
Subject: [Buildroot] [PATCH] glibc: add 2.19 as a supported version
In-Reply-To: <1392054226-20285-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392054226-20285-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <52F936C7.4040300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/10/14 18:43, Thomas Petazzoni wrote:
> glibc 2.19 has been released recently
> (https://sourceware.org/ml/libc-alpha/2014-02/msg00224.html). This
> commit allows to build a toolchain with this new version. In order to
> allow this, we add a version selection that did not exist for
> glibc. We default to 2.18, which was the only supported version until
> now, and add an option for 2.19.

 How useful is it to offer a choice for the libc version?

 For uClibc it makes a tiny bit of sense because you may have custom
patches or a custom config, which you don't want to port when going to a
new buildroot version. But I don't think that's a very good reason to
begin with.

 For glibc, however, I really don't see a reason to keep multiple versions.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
