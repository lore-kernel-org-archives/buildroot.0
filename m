From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Sep 2017 23:00:03 +0200
Subject: [Buildroot] [PATCH v2 1/1] toolchain: detect external glibc in
 merged /usr
In-Reply-To: <20170903210043.19105-1-camh@xdna.net>
References: <20170903210043.19105-1-camh@xdna.net>
Message-ID: <e88ba4e2-8ab0-eb4e-ccc5-7b0de801ae43@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-09-17 23:00, Cam Hutchison wrote:
> When using an external toolchain that was built with Buildroot and a
> merged /usr, the dynamic linker is actually in /usr/lib.
> 
> But the check_glibc macro limits the depth it is looking for the dynamic
> linker, and misses it when it is in /usr/lib because it is too deep.
> 
> We could fix that in two ways: increase the depth in which we look
> for it, or follow symlinks. We choose the second solution.
> 
> Signed-off-by: Cam Hutchison <camh@xdna.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

 Applied to master, thanks.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
