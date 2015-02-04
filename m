From: Floris Bos <bos@je-eigen-domein.nl>
Date: Wed, 04 Feb 2015 16:35:26 +0100
Subject: [Buildroot] [PATCH 1/1] dropbear: add extra build customization
 options
In-Reply-To: <20150203150437.7d27225c@free-electrons.com>
References: <1410450212-30718-1-git-send-email-bos@je-eigen-domein.nl>
 <20150203150437.7d27225c@free-electrons.com>
Message-ID: <54D23C3E.20300@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/03/2015 03:04 PM, Thomas Petazzoni wrote:
> Also, can you make this a bit smarter to avoid duplication. For example:
>
> DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert scp
>
> ifeq ($(BR2_PACKAGE_DROPBEAR_CLIENT),y)
> DROPBEAR_TARGET_BINS += ssh dbclient
> endif
>
> And then use:
>
> 	PROGRAMS="dropbear $(DROPBEAR_TARGET_BINS)"
>
> When doing the $(MAKE) call.

Just remembered what was up with that.

Dropbear's SSH client is called dbclient.
The extra "ssh" convenience symlink is something non-standard the 
buildroot package made up.
One cannot pass a $(DROPBEAR_TARGET_BINS) containing "ssh" to the 
$(MAKE) call, as upstream dropbear has no clue how to make "ssh"


Yours sincerely,

Floris Bos
