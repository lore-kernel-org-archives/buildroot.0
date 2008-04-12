From: Hamish Moffatt <hamish@cloud.net.au>
Date: Sat, 12 Apr 2008 19:22:10 +1000
Subject: [Buildroot] Editing filesystem files
In-Reply-To: <005b01c89b00$1630eeb0$ad289e86@LPSC0173W>
References: <20080409223102.GA4582@cloud.net.au>
	<005b01c89b00$1630eeb0$ad289e86@LPSC0173W>
Message-ID: <20080412092210.GA15915@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 10, 2008 at 01:43:20PM +0200, Guillaume Dargaud wrote:
> 
> > Dependencies between files in the root and the target_skeleton would be
> > preferable. This would detect everything other than file deletions.
> 
> Yes, but it would be quite heavy to put it all in a make file, with the risk 
> of forgetting something. I'm okay with the idea of the root being rebuilt 

There's no need to list all the files in the Makefile; you can use
$(wildcard ...) to generate the list dynamically. Although I haven't
tried to do this for a whole tree.

> from scratch, but how do you trigger that ? As you say, even deleting it 
> completely won't copy some of the skeleton back. What can we 'touch' to make 
> this happen ?

With external toolchain it seems to be safe to delete most (if not all)
of the project_build_xyz/abc/root directory. I don't have a good answer
to your question though. Personally I would like to have proper
dependencies so that I don't need to do an explicit re-copy operation.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
