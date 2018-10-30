From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Oct 2018 14:49:26 +0100
Subject: [Buildroot] [PATCH 2/2] lighttpd: add optional pam support
In-Reply-To: <87h8h38y1v.fsf@tkos.co.il> (Baruch Siach's message of "Tue, 30
 Oct 2018 13:38:04 +0200")
References: <20181030102152.9755-1-peter@korsgaard.com>
 <20181030102152.9755-2-peter@korsgaard.com>
 <87h8h38y1v.fsf@tkos.co.il>
Message-ID: <87wopzfst5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > Peter Korsgaard writes:
 >> Let the option depend on linux-pam as pam has quite some dependencies and
 >> this is unlikely to be used if pam isn't explicitly enabled.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> package/lighttpd/Config.in   | 7 +++++++
 >> package/lighttpd/lighttpd.mk | 8 +++++++-
 >> 2 files changed, 14 insertions(+), 1 deletion(-)
 >> 
 >> diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
 >> index 383c10f70f..0f37422aea 100644
 >> --- a/package/lighttpd/Config.in
 >> +++ b/package/lighttpd/Config.in
 >> @@ -26,6 +26,13 @@ config BR2_PACKAGE_LIGHTTPD_OPENSSL
 >> help
 >> Enable OpenSSL support for lighttpd.
 >> 
 >> +config BR2_PACKAGE_LIGHTTPD_PAM
 >> +       bool "pam authentication support"
 >> +       depends on BR2_PACKAGE_LINUX_PAM
 >> +       default y
 >> +       help
 >> +         Enable PAM authentication support for lighttpd.
 >> +

 > Why do we need a config option? What is the size impact of the lighttpd
 > PAM support?

Just for consistency with the other BR2_PACKAGE_LIGHTTPD_* options. I
would also prefer to use automatic dependencies like we do elsewhere,
but as we are explicitly handling the other optional dependencies it
seemed more sensible to do it for pam as well.

-- 
Bye, Peter Korsgaard
