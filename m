From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Aug 2019 14:46:42 +0200
Subject: [Buildroot] [PATCH buildroot-test] autobuild-run: add
 --flush-downloads argument to prevent false NOK due to not enough space on
 hard drive
In-Reply-To: <20180919114541.17670-1-giulio.benetti@micronovasrl.com>
References: <20180919114541.17670-1-giulio.benetti@micronovasrl.com>
Message-ID: <1acee2c7-86f0-ff53-71ae-79b3809f7657@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Giulio,

 Sorry to be so late in responding to this...

On 19/09/2018 13:45, Giulio Benetti wrote:
> Some server/pc can have little hard drive, but high speed internet
> connection. If disk is little, autobuild-run could generate some false
> NOK reporting:
> Fatal error: ...: No space left on device
> 
> Add --flush-downloads argument to autobuild-run to delete entire
> instance-*/dl/ folder everytime it creates a new instance.

 This probably doesn't *completely* solve the issue, because a single download
can be very large as well.

 We discussed this at the hackaton and decided that it would be more appropriate
to instead tweak the number of files to delete from the download directory. By
setting that number very high, you can approximate the same result (except that
the git repos will never be touched). The code changes for that would be a lot
simpler we think, and we think it's more suitable as an option.

 Therefore, we've marked the patch as rejected in patchwork. Feel free to
implement the suggestion above instead (or, of course, keep this as an
out-of-tree patch).

 Regards,
 Arnout

> If active this will lead to re-download all files needed by an instance
> in its dl/ folder when created.
> As the other options, flush-downloads can be listed in .conf file like
> this:
> flush-downloads = yes
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
[snip]
