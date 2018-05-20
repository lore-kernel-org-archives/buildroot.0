From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 11:43:23 +0200
Subject: [Buildroot] [PATCH 1/1] mbedtls: security bump to version 2.7.3
In-Reply-To: <20180520081101.6039-1-fontaine.fabrice@gmail.com>
References: <20180520081101.6039-1-fontaine.fabrice@gmail.com>
Message-ID: <20180520114323.6525586d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 May 2018 10:11:01 +0200, Fabrice Fontaine wrote:
> Extract from release announcement:
> 
> - (2.9, 2.7, 2.1) Fixed an issue in the X.509 module which could lead
> to a buffer overread during certificate validation. Additionally, the
> issue could also lead to unnecessary callback checks being made or to
> some validation checks to be omitted. The overread could be triggered
> remotely, while the other issues would require a non DER-compliant
> certificate to be correctly signed by a trusted CA, or a trusted CA with
> a non DER-compliant certificate. Found by luocm. Fixes #825.
> 
> - (2.9, 2.7, 2.1) Fixed the buffer length assertion in the
> ssl_parse_certificate_request() function which could lead to an
> arbitrary overread of the message buffer. The overreads could be caused
> by receiving a malformed algorithms section which was too short. In
> builds with debug output, this overread data was output with the debug
> data.
> 
> - (2.9, 2.7, 2.1) Fixed a client-side bug in the validation of the
> server's ciphersuite choice which could potentially lead to the client
> accepting a ciphersuite it didn't offer or a ciphersuite that could not
> be used with the TLS or DTLS version chosen by the server. This could
> lead to corruption of internal data structures for some configurations.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mbedtls/mbedtls.hash | 6 +++---
>  package/mbedtls/mbedtls.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
