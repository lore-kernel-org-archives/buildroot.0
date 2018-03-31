From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 31 Mar 2018 20:00:43 +0200
Subject: [Buildroot] [PATCH v4 0/8] Introduce a golang-package
 infrastructure
In-Reply-To: <20180331132736.21105-1-thomas.petazzoni@bootlin.com>
References: <20180331132736.21105-1-thomas.petazzoni@bootlin.com>
Message-ID: <59305a52-e530-029c-84ce-981085d607c0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31-03-18 15:27, Thomas Petazzoni wrote:
> Hello,
> 
> This v4 is a new iteration of the work done by Angelo Compagnucci to
> introduce a golang package infrastructure. Note that in its v3 of the
> series, Angelo had a PATCH 7/7 that was adding 'mender' as a new
> package, but this specific patch is not part of this series.

 Series applied, with the exception of 7/8 which had a relevant comment from Yann:

   So, where do you now enforce a static build when
   BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT is set?

 Angelo, could you respin that patch together with mender?

 I also made some changes to pkg-golang.mk:

     - Rewrap comments to 80 columns.
     - Create a global definition of GO_TARGET_ENV.
     - <PKG>_GO_ENV is appended to the default env instead of replacing it.
     - Add a note to inner-golang-package that only target is supported.

 Angelo, please review those and send follow-up patches if you don't agree with
any of it.

 Thank you for the persistence on this one! And thank you Yann for reviewing.

 Regards,
 Arnout


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
