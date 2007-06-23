From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 23 Jun 2007 11:39:28 +0200
Subject: [Buildroot] Can "make <>_defconfig" rules be restored?
In-Reply-To: <01c301c7b519$52679b40$6e02a8c0@k2>
References: <01c301c7b519$52679b40$6e02a8c0@k2>
Message-ID: <20070623093927.GG4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 22, 2007 at 05:04:35PM -0500, Rick Foos wrote:
>Hi All,
>
>I would like to use "_defconfig" files to save and restore specific defaults 
>for several platforms.
>
>The Makefile at one point supported loading of user defined "_defconfig" 
>files. In the current Makefile the noconfig_targets part of "_defconfig" is 
>commented out.
>
>Is there a problem with restoring "_defconfig" file loading?

Yes, the problem with this kind of _defconfig was that in a tree that
had already one or two compiled arches lying around, the find was the
cause for a delay in the order of several minutes on my box.
>
>I searched the list archives on defconfig, but could not find any decision 
>on this.

http://busybox.net/cgi-bin/viewcvs.cgi/trunk/buildroot/Makefile
revision 16763
>
>The following patch, restores "_defconfig" file loading limited to files at 
>a maxdepth of 4.
>
>This allows "_defconfig" files in packages and tools while avoiding the 
>_defconfig files in the linux source directories.
>
>The patch also fixes the find syntax, and allows "_defconfig" files to be in 
>the same directory as make.
>
>I'd like to propose that this patch be added, or let me know a better way to 
>manage multiple default configurations.

What is this _defconfig thing supposed to do? Please give an example of
what this accomplishes and how it does this.
