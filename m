From: Hamish Moffatt <hamish@cloud.net.au>
Date: Sun, 20 Apr 2008 00:58:15 +1000
Subject: [Buildroot] r21760 and device_table.txt problems
In-Reply-To: <2590773a0804181647y4200320du60683223dd30a1d4@mail.gmail.com>
References: <2590773a0804181647y4200320du60683223dd30a1d4@mail.gmail.com>
Message-ID: <20080419145815.GB12780@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 18, 2008 at 07:47:34PM -0400, Christopher Taylor wrote:
> First, thank you all for your efforts.
> 
> I'm using r21760 and it appears that the device nodes aren't getting
> populated.  I realize that the root filesystem is now created in
> buildroot/project_build_ARCH/PROJECT/root but I don't see the device
> nodes specified by the device_table.txt
> 
> I'm assume I'm missing a step that tells buildroot to read the device
> table while it creates the root file system referenced above, but I
> didn't find it via make menuconfig.

Once the build finishes the device nodes will look like regular files.
This is because they are created within a fakeroot session. They can't
be real device nodes because that would require root priviledges at
build-time.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
