From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 May 2021 18:03:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/flatcc: disable -Werror
In-Reply-To: <20210519194104.48784-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 19 May 2021 21:41:04 +0200")
References: <20210519194104.48784-1-fontaine.fabrice@gmail.com>
Message-ID: <87sg2d5tfk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Disable -Werror to fix the following build failure with gcc 11:
 > /data/buildroot-autobuilder/instance-0/output-1/build/host-flatcc-0.6.0/include/flatcc/reflection/flatbuffers_common_builder.h: In function 'flatbuffers_char_array_copy_from_pe':
 > /data/buildroot-autobuilder/instance-0/output-1/build/host-flatcc-0.6.0/include/flatcc/reflection/flatbuffers_common_builder.h:341:3: error: this 'for' clause does not guard... [-Werror=misleading-indentation]
 >   341 |   for (i = 0; i < n; ++i) N ## _copy_from_pe(&p[i], &p2[i]); return p; }\
 >       |   ^~~

 > An other option would have been to retrieve the following upstream
 > commit:
 > https://github.com/dvidelabs/flatcc/commit/f8c4140dd9dde61c86db751f6002def78754fced
 > but disabling -Werror is more future-proof

 > Fixes:
 >  - http://autobuild.buildroot.org/results/4d5cdddbfeefdeb943234b76eb08b04376f3c36d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
