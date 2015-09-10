From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Sep 2015 10:19:04 +0200
Subject: [Buildroot] Xorg Segmentation fault now. Please help
In-Reply-To: <CAEzGmjDwBwLt8kynQpjj-2sKtOX6Un7TLXX1i7sH6vBODda+9A@mail.gmail.com>
References: <CAEzGmjDwBwLt8kynQpjj-2sKtOX6Un7TLXX1i7sH6vBODda+9A@mail.gmail.com>
Message-ID: <55F13CF8.3070706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10-09-15 09:15, Lennart Ramberg wrote:
> Hello,
> 
> After having been away from Buildroot since last year, I'm at it again.
> But I had a setback;
> 
> With 2014.11 the xorg-server runs allright.
> Jumping to 2015.08.1 the xorg-server won't run.
> Why might this be? Please help.
> 
> Below is a part of my /var/log/Xorg.0.log after I executed 'X',
> as well as my defconfig (and there is nothing suspicious in the overlays).
> And I did a 'make clean all' first.

 I know nothing about X, but here are a few tips:

- I see you are using ccache. That is still not 100% reliable, so perhaps try
again with turning ccache off and do a make clean all.

- You could disable the intel driver and enable e.g. VESA or fbdev to isolate
where the issue is.

- You could try to vary the kernel and gcc versions.

 And of course, check the Xorg bug tracker.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
