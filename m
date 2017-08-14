From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Aug 2017 22:42:25 +0200
Subject: [Buildroot] [PATCH/next] get-developers: add option to get
 developers for files
In-Reply-To: <20170810211116.7996-1-arnout@mind.be>
References: <20170810211116.7996-1-arnout@mind.be>
Message-ID: <20170814224225.6d81a2e8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Aug 2017 23:11:16 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The DEVELOPERS file lists file patterns, but the get-developers script
> only supports getting packages and CPU architectures. Some files are
> neither of those, e.g. defconfigs, support files, package infras, ...
> 
> Add a '-f' option that allows to give a list of files for which to get
> the developer(s).
> 
> Note that the DEVELOPERS file contains directories as well as files,
> and the directories are not expanded into individual files. Therefore,
> we have to use f.startswith(devfile) to match a directory. This assumes
> that the directory name ends with /, otherwise 'package/python' would
> also match 'package/python-foo'. Since we make sure that directories do
> end with / in the DEVELOPERS file, and since false positives are not
> much of an issue in this case, this isn't a problem.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  utils/get-developers | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
