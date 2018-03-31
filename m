From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 20:39:52 +0200
Subject: [Buildroot] [PATCH v4 0/8] Introduce a golang-package
 infrastructure
In-Reply-To: <59305a52-e530-029c-84ce-981085d607c0@mind.be>
References: <20180331132736.21105-1-thomas.petazzoni@bootlin.com>
 <59305a52-e530-029c-84ce-981085d607c0@mind.be>
Message-ID: <20180331203952.0a57e8b0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 31 Mar 2018 20:00:43 +0200, Arnout Vandecappelle wrote:
> On 31-03-18 15:27, Thomas Petazzoni wrote:
> > Hello,
> > 
> > This v4 is a new iteration of the work done by Angelo Compagnucci to
> > introduce a golang package infrastructure. Note that in its v3 of the
> > series, Angelo had a PATCH 7/7 that was adding 'mender' as a new
> > package, but this specific patch is not part of this series.  
> 
>  Series applied, with the exception of 7/8 which had a relevant comment from Yann:
> 
>    So, where do you now enforce a static build when
>    BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT is set?
> 
>  Angelo, could you respin that patch together with mender?

I took care of PATCH 7/8, which converts docker-engine to the
golang-package infrastructure, re-adding the code handling
BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT.

So the Mender patch remains. I don't think Angelo really needs to
respin it, since we haven't reviewed it (yet).

>  I also made some changes to pkg-golang.mk:
> 
>      - Rewrap comments to 80 columns.
>      - Create a global definition of GO_TARGET_ENV.
>      - <PKG>_GO_ENV is appended to the default env instead of replacing it.
>      - Add a note to inner-golang-package that only target is supported.
> 
>  Angelo, please review those and send follow-up patches if you don't agree with
> any of it.
> 
>  Thank you for the persistence on this one! And thank you Yann for reviewing.

And thank you for doing a final review on this series!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
