From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 7 Apr 2019 22:25:19 +0200
Subject: [Buildroot] [PATCH 1/1] boost: correctly disable icu in locale
 if needed
In-Reply-To: <20180713174247.4005-1-fontaine.fabrice@gmail.com>
References: <20180713174247.4005-1-fontaine.fabrice@gmail.com>
Message-ID: <20190407222519.01e928a6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Fri, 13 Jul 2018 19:42:47 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> boost doesn't take into account --without-icu flag and links
> libboost_locale with icu if it founds it in staging directory
> 
> So use boost.locale.icu to fix this issue
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boost/boost.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

This patch is still pending in patchwork. Is it still needed ? You send
a number of Boost fixes since then, and the last Boost build errors I
can see at http://autobuild.buildroot.net/?reason=boost% are:

 - Download failure due to DNS resolution problem (late March)

 - Internal compiler error on Xtensa, mips64, ARC (dating back from
   January/February)

Could you check whether your patch would still be needed or not ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
