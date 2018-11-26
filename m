From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 18:08:18 +0100
Subject: [Buildroot] [PATCH-2018.02.x] prosody: security bump to version
 0.9.14
In-Reply-To: <20181126161011.31770-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 26 Nov 2018 17:10:11 +0100")
References: <20181126161011.31770-1-peter@korsgaard.com>
Message-ID: <87d0qrvkal.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > This fixes a cross-host authentication vulnerability, CVE-2018-10847.
 > The issue affects Prosody instances that have multiple virtual hosts
 > (including anonymous authenticated hosts):
 > https://blog.prosody.im/prosody-0-10-2-security-release

 > A full security advisory is available at
 > https://prosody.im/security/advisory_20180531

 > Compute hashes locally as they are no more available on
 > https://prosody.im/downloads/source/{MD5,SHA1,SHA256,SHA512}SUMS

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 >  package/prosody/prosody.hash | 9 ++++-----
 >  package/prosody/prosody.mk   | 2 +-
 >  2 files changed, 5 insertions(+), 6 deletions(-)

 > diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
 > index 38942ea7ff..a8648491e3 100644
 > --- a/package/prosody/prosody.hash
 > +++ b/package/prosody/prosody.hash
 > @@ -1,5 +1,4 @@
 > -# Hashes from: https://prosody.im/downloads/source/{MD5,SHA1,SHA256,SHA512}SUMS
 > -md5    d743adea6cfbaacc3a24cc0c3928bb1b  prosody-0.9.12.tar.gz
 > -sha1   1ee224263a5b3d67960e12edbbe6b2f16b95d147  prosody-0.9.12.tar.gz
 > -sha256 1a59a322b71928a21985522aa00d0eab3552208d7bf9ecb318542a1b2fee3e8d  prosody-0.9.12.tar.gz
 > -sha512
 > e87b5f3b3e327722cec9d8d0470684e2ec2788a1c5ae623c4f505a00572ef21f65afe84cd5b7de47d6a65fe8872506fe34e5e8886e20979ff84710669857ca76
 > prosody-0.9.12.tar.gz
 > +# Locally calculated
 > +sha256 27d1388acd79eaa453f2b194bd23c25121fe0a704d0dd940457caf1874ea1123  prosody-0.9.14.tar.gz
 > +
 > +

Committed to 2018.02.x after dropping the trailing newlines, thanks.

-- 
Bye, Peter Korsgaard
