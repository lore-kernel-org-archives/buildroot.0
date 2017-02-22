From: ren_guo <ren_guo@c-sky.com>
Date: Wed, 22 Feb 2017 10:16:36 +0800
Subject: [Buildroot] [PATCH 1/1] toolchain/helpers.mk: fixup
	check_gcc_version.
In-Reply-To: <87k28joaif.fsf@dell.be.48ers.dk>
References: <1487667876-27245-1-git-send-email-ren_guo@c-sky.com>
 <20170221102615.526d9bce@free-electrons.com>
 <b3b253af-7154-237b-704f-5544ed602fcb@c-sky.com>
 <87k28joaif.fsf@dell.be.48ers.dk>
Message-ID: <0b005880-a592-c35e-66d0-3b438f95cc18@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017?02?21? 22:59, Peter Korsgaard wrote:

>   > Thx Thomas,
>   > Cool Idea! but it need be retested.
>
>   > I couldn't find a proper way to avoid the spaces around the ".", and i
>   > think sed is ok :)
>
> Alternatively we could drop the . and use the shell or awk or whatever
> to convert from space separated to .-separated:
>
> echo "__GNUC__ __GNUC_MINOR__" | gcc -P -E - | \
>       { read MAJOR MINOR; echo $MAJOR.$MINOR ; }
>
> Not that this is so much prettier.
>
Thx Peter,

"bash read" seems not bad :) ... But I like 'sed' a little more?

Best Regards

guoren
