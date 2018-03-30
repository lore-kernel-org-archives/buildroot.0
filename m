From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 30 Mar 2018 21:49:08 +0200
Subject: [Buildroot] libopenssl in buildroot-2018.02
In-Reply-To: <b06bcfe21263864b9b35fdea9f15e99f@sw-optimization.com>
References: <b06bcfe21263864b9b35fdea9f15e99f@sw-optimization.com>
Message-ID: <cb163c18-c5c9-ed5d-d3df-27511d1ac9ba@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-03-18 15:38, Eric Schwarz wrote:
> Hello,
> 
> the patches to be downloaded for the openssl-1.0.2n.tar.gz package are
> defined in
> ??? ./package/libopenssl/libopenssl.mk
> by
> ??? LIBOPENSSL_PATCH
> 
> The patches are stored with some suffix after the "patch" extension.
> When those are checked-in using SVN and checked-out under Windows it
> won't work since there are "?" in the filename.
> 
> *
> openssl-1.0.2a-parallel-install-dirs.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d

 There is a trick possible by adding something after the URL:

openssl-1.0.2a-parallel-install-dirs.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d&br2_filename=/openssl-1.0.2a-parallel-install-dirs.patch

But it becomes really ugly...

 I wouldn't mind putting those patches directly in Buildroot instead of
downloading them from Gentoo.

> 
> *
> openssl-1.0.2a-parallel-obj-headers.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
> 
> *
> openssl-1.0.2a-parallel-symlinking.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
> 
> * openssl-1.0.2d-parallel-build.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
> 
> Apart, why have not those patches yet been applied to openssl master?

 Because nobody did the effort of upstreaming them? Since the patches come from
Gentoo, it's supposedly not our problem... But feel free to send those patches
(and also the ones we have in Buildroot, though I think patches 0001 and 0002
are both a bit iffy).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
