From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 24 Feb 2018 18:47:47 +0100
Subject: [Buildroot] [PATCH 1/1] czmq: bump to version v4.1.0
In-Reply-To: <20180224164305.6133-1-asafka7@gmail.com>
References: <20180224164305.6133-1-asafka7@gmail.com>
Message-ID: <d43c54d6-2c1b-c2fb-06ee-e396490fbb69@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Asaf,

 Thank you for your contribution.

On 24-02-18 17:43, Asaf Kahlon wrote:
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/czmq/czmq.hash | 2 +-
>  package/czmq/czmq.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/czmq/czmq.hash b/package/czmq/czmq.hash
> index 526ea594b9..77fdda0863 100644
> --- a/package/czmq/czmq.hash
> +++ b/package/czmq/czmq.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256 5c76de41f736f0c059e0b26174ef99200f2aba2fa38333683dbe4944b2f80555 czmq-5205ec201e97c3a652c17eb86b18b70350b54512.tar.gz
> +sha256 2e87c19988d1168b70d7ec0fdce79aba4e92a6330959c3a2576c72b319acb478 czmq-v4.1.0.tar.gz
> diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
> index 5305789d7a..c9a6b3c66a 100644
> --- a/package/czmq/czmq.mk
> +++ b/package/czmq/czmq.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CZMQ_VERSION = 5205ec201e97c3a652c17eb86b18b70350b54512
> +CZMQ_VERSION = v4.1.0
>  CZMQ_SITE = $(call github,zeromq,czmq,$(CZMQ_VERSION))

 There is an uploaded tarball for this release [1]. Please use that one instead.
It contains the configure script and the config directory, so no need anymore
for CZMQ_AUTORECONF and CZMQ_CREATE_CONFIG_DIR.

 Also, there are upstream md5 and sha1 sums, so please add those (with a
reference to the URL containing them). Since we don't consider md5 and sha1
strong enough, you'll have to keep the locally calculated sha256 as well.

 Finally, please also add a hash for the license file while you're doing an
update. This will make it easier to detect changes in the license in the future.

 Regards,
 Arnout

>  # Autoreconf required as we use the git tree
> 

[1] https://github.com/zeromq/czmq/releases/download/v4.1.0/czmq-4.1.0.tar.gz
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
