From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 3 Aug 2017 09:07:13 +0200
Subject: [Buildroot] [PATCHv2 2/2] instrumentation: extend
 packages-file-list.txt with symlinks and directories
In-Reply-To: <20170205134507.15328-3-patrickdepinguin@gmail.com>
References: <20170205134507.15328-1-patrickdepinguin@gmail.com>
 <20170205134507.15328-3-patrickdepinguin@gmail.com>
Message-ID: <6fcaded9-04c2-9b95-ccac-bcce2603cde3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-02-17 14:45, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Using the package instrumentation hooks, a file packages-file-list.txt is
> created containing the list of files installed by a package with their size.
> 
> Due to the use of 'find -type f', symbolic links to files are not included
> in this file list. Since the original purpose of this file was to calculate
> the total size of a package and symbolic links have file size 0, this was
> not a problem.
> 
> However, if packages-file-list.txt is reused for other purposes, for example
> to get a complete list of files installed by a package regardless of size,
> symbolic links to files are important too.
> 
> Likewise, to get a complete view of what a package installs, directories
> should be included too.
> 
> Update the instrumentation hook accordingly.
> Although for files an md5sum is taken, we cannot do this for directories.
> Instead, mimic the output of md5sum with a fake hash string.
> 
> Note: for directories that are used by several packages, e.g. /etc/init.d/,
> the package that created the directory will be treated as the 'owner' of
> that directory.  This gives a somewhat distorted view of ownership.
> Similarly, the package size reported by 'make graph-size' (based on
> packages-file-list.txt) will include the 'size' of a directory for that
> owner, which is reported as e.g. 4096 bytes.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

 In the end, I've applied both to next as-is, thanks!

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
