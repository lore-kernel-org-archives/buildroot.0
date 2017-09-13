From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Sep 2017 23:35:27 +0200
Subject: [Buildroot] [PATCH] Added support for package flatbuffers.
In-Reply-To: <HE1PR0402MB362873CDF66343E07F2D6FB6F96E0@HE1PR0402MB3628.eurprd04.prod.outlook.com>
References: <AM4PR0401MB17783D2C2D35AEC6A8C46882F99F0@AM4PR0401MB1778.eurprd04.prod.outlook.com>
 <AM4PR0401MB1778C651AD7C550B24B045A7F99F0@AM4PR0401MB1778.eurprd04.prod.outlook.com>
 <AM4PR0401MB1778E54593D1C3C1D749F4D1F99D0@AM4PR0401MB1778.eurprd04.prod.outlook.com>
 <HE1PR0402MB362873CDF66343E07F2D6FB6F96E0@HE1PR0402MB3628.eurprd04.prod.outlook.com>
Message-ID: <3dab2146-fbad-eace-75f3-647a87096c20@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Erik,

 Thanks a lot for your contribution! It's great to see new people using
Buildroot and contributing to it.

 However, in order to ease the review process, we like to receive patches inline
and not as attachments. Indeed, this allows us to simply hit "reply" and comment
on each part of the patch. This is a very typical review process used in the
open-source community. In order to send patches inline, we recommend you to use
"git send-email" as e-mail clients very often rewrap text and therefore make
patches unusable.

 From a quick look to your patch, here are a few comments:

- The patch title should be "flatbuffers: new package".

- Please add yourself to the DEVELOPERS file for this package, to indicate that
you're willing to fix things when they break.

- Please use utils/check-package to check the coding style. Indentation in
Config.in is not OK.

- Wrap FLATBUFFERS_CONF_OPTS, like:

FLATBUFFERS_CONF_OPTS += \
	-DCMAKE_CXX_FLAGS="-std=c++11" \
	-DFLATBUFFERS_BUILD_SHAREDLIB=TRUE \
	-DFLATBUFFERS_BUILD_TESTS=FALSE

(indent with 1 tab).

- You pass -DFLATBUFFERS_BUILD_SHAREDLIB=TRUE, so either it doesn't support
BR2_STATIC_LIBS, or you should supply the proper option based on
BR2_STATIC_LIBS. See e.g. rabbitmq-c.


 Could you look into those comments, and send an updated version of your
contribution, using git send-email ?

 Thanks!
 Regards,
 Arnout


[Thomas, thank you for this template text :-) ]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
