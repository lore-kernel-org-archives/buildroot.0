From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Oct 2013 10:10:31 +0200
Subject: [Buildroot] [PATCHv3 19/20] package: package-based
 implementation of source, external-deps and legal-info
In-Reply-To: <20131011092026.429bc0f8@skate>
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-20-git-send-email-thomas.petazzoni@free-electrons.com>
 <5256E2BC.8020503@mind.be> <20131010233303.783bfd6d@skate>
 <52572C61.6010707@mind.be> <20131011092026.429bc0f8@skate>
Message-ID: <5257B277.1030103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/10/13 09:20, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Fri, 11 Oct 2013 00:38:25 +0200, Arnout Vandecappelle wrote:
>
>>    I don't think it's useful to make them packages, because they are
>> really different. Adding the propagation of -all-source etc. to the
>> dependencies can easily be done in ROOTFS_TARGET_INTERNAL.
>
> Yeah, that's indeed another option. We're already doing it with
> $(1)-show-depends.
>
>>    In a later stage, we could consider to move the (few) common parts into
>> some common package/rootfs infrastructure, but the gain is limited I expect.
>
> Note that we have another strange location for a dependency on a
> package: the target-root-passwd target, which sets the root password,
> might depend on the host-mkpasswd package. So while normally, we
> consider all the target-<foo> targets in system/system.mk as useless
> for 'make source', 'make external-deps' and so on, it's not really the
> case for this one. Except that host-mkpasswd in fact has all its source
> code directly in package/mkpasswd/ (we don't download anything), and
> it's used purely on the host, so maybe we can ignore this problem?

  For now, yes. If we ever refactor the common parts from fs and 
pkg-generic, then we can also include the system stuff in there.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
