From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 21:25:38 +0100
Subject: [Buildroot] [git commit] package/genimage: add patch to support
 vfat volume-label
In-Reply-To: <20191222211222.5ae8664e@windsurf> (Thomas Petazzoni's message of
 "Sun, 22 Dec 2019 21:12:22 +0100")
References: <20191221212320.354B08D318@busybox.osuosl.org>
 <8736dc2ym1.fsf@dell.be.48ers.dk> <20191222211222.5ae8664e@windsurf>
Message-ID: <87pnggyunx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Sun, 22 Dec 2019 16:01:26 +0100
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> > Import "0001-image-vfat-Add-label-option-to-set-volume-name.patch" from
 >> > the upstream repository. The changes made to the README.rst file had to
 >> > be removed from the patch so that the package can be compiled in
 >> > buildroot. The patch has been accepted upstream, but no releases have
 >> > been made yet which includes the feature.  
 >> 
 >> > Signed-off-by: Dario Binacchi <dariobin@libero.it>
 >> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>  
 >> 
 >> Why? What is this required for? When is the next genimage version expected?

 > Well, it's just a new feature that someone needs. We normally don't
 > take feature patches, but this one is a backport from upstream.
 > genimage also does new releases fairly infrequently, so waiting for the
 > next release is not necessarily nice. The patch was short enough, taken
 > directly from upstream, so I said "ok, let's take, it will anyway go
 > away the next time we bump".

OK, but we indeed don't take feature patches unless there is a good
reason for it, and this commit is just syntactical sugar over adding -n
<label> to extraargs, E.G.:

image foo.fat {
  vfat {
    extraargs = "-n MYLABEL"
    ..
}

-- 
Bye, Peter Korsgaard
