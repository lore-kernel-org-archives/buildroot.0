From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Jan 2016 15:31:52 +0100
Subject: [Buildroot] [PATCH v3 1/2] package/libsoil: fix build using old
 versions of patch
In-Reply-To: <1453641593-31129-2-git-send-email-ricardo.martincoski@gmail.com>
References: <1453641593-31129-1-git-send-email-ricardo.martincoski@gmail.com>
 <1453641593-31129-2-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <56A4E058.50308@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24-01-16 14:19, Ricardo Martincoski wrote:
> Well-formed patch fails to apply
> - patch v2.6:
> Hunk #1 FAILED at 1.
> Hunk #2 FAILED at 23.
> - patch v2.6.1:
> can't find file to patch at input line 11
> Perhaps you used the wrong -p or --strip option?
> [snip]
> No file to patch.  Skipping patch.
> 2 out of 2 hunks ignored
> Patch failed!  Please fix 0001-fix-makefile.patch!
>
> Old versions of the tool "patch" cannot handle spaces in filenames.
> The same does not occur using "patch" v2.7 or any later.
>
> Workaround: when a file with space in the name needs to be patched,
> one or two hooks must be used.
> A pre-patch or post-extract hook renames the file to replace spaces
> with underscores.
> The patch file must be generated using diff between two source-trees
> that have the file renamed with spaces replaced by underscores.
> A post-patch hook could rename the file to its original name if needed.
>
> Fixes:
> http://autobuild.buildroot.net/results/8ff/8ff91ab8e52000eb34dd8f662520cf1b31490cf5/
> http://autobuild.buildroot.net/results/ea7/ea77d6b23aca0cb1cf527e6c16ddf5eba957a69c/
>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
