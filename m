From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Aug 2017 01:13:38 +0200
Subject: [Buildroot] [Patch v7 04/10] rust-bootstrap: new package
In-Reply-To: <20170723081206.7774-5-eric.le.bihan.dev@free.fr>
References: <20170723081206.7774-1-eric.le.bihan.dev@free.fr>
 <20170723081206.7774-5-eric.le.bihan.dev@free.fr>
Message-ID: <170ae612-1cc1-434c-bafb-6cfab9e65d8b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-07-17 10:12, Eric Le Bihan wrote:
> This new package fetches a binary snapshot of the Rust compiler,
> suitable to bootstrap the host variant of the Rust compiler.
> 
> To bootstrap rustc version N, rustc N-1 is used.

 Is it really needed/useful to use N-1 to bootstrap with? From the user's
perspective, that's just another useless download, right?

 In fact, this way rust-bootstrap can be eliminated entirely: host-rust-bin can
be used instead. It does complicate things a little bit, because in that case we
should NOT depend on (target) rust-std-bin. So that means that host-rust-bin
shouldn't depend on rust-std-bin, so that dependency should be added in some
different way...

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
