From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Sep 2016 23:06:01 +0200
Subject: [Buildroot] How to build image with added files
In-Reply-To: <57c85f5a.8c4f620a.45d24.2e4a@mx.google.com>
References: <57c85f5a.8c4f620a.45d24.2e4a@mx.google.com>
Message-ID: <fcd9e72c-ef64-0b05-283c-2e545b1d0ab3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-09-16 19:03, yoda zhong wrote:
> Hi,
> 
>  
> 
> I tried to build image with ?make? after modifying /etc/network/interfaces.
> 
> But that is automatically made by buildroot. So I failed.
> 
> How could I make image with modified interfaces file?

 Use the filesystem-overlay feature.

https://buildroot.org/downloads/manual/manual.html#rootfs-custom

> 
>  
> 
> In addition, I tried to make image after adding one script on output/target.

 We don't have an 'image' target. I guess you just meant 'make'?

> 
> But this also doesn?t work. Is there any restriction on adding or modifying on
> output/target?

 Nothing ever gets removed from output/target, except for the cleanups done by
the finalize step (static libraries, documentation). So any script you added
there should stay. Except if you did a 'make clean', that removes the entire
output directory.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
