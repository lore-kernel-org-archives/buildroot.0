From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 17:21:44 +0100
Subject: [Buildroot] [PATCH 2/4] libglu: add a hash file
In-Reply-To: <1449059383-62131-2-git-send-email-Vincent.Riera@imgtec.com>
References: <1449059383-62131-1-git-send-email-Vincent.Riera@imgtec.com>
 <1449059383-62131-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151217172144.5891a052@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 2 Dec 2015 12:29:41 +0000, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/libglu/libglu.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/libglu/libglu.hash

I don't think a hash for this package will work fine: it is a snapshot
tarball generate by cgit. As an example, the tarball I had locally here
did not had the same hash as the one you entered. Once re-downloaded, I
got a tarball that had a hash matching yours. But again, I don't think
we can assume it's a stable hash.

thomas at skate:~/projets/buildroot (master)$ make libglu-extract
ERROR: glu-9.0.0.tar.gz has wrong sha256 hash:
ERROR: expected: 3d19cca9b26ec4048dd22e3d294acd43e080a3205a29ff47765bd514571ea8f9
ERROR: got     : 0d10e3b297663e701499fc0324f62bf697a61b984c873cb5b43d636668c41659
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
dl-wrapper: Re-downloading 'glu-9.0.0.tar.gz'...
--2015-12-17 16:32:05--  http://cgit.freedesktop.org/mesa/glu/snapshot/glu-9.0.0.tar.gz
Resolving cgit.freedesktop.org (cgit.freedesktop.org)... 131.252.210.161
Connecting to cgit.freedesktop.org (cgit.freedesktop.org)|131.252.210.161|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [application/x-gzip]
Saving to: ?/home/thomas/projets/buildroot/output/build/.glu-9.0.0.tar.gz.x6B3tE/output?

/home/thomas/projets/buildroot/output     [         <=>                                                             ] 296,94K   155KB/s   in 1,9s   

2015-12-17 16:32:08 (155 KB/s) - ?/home/thomas/projets/buildroot/output/build/.glu-9.0.0.tar.gz.x6B3tE/output? saved [304063]

glu-9.0.0.tar.gz: OK (sha256: 3d19cca9b26ec4048dd22e3d294acd43e080a3205a29ff47765bd514571ea8f9)

I've marked this patch as Rejected.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
