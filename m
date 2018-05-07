From: Daniel Palmer <daniel@0x0f.com>
Date: Mon, 7 May 2018 17:30:52 +0900
Subject: [Buildroot] Automatic module loading with mdev is broken?
In-Reply-To: <87sh74nevl.fsf@dell.be.48ers.dk>
References: <CAFr9PX=M4VCMcakZsENMXBW8Xi3BcKkrVCTdARu=nCvK-A5ovg@mail.gmail.com>
 <87sh74nevl.fsf@dell.be.48ers.dk>
Message-ID: <CAFr9PX=ddYhUua7VTCDTBBsPWDzmV-F3xWy2VcxKf_ko7cdQSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Your change works but looking at the text of the original change that
caused the regression 'First alias in question is "platform:Fixed MDIO
bus".' it seems it would fail with that? The driver that creates that
alias still exists ->
https://github.com/torvalds/linux/blob/master/drivers/net/phy/fixed_phy.c#L261

Cheers,

Daniel
