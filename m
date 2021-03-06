From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 06 Mar 2021 17:27:17 +0100
Subject: [Buildroot] [PATCH 3/3] package: drop _CPE_ID_VALID,
 use _CPE_ID_VENDOR
In-Reply-To: <857cc5e31466bd9ebecb87d7ad3849715c56e2d6.1614983175.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Fri, 5 Mar 2021 23:27:44 +0100")
References: <cover.1614983175.git.yann.morin.1998@free.fr>
 <857cc5e31466bd9ebecb87d7ad3849715c56e2d6.1614983175.git.yann.morin.1998@free.fr>
Message-ID: <87zgzg6ye2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > FOO_CPE_ID_VALID really ought to be an internal implementaion detail.
 > Packages that really want to trigger their CPE defintitions really
 > should set one of the actual variables to a meaningful value.

 > There are two CPE-related variables that we could chose to set to
 > replace FOO_CPE_ID_VALID: FOO_CPE_ID_VENDOR and FOO_CPE_ID_PRODUCT.
 > Between those two, _VENDOR more often diverges from the default than
 > _PRODUCT does, so that's what we use.

 > Reported-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
 > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 >     ---8<------8<------8<------8<------8<---
 >     #!/bin/bash
 >     # Replace FOO_CPE_ID_VALID = YES with FOO_CPE_ID_VENDOR = foo_project
 >     for i in $(git grep -l -E '[^)]_CPE_ID_VALID = YES' package support); do
 >         pkg="$(basename "${i%/*}")"
 >         sed -r -i -e "s/_CPE_ID_VALID = YES/_CPE_ID_VENDOR = ${pkg}_project/" "${i}"
 >     done
 >     ---8<------8<------8<------8<------8<---

 >  .../core/cpeid-br2-external/package/cpe-id-pkg3/cpe-id-pkg3.mk  | 2 +-

The pkg3 test still talks about _CPE_ID_VALID, so I reworded that and
committed, thanks.

-- 
Bye, Peter Korsgaard
