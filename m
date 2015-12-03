From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 03 Dec 2015 22:09:25 +0100
Subject: [Buildroot] [PATCH v2] openssl: security bump to version 1.0.2e
In-Reply-To: <1449164982-20789-1-git-send-email-gustavo.zacarias@free-electrons.com>
 (gustavo zacarias's message of "Thu, 3 Dec 2015 14:49:42 -0300")
References: <1449164982-20789-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <87si3jb5oa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "gustavo" == gustavo zacarias <gustavo.zacarias@free-electrons.com> writes:

 > From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
 > Fixes:
 > CVE-2015-3193 - BN_mod_exp may produce incorrect results on x86_64
 > CVE-2015-3194 - Certificate verify crash with missing PSS parameter
 > CVE-2015-3195 - X509_ATTRIBUTE memory leak

 > Enable IDEA as well since otherwise the build breaks (always great
 > upstream) - it's no longer patent encumbered.

 > Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
 > ---
 >  package/openssl/openssl.hash | 4 ++--
 >  package/openssl/openssl.mk   | 3 +--
 >  2 files changed, 3 insertions(+), 4 deletions(-)

 > diff --git a/package/openssl/openssl.hash b/package/openssl/openssl.hash
 > index 355be79..bed1c1c 100644
 > --- a/package/openssl/openssl.hash
 > +++ b/package/openssl/openssl.hash
 > @@ -1,2 +1,2 @@
 > -# From https://www.openssl.org/source/openssl-1.0.2d.tar.gz.sha256
 > -sha256	671c36487785628a703374c652ad2cebea45fa920ae5681515df25d9f2c9a8c8	openssl-1.0.2d.tar.gz
 > +# From https://www.openssl.org/source/openssl-1.0.2e.tar.gz.sha256
 > +sha256	eee11def03647aa2267434a779608af6fca645023c9a194ddb82f14426835537	openssl-1.0.2e.tar.gz

I'm not sure if you got it wrong of if upstream changed the tarball, but
that isn't the correct sha256:

curl https://www.openssl.org/source/openssl-1.0.2e.tar.gz.sha256
e23ccafdb75cfcde782da0151731aa2185195ac745eea3846133f2e05c0e0bff

curl -s https://www.openssl.org/source/openssl-1.0.2e.tar.gz | sha256sum
e23ccafdb75cfcde782da0151731aa2185195ac745eea3846133f2e05c0e0bff  -

Committed with that fixed, thanks. I'll also add it to the 2015.11.x
branch.

-- 
Bye, Peter Korsgaard
