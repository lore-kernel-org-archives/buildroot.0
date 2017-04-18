From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Apr 2017 23:49:54 +0200
Subject: [Buildroot] [PATCH 00/53] Eliminate $(HOST_DIR)/usr
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <60e35247-7330-b27d-1932-7a48a6b55afa@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi all,

On 12-04-17 11:38, Arnout Vandecappelle (Essensium/Mind) wrote:
> We currently use $(HOST_DIR)/usr as the prefix for host packages. That
> has a few disadvantages:
> 
> - There are some things installed in $(HOST_DIR)/etc and
>   $(HOST_DIR)/sbin, which is inconsistent.
> 
> - To pack a buildroot-built toolchain into a tarball for use as an
>   external toolchain, you have to pack output/host/usr instead of the
>   more obvious output/host.
> 
> - Because of the above, the internal toolchain wrapper breaks which
>   forces us to work around it (call the actual toolchain executable
>   directly). This is OK for us, but when used in another build system,
>   that's a problem.
> 
> - Paths are four characters longer.
> 
> This series replaces all occurences of 'host/usr' (in its various forms)
> with 'host', and updates relative paths accordingly.
[snip]

 Do we want this series still for 2017.05?

 If yes, I think it should be committed (or at least the first 7 or so patches)
pretty soon, so there are still a few weeks to iron out any major breakage
before the -rc1.

 If not, then I can just as well remove it from patchwork now, since it doesn't
make sense to apply it before June and then I can do a respin.

 Remove 53 out of 215 patches on patchwork would be nice :-)

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
