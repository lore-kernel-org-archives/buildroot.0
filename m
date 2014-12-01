From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Dec 2014 23:29:44 +0100
Subject: [Buildroot] [PATCHv3 39/74] coreutils: add error handling to
	for loop
In-Reply-To: <1417357142-14307-40-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Nov 2014 15:18:27 +0100")
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-40-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87r3wj80mf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  package/coreutils/coreutils.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
 > index 391d2cd..fa2db04 100644
 > --- a/package/coreutils/coreutils.mk
 > +++ b/package/coreutils/coreutils.mk
 > @@ -101,7 +101,7 @@ endif
 >  define COREUTILS_POST_INSTALL
 >  	# some things go in root rather than usr
 >  	for f in $(COREUTILS_BIN_PROGS); do \
 > -		mv $(TARGET_DIR)/usr/bin/$$f $(TARGET_DIR)/bin/$$f; \
 > +		mv $(TARGET_DIR)/usr/bin/$$f $(TARGET_DIR)/bin/$$f || exit 1; \

This no longer cleanly applied after the -f option was added on the
18th. I've fixed that up and committed, thanks.

-- 
Bye, Peter Korsgaard
