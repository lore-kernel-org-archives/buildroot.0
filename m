From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 25 Oct 2012 23:30:00 +0200
Subject: [Buildroot] [PATCHv6 5/5] iw: pkg-config cleanup
In-Reply-To: <20121025005246.32170c83@skate>
References: <1350956875-1726-1-git-send-email-gustavo@zacarias.com.ar>
 <1350956875-1726-5-git-send-email-gustavo@zacarias.com.ar>
 <20121025005246.32170c83@skate>
Message-ID: <5089AF58.8010707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/10/12 00:52, Thomas Petazzoni wrote:
>> >  -IW_MAKE_ENV = PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
>> >  -	PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
>> >  +IW_MAKE_ENV = PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
>> >    	GIT_DIR=$(IW_DIR)
> I think the PKG_CONFIG variable can be removed as well. All packages
> are being compiled with TARGET_MAKE_ENV, which includes

  iw.mk doesn't use TARGET_MAKE_ENV, but it probably should.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
