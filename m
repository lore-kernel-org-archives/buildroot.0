From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 28 Aug 2014 01:09:06 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain/uclibc-ng: add support for
 uClibc-ng
In-Reply-To: <20140811113124.GA19506@waldemar-brodkorb.de>
References: <20140811113124.GA19506@waldemar-brodkorb.de>
Message-ID: <53FE6512.9050600@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Waldemar,

On 08/11/14 13:31, Waldemar Brodkorb wrote:
> uClibc-ng is a spin-off of uClibc. uClibc-ng will do
> a 1.0 release really soon. uClibc lacks releases and
> the maintainer does not communicate any timeplans for
> releases. For more information about uClibc-ng see:
> http://www.uclibc-ng.org

 What a surprising lack of reaction on this patch! I'd have expected people to
welcome this very much...

 However, I'll start with immediately burning it to the ground :-) I think the
situation of uClibc-ng is very similar to eglibc: it's essentially the same
package, just a different version of it. So, instead of creating a whole new
copy, I think it's easier to maintain if it is one more uclibc version in
package/uclibc/Config.in.


> 
> Differences to uClibc master:
> http://uclibc-ng.org/wiki/Changes

 That page doesn't seem to exist?


> 
> Notes about needed config changes:
> http://uclibc-ng.org/wiki/Upgrade

 Neither does this one...

> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>


> ---
>  package/gcc/Config.in.host               |    6 +-
>  package/uclibc-ng/Config.in              |  198 ++++++++++++
>  package/uclibc-ng/uClibc-ng-1.0.0.config |  232 ++++++++++++++

 You can probably drop the third version number from the .config, like used to
be the case for busybox. So uClibc-ng-1.0.config.

 Regards,
 Arnout

>  package/uclibc-ng/uclibc-ng.mk           |  503 ++++++++++++++++++++++++++++++
>  toolchain/toolchain-buildroot/Config.in  |   19 +-
>  5 files changed, 953 insertions(+), 5 deletions(-)
>  create mode 100644 package/uclibc-ng/Config.in
>  create mode 100644 package/uclibc-ng/uClibc-ng-1.0.0.config
>  create mode 100644 package/uclibc-ng/uclibc-ng.mk
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
