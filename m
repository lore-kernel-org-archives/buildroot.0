From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Jul 2016 15:13:06 +0200
Subject: [Buildroot] [PATCH 01/83 v2] boot/at91bootstrap: choices must
	have a type
In-Reply-To: <e37e8e59300b9a2c1a4b6179a000aa37df8c675f.1467624132.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 4 Jul 2016 11:24:12 +0200")
References: <cover.1467624132.git.yann.morin.1998@free.fr>
 <e37e8e59300b9a2c1a4b6179a000aa37df8c675f.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <87bn2dh7h9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 >  boot/at91bootstrap/Config.in | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/boot/at91bootstrap/Config.in b/boot/at91bootstrap/Config.in
 > index 57fdeda..d131a6a 100644
 > --- a/boot/at91bootstrap/Config.in
 > +++ b/boot/at91bootstrap/Config.in
 > @@ -26,7 +26,7 @@ config BR2_TARGET_AT91BOOTSTRAP_BOARD
 >  	  This is used to do a make <board>_config
 
 >  choice
 > -	prompt "Boot Memory"
 > +	bool "Boot Memory"

We use prompts in several other places in Buildroot:

git grep 'prompt "' **/Config.in | wc -l
89

And we have "always" done so without issues, so I don't think we need to
change this now.

-- 
Bye, Peter Korsgaard
