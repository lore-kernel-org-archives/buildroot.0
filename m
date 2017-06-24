From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 25 Jun 2017 00:16:16 +0200
Subject: [Buildroot] [PATCH v2 1/4] libressl: new package
In-Reply-To: <20170624214202.06d5a308@windsurf.home>
References: <20170624172900.3610-1-Adamduskett@outlook.com>
 <20170624214202.06d5a308@windsurf.home>
Message-ID: <fd65adb9-e721-8412-3521-463b8846b1cc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-06-17 21:42, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 24 Jun 2017 13:28:57 -0400, Adam Duskett wrote:
[snip]
>> +$(eval $(autotools-package))
>> +$(eval $(host-autotools-package))
> 
> Another question is how do we handle the host package. Right now, all
> packages that need openssl on the host depend on host-openssl. So as it
> is, this host-libressl package is never used.

 Au contraire: the host-virtual-package infra will use the one selected for the
target, so if target libressl is selected, host-libssl will depend on
host-libressl. So the host-libressl package is required.

 Except that Adam didn't add host-libssl :-)

 Actually, I guess it's OK if packages always use host-openssl. Shouldn't make a
difference for the target, right?


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
