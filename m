From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 23:00:23 +0200
Subject: [Buildroot] [PATCH v7] Add defconfig for MIPS Creator ci40
In-Reply-To: <CA+V_ovshFwELPeY71fHV5aiqD=X02GG682TMnD79UcCtAQYV-g@mail.gmail.com>
References: <1491378735-6506-1-git-send-email-abhimanyu.v@gmail.com>
 <d89680b5-ad66-0fcc-a0ae-47132b0ad8c4@mind.be>
 <CA+V_ovshFwELPeY71fHV5aiqD=X02GG682TMnD79UcCtAQYV-g@mail.gmail.com>
Message-ID: <5ad83116-cb48-c00b-1d74-609b9617d604@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 [Grmbl, I hate it how GMail screws up quoting. Anybody got good contact with
Google?]

On 10-04-17 21:22, abhimanyu.v at gmail.com wrote:
> Thankyou Arnout!
> 
> On Mon, Apr 10, 2017 at 8:58 PM, Arnout Vandecappelle <arnout@mind.be
> <mailto:arnout@mind.be>> wrote:
> 
> 
> 
>     On 05-04-17 09:52, Abhimanyu Vishwakarma wrote:
[snip]
>     > +support/scripts/genimage.sh -c "${BOARD_DIR}/genimage.cfg"
> 
>      The idea is to remove this script entirely and instead set
>     BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>     BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ci40/genimage.cfg"
> 
> I remember i did try this (tried now too)  but it doesnt work, i end up with
> following error:
> BUILD_DIR=/home/abhi/code/buildroot/output/build support/scripts/genimage.sh
> /home/abhi/code/buildroot/output/images -c board/ci40/genimage.cfg
>>>>   Executing post-image script support/scripts/genimage.sh
> Error: Missing argument
> 
> This is due to mix of positional and optional argument. Anything wrong with
> config or it is issue with genimage.sh script. 

 It's the genimage.sh script that's not right. It doesn't support BINARIES_DIR
as the first argument, which means it can't be used directly as a post-image script.

 Etienne, any chance of fixing that?

 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
