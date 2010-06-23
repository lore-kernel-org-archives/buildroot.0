From: William Wagner <will_wagner@carallon.com>
Date: Wed, 23 Jun 2010 10:47:13 +0100
Subject: [Buildroot] On strip and debugging symbols
In-Reply-To: <20100623104613.78fe0d97@surf>
References: <0D753D10438DA54287A00B027084269763715D5D31@AUSP01VMBX24.collaborationhost.net>	<87hbkv6sej.fsf@macbook.be.48ers.dk>	<0D753D10438DA54287A00B027084269763715D651B@AUSP01VMBX24.collaborationhost.net>	<87d3vi7qqq.fsf@macbook.be.48ers.dk>
	<20100623091224.266d1030@surf>	<874ogu6vsv.fsf@macbook.be.48ers.dk>
	<20100623104613.78fe0d97@surf>
Message-ID: <4C21D821.10000@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  On 23/06/2010 09:46, Thomas Petazzoni wrote:
>
> As mentionned before, adding $(STAGING_DIR)/usr/bin to the path is just
> wrong. The possible solutions to this are :
>
>   * Install the toolchain outside of $(STAGING_DIR) and then re-use what
>     we do for external toolchains, and then tell people to not add
>     $(STAGING_DIR)/usr/bin to their PATH, but rather the location where
>     the toolchain was installed. This has the added benefit that
>     $(STAGING_DIR) would not contain binaries compiled for the host,
>     mixed with binaries compiled for the target.
>
>
I think that long term making sure that target and host binaries do not 
end up in the same folder is a good idea. Creating a new folder for host 
tools and putting toolchain in there seems like quite a clear way of 
doing things, but would obviously cause a lot of disruption as people 
learnt the new way of doing things.

Will
