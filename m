From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 4 Feb 2017 14:10:06 +0100
Subject: [Buildroot] [PATCH 1/1] pkg-generic: include symbolic links to
	files in packages-file-list.txt
In-Reply-To: <87o9yiz6x5.fsf@dell.be.48ers.dk>
References: <20170203212752.4016-1-patrickdepinguin@gmail.com>
 <87o9yiz6x5.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LXXH28qJPGtSNR1o9yFzJaBboN5ax_XoppqhroNELyn9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 4, 2017 at 9:39 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
>  > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>  > Using the package instrumentation hooks, a file packages-file-list.txt is
>  > created containing the list of files installed by a package with their size.
>
>  > Due to the use of 'find -type f', symbolic links to files are not included
>  > in this file list. Since the original purpose of this file was to calculate
>  > the total size of a package and symbolic links have file size 0, this was
>  > not a problem.
>
>  > However, if packages-file-list.txt is reused for other purposes, for example
>  > to get a complete list of files installed by a package regardless of size,
>  > symbolic links are important.
>  > Using 'find -xtype f' instead solves the problem.
>
> So what about directories and symlinks to directories?

Ok, I guess there's no problem in including them too. I'll try it, thanks.
