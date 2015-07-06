From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 6 Jul 2015 16:19:27 -0400
Subject: [Buildroot] [PATCH 1/1] pkg-autotools: fix patching libtool for
	version 2.4
In-Reply-To: <87egklp8jc.fsf@dell.be.48ers.dk>
References: <1436129628-3636-1-git-send-email-danomimanchego123@gmail.com>
 <87egklp8jc.fsf@dell.be.48ers.dk>
Message-ID: <CANxTyt54RMbDNfxKG1VrAseed5tznAo+UAsy=8Nn+hPE4+RQ-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

> Thanks for the detailed description!

Your welcome!

Actually, I think I've found another problem with those sed lines.
The first sed for ltmain_version attempts to match whitespace before
VERSION (is there ever any?) with [ space_character tab_character ],
times two.  But it looks like the sed line use to make
ltmain_patchlevel has only space characters.  I imagine that
somebody's smart editor automatically converted the tab to 4 spaces on
a paste op.

I'm thinking that the fix is to use "[ \t]" (space followed by escaped
't', to match space characters or tab characters), or one of the POSIX
character classes, '[[:blank:]]' or maybe '[[:space:]]'.  Any
preferences?

I could probably spin a follow-on patch when I get home tonight, if
nobody does it first.

Danomi -
