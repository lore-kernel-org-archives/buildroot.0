From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 23:26:37 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/ibm-sw-tpm2: fix glibc build
 errors
In-Reply-To: <20200818142512.16322-1-vfazio@xes-inc.com> (Vincent Fazio's
 message of "Tue, 18 Aug 2020 09:25:12 -0500")
References: <20200818142512.16322-1-vfazio@xes-inc.com>
Message-ID: <877dtilawi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vincent" == Vincent Fazio <vfazio@xes-inc.com> writes:

 > From: Vincent Fazio <vfazio@gmail.com>
 > In order to not have to define all architecture bitness variants in
 > src/LibSupport.h to conditionally define RADIX_BITS, a patch was created
 > to depend on LONG_BIT being defined via limits.h

 > For glibc, LONG_BIT is behind a _XOPEN_SOURCE define guard so patch the
 > makefile to define this macro as well as _DEFAULT_SOURCE.

 > Defining _XOPEN_SOURCE requires _DEFAULT_SOURCE to be explicitly defined
 > for builds to succeed as it is no longer impliclty defined when
 > _XOPEN_SOURCE is defined.

 > Fixes:
 > 	http://autobuild.buildroot.net/results/bc145dd23c80a0660300766d0c114a00ed2e52b6/
 > 	http://autobuild.buildroot.net/results/1d84e70c30d4d0719274aa4f3edc01772beb24a3/

 > Fixes: 19bd089004 ("package/ibm-sw-tpm2: fix patch to address musl builds")

 > Signed-off-by: Vincent Fazio <vfazio@gmail.com>

Committed to 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
