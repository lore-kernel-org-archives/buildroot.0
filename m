From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Apr 2021 13:09:33 +0200
Subject: [Buildroot] [PATCH 1/4] boot/shim: fix build issue due to
 gnu-efi
In-Reply-To: <20210405202155.1422470-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 5 Apr 2021 22:21:52 +0200")
References: <20210405202155.1422470-1-thomas.petazzoni@bootlin.com>
 <20210405202155.1422470-2-thomas.petazzoni@bootlin.com>
Message-ID: <87r1jnfz4i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > shim fails to build with:
 > console.c:448:5: error: ?EFI_WARN_UNKOWN_GLYPH? undeclared here (not
 > in a function); did you mean ?EFI_WARN_UNKNOWN_GLYPH??
 >   448 |  {  EFI_WARN_UNKOWN_GLYPH,      L"Warning Unknown Glyph"},
 >       |     ^~~~~~~~~~~~~~~~~~~~~
 >       |     EFI_WARN_UNKNOWN_GLYPH
 > make[2]: *** [<builtin>: console.o] Error 1
 > make[2]: *** Waiting for unfinished jobs....

 > Backport upstream commit d230d02f990f02293736dca78b108f86c86d1bd0 to
 > resolve this issue.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
