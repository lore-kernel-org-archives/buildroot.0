From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 17:11:05 +0100
Subject: [Buildroot] [PATCHv3] package/uboot: detect missing
 user-supplied environment source files
In-Reply-To: <20171209113549.1510-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sat, 9 Dec 2017 12:35:49 +0100")
References: <20171209113549.1510-1-yann.morin.1998@free.fr>
Message-ID: <87wp18p2w6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Since 0542bb79e8 (uboot: Support multiple environment source files),
 > missing user-supplied environment source files is no longer detected.

 > This is because we cat them all, and feed the concatenation to the stdin
 > of mkenvimage. So, if one source file is missing, the cat exits in error,
 > but the compound command exits with the exit code of the last command,
 > which is that of mkenvimage, which happens to be happy with whatever it
 > is fed on its stdin, even is empty.

 > We fix that by creating a temporary file, that we even leave afterward
 > for the user to inspect.

 > We also move it out of the _CMDS block and into a macro of its own, so
 > that it is easier to write and maintain.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Cam Hutchison <camh@xdna.net>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 > ---
 > Changes v2 -> v3:
 >   - generate inter;ediate file in $(@D) to avoid conflicts with
 >     user-generated files in $(O)/images/  (Cam)
 >   - typo

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
