From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Feb 2013 18:47:25 +0100
Subject: [Buildroot] [PATCH 1/1] openpgm: new package
In-Reply-To: <511A2006.90203@gmail.com>
References: <1360666051-16475-1-git-send-email-alexander.lukichev@gmail.com>
 <1360666051-16475-2-git-send-email-alexander.lukichev@gmail.com>
 <20130212115305.3c4b6990@skate> <511A2006.90203@gmail.com>
Message-ID: <511A802D.9030708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/02/13 11:57, Alexander Lukichev wrote:
> Hi, Thomas!
>
> On 02/12/2013 12:53 PM, Thomas Petazzoni wrote:
>> The only thing missing I believe is a
>> description + Signed-off-by line in the
>> package/openpgm/openpgm-cross-compile.patch file.
>
> Oops! I intended to do so but it fell out of my head. Will be fixed.
>
>> Also, did you test this package against uClibc or glibc?
> uClibc 0.9.33 only with largefile, threads and all the friends. I guess, threads are mandatory for this library. I'll set the correct dependencies and test with different base libs. Thanks.

  When you resubmit, please also:

- set the patch prefix to 'PATCH v3', using

git send-email --subject-prefix='PATCH v3' ...

- Include the changelog (which you now had in a separate mail) in the 
commit message itself, like so:

====================
openpgm: new package

OpenPGM is an open source implementation of the Pragmatic General
Multicast (PGM) specification in RFC 3208 available at www.ietf.org.
It is required for PGM/EPGM support in ZeroMQ library.

Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>
---
v3: Added Signed-off-by to the patch

v2: improved according to community suggestions:
- legal information supplied;
- OPENPGM_SUBDIR is used instead of a post extract hook;
- more recent release of the package is used;
- cross-compilation fix uses cached values instead of hard-coded ones.

The last thing has been implemented as recommended in Autoconf manual
(http://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.69/html_node/Runtime.html#Runtime)
for cross-compilation-friendly runtime tests. Direct caching of
pgm_unaligned_pointers variable produced a warning during autoreconfigure
that said that only variables containing _cv_ were cached, and
ac_cv_lbl_unaligned_fail was already used in Buildroot, so I based the
test on that one and set pgm_unaligned_pointers later from its result.
====================


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
