From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Oct 2015 20:13:54 +0100
Subject: [Buildroot] [PATCH] uclibc: get rid of ARC's uClibc fork
In-Reply-To: <1445959005-23917-1-git-send-email-abrodkin@synopsys.com>
References: <1445959005-23917-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <562FCCF2.8090208@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27-10-15 16:16, Alexey Brodkin wrote:
> For quite some time all ARC changes have been pushed upstream.
> So both uClibc master branch 

 In that case, perhaps the snapshot version should be enabled for ARC?

> and uClibc-ng have full ARC support
> including the most recent changes.
> 
> I.e. finally we have reached the point when there's no need in
> Synopsys fork of uClibc on GitHub and it will soon be obsoleted and
> removed at some pint of time.
> 
> Now since vanilla uClibc hasn't seen any releases for many years we cannot
> really use it for ARC. Fortunately there exists uClibc-ng and Waldemar
> cuts releases regularly - that works perfectly fine for us.
> 
> That patch removes all mentions of ARC's uClibc which in turn makes
> uClibc-ng default libc for ARC.
> 
> Cc: Waldemar Brodkorb <wbx@openadk.org>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

 ... but that can be done independently of this patch, so:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>



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
