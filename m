From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Sep 2017 08:04:32 +0200
Subject: [Buildroot] [PATCH 1/1] linuxptp: bump to the latest version
In-Reply-To: <a9a2f132-bb2f-a79e-cd8e-4116ae096691@jikos.cz>
References: <1504977449-30925-1-git-send-email-brain@jikos.cz>
 <20170909220851.56a41dc1@windsurf.lan>
 <a9a2f132-bb2f-a79e-cd8e-4116ae096691@jikos.cz>
Message-ID: <20170910080432.0a6bc7b6@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 9 Sep 2017 22:53:06 +0200, Petr Kulhavy wrote:

> > Why are you removing the hash ?  
> Well, I was just following the BR manual :-) Where it says that "none" 
> is used for cloned repositories.

From the manual:

"""
Hashes are currently checked for files fetched from http/ftp servers,
Git repositories, files copied using scp and local files. Hashes are
not checked for other version control systems (such as Subversion, CVS,
etc.) because Buildroot currently does not generate reproducible
tarballs when source code is fetched from such version control systems.
"""

But I indeed see:

"""
The none hash type is reserved to those archives downloaded from a
repository, like a git clone, a subversion checkout?
"""

So we have to fix the manual :)

> Is there a command to just clone and compress the repo via BR?
> The <package>-extract make target fails if the hash doesn't exist and 
> consequently deletes the temporary files.

Yeah, it's a bit annoying. If you put a none hash temporarily, then you
can have the tarball downloaded, calculate its hash, and add it. We
also had proposals like https://patchwork.ozlabs.org/patch/791357/ to
help with this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
