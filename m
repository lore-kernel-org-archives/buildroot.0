From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 Apr 2018 23:58:20 +0200
Subject: [Buildroot] [PATCH 2/3] dropbear: Add configuration options for
 security features
In-Reply-To: <20180418142434.7268-2-stefan.sorensen@spectralink.com>
References: <20180418142434.7268-1-stefan.sorensen@spectralink.com>
 <20180418142434.7268-2-stefan.sorensen@spectralink.com>
Message-ID: <533c6880-ac31-b6cc-166f-7c973ecdef5e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-04-18 16:24, Stefan S?rensen wrote:
> The dropbear server provides no runtime configuration of ciphers, key
> exchange algorithms, etc., but must rather be configured compile time.
> With no configurability the default settings will be use which may not
> be desired in all scenearios.
> 
> These new options allow the selection of
>   Ciphers (AES128, AES256, 3DES, BLowfish, Twofish128, Twofish256)
>   Cipher modes (CBC, CTR)
>   Integrity algorithms (SHA1, SHA1-96, SHA2-256, SHA2-512, MD5)
>   Key exchange algorithms (RSA, DSS, ECDSA, Curve25519, ECDH)
>   Authenticaton types (Password, Pubkey)
> 
> No defaults are changed.
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> ---
>  package/dropbear/Config.in   | 163 +++++++++++++++++++++++++++++++++++

 Do we really want so many configuration options?

 It is already possible to customize options.h through a patch in
BR2_GLOBAL_PATCH_DIR. I admit that that's a little hackish, so as an alternative
you could add an option to supply a custom options.h.

 Regards,
 Arnout

>  package/dropbear/dropbear.mk |  25 +++++-
>  2 files changed, 185 insertions(+), 3 deletions(-)
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
