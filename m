From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 Mar 2012 00:01:46 +0100
Subject: [Buildroot] [PATCHv2] ext-toolchain: Automatically set -m64 if
	the architecture is x86_64
In-Reply-To: <1331677800-3777-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Tue, 13 Mar 2012 23:30:00 +0100")
References: <1331677800-3777-1-git-send-email-arnout@mind.be>
Message-ID: <871uoukcrp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> Without the -m64, choosing the x86_64 architecture with a Sourcery external
 Arnout> toolchain will result in a 32-bit rootfs.

 Arnout> Also simplified the help text to reflect this change.

 Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Arnout> ---
 Arnout> v2: Feedback from Thomas
 Arnout> * Less aggressive modification of the help text.
 Arnout> * Make -m64 flag specific for x86_64.

 Arnout> Build-tested only.
 Arnout>  toolchain/toolchain-external/Config.in             |   35 +++++++++++---------
 Arnout>  toolchain/toolchain-external/ext-tool.mk           |    4 ++
 Arnout>  .../toolchain-external/ext-toolchain-wrapper.c     |    3 ++
 Arnout>  3 files changed, 26 insertions(+), 16 deletions(-)

 Arnout> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
 Arnout> index 7f57952..8c20661 100644
 Arnout> --- a/toolchain/toolchain-external/Config.in
 Arnout> +++ b/toolchain/toolchain-external/Config.in
 Arnout> @@ -371,14 +371,16 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
 Arnout>  	  binutils 2.21.53, glibc 2.13, gdb 7.2.50 and kernel headers
 Arnout>  	  3.0.1. It has support for the following variants:
 Arnout>  	    - Intel Pentium 4, glibc, 32 bits
 Arnout> -              Default, nothing special to do.
 Arnout> -            - Intel Atom, glibc, 32 bits
 Arnout> -              Select an Atom core
 Arnout> -            - Intel Xeon, glibc, 64 bits
 Arnout> -              Set BR2_TARGET_OPTIMIZATION to -m64
 Arnout> -            - Intel Core 2, glibc, 64 bits
 Arnout> -              Select a Core 2 core
 Arnout> -              Set BR2_TARGET_OPTIMIZATION to -m64
 Arnout> +	      Default for x86, nothing special to do.
 Arnout> +	    - Intel Atom, glibc, 32 bits
 Arnout> +	      Select an Atom core
 Arnout> +	    - Intel Xeon, glibc, 64 bits
 Arnout> +	      Default for x86_64, nothing special to do.
 Arnout> +	    - Intel Core 2, glibc, 64 bits
 Arnout> +	      Select a Core 2 core
 Arnout> +	  Other architecture variants (beyond Pentium-4/Xeon) are
 Arnout> +	  supported as well, but glibc is not optimised for it.
 Arnout> +            

You have some whitespace damage here, but otherwise it looks good -
Committed, thanks.

-- 
Bye, Peter Korsgaard
