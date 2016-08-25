From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 25 Aug 2016 10:57:11 +0200
Subject: [Buildroot] [PATCH 2/2] package/iputils: link with -lintl
In-Reply-To: <19ed123f-e837-e8a6-858e-639e6236f612@mind.be>
References: <20160824231003.29262-1-arnout@mind.be>
 <20160824231003.29262-2-arnout@mind.be>
 <20160825101843.4d7740e0@free-electrons.com>
 <19ed123f-e837-e8a6-858e-639e6236f612@mind.be>
Message-ID: <f459c419-2552-b6d3-4618-88a6fca11629@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-08-16 10:56, Arnout Vandecappelle wrote:
> * Add -lintl to link if BR2_USE_LIBINTL. Perhaps add a make variable:
> ifeq ($(BR2_USE_LIBINTL),y)

 Oh, and as per Baruch's suggestion, this could be

ifeq ($(BR2_USE_LIBINTL)$(BR2_STATIC_LIBS),yy)


 Regards,
 Arnout

> TARGET_LIBINTL_IF_NEEDED = -lintl
> endif

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
