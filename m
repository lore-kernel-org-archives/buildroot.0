From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 5 Apr 2016 00:08:03 +0200
Subject: [Buildroot] [PATCH v4 1/7] barebox: support multi-image-build
 image selection
In-Reply-To: <20160402173145.656f9814@free-electrons.com>
References: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
 <1458513351-6556-2-git-send-email-pieter@boesman.nl>
 <20160402173145.656f9814@free-electrons.com>
Message-ID: <5702E5C3.4050708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/16 17:31, Thomas Petazzoni wrote:
[snip]
> Alternatively, you could do that with shell conditionals only, testing
> is BAREBOX_IMAGE_FILE is empty or not. This may be even easier to read:
>
> 	if test -n $(BAREBOX_IMAGE) ; then
> 		install $(BAREBOX_IMAGE)
> 	elif test -h $(@D)/barebox-flash-image ; then
> 		cp -L $(@D)/barebox-flash-image ...
> 	else
> 		cp $(@D)/barebox.bin ...
> 	fi

  +1 to that.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
