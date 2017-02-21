From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Feb 2017 15:59:20 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain/helpers.mk: fixup
	check_gcc_version.
In-Reply-To: <b3b253af-7154-237b-704f-5544ed602fcb@c-sky.com> (ren guo's
 message of "Tue, 21 Feb 2017 22:15:49 +0800")
References: <1487667876-27245-1-git-send-email-ren_guo@c-sky.com>
 <20170221102615.526d9bce@free-electrons.com>
 <b3b253af-7154-237b-704f-5544ed602fcb@c-sky.com>
Message-ID: <87k28joaif.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ren" == ren guo <ren_guo@c-sky.com> writes:

 > Thx Thomas,
 > Cool Idea! but it need be retested.

 > I couldn't find a proper way to avoid the spaces around the ".", and i
 > think sed is ok :)

Alternatively we could drop the . and use the shell or awk or whatever
to convert from space separated to .-separated:

echo "__GNUC__ __GNUC_MINOR__" | gcc -P -E - | \
     { read MAJOR MINOR; echo $MAJOR.$MINOR ; }

Not that this is so much prettier.

-- 
Bye, Peter Korsgaard
