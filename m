From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Dec 2017 08:15:15 +0100
Subject: [Buildroot] [PATCH 1/1] boot/uboot: add config option for uboot
 environment padding byte
In-Reply-To: <CAMbDF3KT17vM0c4s_bAh2i=+5trPtgkdMbjgA6K8-w1o1-CbXg@mail.gmail.com>
References: <1512925159-518-1-git-send-email-johannes.schmitz1@gmail.com>
 <20171211071826.6c12062b@windsurf.png.is.keysight.com>
 <CAMbDF3KT17vM0c4s_bAh2i=+5trPtgkdMbjgA6K8-w1o1-CbXg@mail.gmail.com>
Message-ID: <20171211081515.191bb6b0@windsurf.png.is.keysight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 11 Dec 2017 07:48:06 +0100, Johannes Schmitz wrote:

> this is a good question. So far I just know that reading the environment
> only worked for me with a 0x00 padding. Just to be sure it was not a
> combined problem of size and padding I can try again with the mkenvimage
> default of 0xFF and the correct size.

Yes, it would be good to investigate some more. The fact that the CRC
was not matching the original environment CRC is fine, because the
padding was different. So the padding being different cannot on its own
explain why it was not working for you.

> In any case the padding option should be added to expose the full
> mkenvimage capabilities, however if you're right I might have to edit the
> help text again and remove the statement about the CRC calculation.

Yes, that's my thought: the help text you're proposing is potentially
wrong.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
