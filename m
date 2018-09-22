From: Ferdinand van Aartsen <ferdinand@ombud.nl>
Date: Sat, 22 Sep 2018 19:16:05 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: bump version to 1.29.3
In-Reply-To: <20180922184215.6ebaf7fa@windsurf>
References: <20180922140641.9937-1-ferdinand@ombud.nl>
 <20180922184215.6ebaf7fa@windsurf>
Message-ID: <2b8099d90190e1e37f412594ad2978cd@ombud.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni schreef op 2018-09-22 18:42:
> Hello,
> 
> On Sat, 22 Sep 2018 16:06:41 +0200, Ferdinand van Aartsen wrote:
>> Remove 0003-Revert-libbb-remove-unnecessary-variable-in-xmalloc_.patch
>> It caused a segfault which was fixed in this release.
> 
> This doesn't make sense: the *only* commit between 1.29.2 and 1.29.3 is
> exactly the patch we have in Buildroot for Busybox 1.29.2. So
> basically, before and after your commit, the Busybox source code is
> exactly the same.
> 
> See:
> 
> $ git slog 1_29_2..1_29_3 | cat
> b84194b133212aca64605d1cd0cf771720bc0d94 Bump version to 1.29.3
> 2993551efcb09ace35b40db608ab08159834692b Revert "libbb: remove
> unnecessary variable in xmalloc_fgets"
> 
> Could you clarify which problem you have encountered ?
> 
> Best regards,
> 
> Thomas

Note that the commit you linked is _not_ identical to that patch.
The patch has "int i" the commit has "size_t i". You can see the
update to the patch in the busybox master commit:
22a99516206b33b7ae124d426319bab03d5c8309

I've tested and the change from int to size_t fixed a segfault.

Ferdinand
