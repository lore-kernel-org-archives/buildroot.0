From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 Oct 2011 23:21:57 +0200
Subject: [Buildroot] [PATCH v5] package: add opencv
In-Reply-To: <878voazf4r.fsf@macbook.be.48ers.dk>
References: <1319396325-9720-1-git-send-email-s.martin49@gmail.com>
 <878voazf4r.fsf@macbook.be.48ers.dk>
Message-ID: <201110262321.57932.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, October 24, 2011 15:35:32 Peter Korsgaard wrote:
[snip]
>  Samuel> +# Build type
>  Samuel> +OPENCV_CONF_OPT += -DCMAKE_BUILD_TYPE=$(if
> $(BR2_ENABLE_DEBUG),Debug,Release)
> 
> While this works it looks quite different than other packages - We
> normally do:
> 
> OPENCV_CONF_OPT += \
>                 blah=.. \
>                 blih=.. \
>                 bloh=..
> 
> ifeq ($(BR2_PACKAGE_BLAH))
> OPENCV_CONF_OPT += BLAH=on
> OPENCV_DEPENDENCIES += blah
> else
> OPENCV_CONF_OPT += BLAH=OFF
> endif
> 
> ..
> 
> I've rewritten it to use that form.

 Actually, for that particular one you haven't :-)

 Also I think it's important to use

ifeq ($(BR2_PACKAGE_BLAH),y)

 so you can easily disable it on the command line with

make BR2_PACKAGE_BLAH=n

(Of course, 'make BR2_PACKAGE_BLAH=' would still work, but it's less 
intuitive.)

 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
