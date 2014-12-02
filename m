From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Dec 2014 10:30:21 +0100
Subject: [Buildroot] [PATCH 4/4] pkg-download: check hasahes for locally
 cached files
In-Reply-To: <87fvcy2yhi.fsf@dell.be.48ers.dk>
References: <cover.1417475935.git.yann.morin.1998@free.fr>
 <e1cc728a60b6a250ea395ee429dba7f470b1f8a8.1417475935.git.yann.morin.1998@free.fr>
 <20141202093148.1a1f7db7@free-electrons.com>
 <87fvcy2yhi.fsf@dell.be.48ers.dk>
Message-ID: <20141202103021.6e75224a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 02 Dec 2014 10:27:05 +0100, Peter Korsgaard wrote:

>  > So in essence, from now on, at each build, we are re-checking the
>  > hashes, while previously they were checked only when the file was
>  > downloaded. Not that great for build time, but well, again maybe the
>  > time to check the hashes is negligible compared to the build time. And
>  > we can assume that a big tarball, which takes a certain time to hash,
>  > will also contain a lot of source code to build, so the time to
>  > calculate the hash is proportional to the build time of the package. So
>  > if you're ready to spend several minutes to build Qt, you're probably
>  > ready to wait a few more seconds to calculate the hash of the Qt
>  > tarball each time.
> 
> I doubt it adds any significant time. Probably the hash and extract
> steps are largely I/O bound, so "pre-heating" the page cache by
> calculating a hash on the tarball before extracting it shouldn't matter
> much.

True. Anyway, my comment really wasn't rejecting the idea, just
pointing out the additional stuff we are doing.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
