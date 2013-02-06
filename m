From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 06 Feb 2013 21:04:03 +0100
Subject: [Buildroot] [PATCH 3/5] qt: define license
In-Reply-To: <20130206175833.6c382929@skate>
References: <1360167853-7177-1-git-send-email-luca@lucaceresoli.net>
 <1360167853-7177-3-git-send-email-luca@lucaceresoli.net>
 <20130206175833.6c382929@skate>
Message-ID: <5112B733.6090103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/02/13 17:58, Thomas Petazzoni wrote:
> Dear Luca Ceresoli,
>
> On Wed,  6 Feb 2013 17:24:11 +0100, Luca Ceresoli wrote:
>
>> +QT_LICENSE = LGPLv2.1 with exceptions or GPLv3 or commercial
>> +QT_LICENSE_FILES = LICENSE.LGPL LGPL_EXCEPTION.txt LICENSE.GPL3
>
> If Qt5, I've done:
>
> +ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
> +QT5BASE_CONFIGURE_OPTS += -opensource -confirm-license
> +QT5BASE_LICENSE = LGPLv2.1 or GPLv3.0

  Isn't it GPLv3 rather than GPLv3.0?

> +QT5BASE_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
> +else
> +QT5BASE_LICENSE = Commercial license
> +QT5BASE_REDISTRIBUTE = NO

  Hm. If LICENSE_APPROVED is not set, it means that the compilation will 
stop to ask the user which license s/he wants. That doesn't necessarily 
imply the commercial license. So I prefer an OR construct here as well.
And anyway, even if you hold a commercial license you're still free to 
distribute it under one of the other licenses.

  By the way, I'd also call it "Digia Qt Commercial license" to make it 
more explicit. But that's just an opinion.


  Regards,
  Arnout

> +endif
>
> See
> http://git.free-electrons.com/users/thomas-petazzoni/buildroot/commit/?h=qt5&id=7c1f7b9967d814e3f5c838e7090ac04b9d06af51
>
> Best regards,
>
> Thomas
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
