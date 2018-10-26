From: Alexander Dahl <post@lespocky.de>
Date: Fri, 26 Oct 2018 12:08:43 +0200
Subject: [Buildroot] [PATCH] configs/{at91sam9*,
 atmel*}: drop OpenSSH as it duplicates Dropbear
In-Reply-To: <9b5b2780-92cf-682a-7ada-f6af691652ad@microchip.com>
References: <20181026094024.31108-1-thomas.petazzoni@bootlin.com>
 <9b5b2780-92cf-682a-7ada-f6af691652ad@microchip.com>
Message-ID: <20181026100842.xrkc2wqhi6te72er@falbala.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei,

On Fri, Oct 26, 2018 at 09:48:44AM +0000, Nicolas.Ferre at microchip.com wrote:
> On 26/10/2018 at 11:40, Thomas Petazzoni wrote:
> > The "development" defconfigs for Atmel platforms enable both OpenSSH
> > and Dropbear, which doesn't make a lot of sense, as only one SSH
> > server can start on port 22.
> > 
> > This commit therefore drops BR2_PACKAGE_OPENSSH=y from those
> > defconfigs, keeping Dropbear as an SSH server/client.
> 
> A gut feeling is telling me that I would have preferred the other way 
> around: Keeping OpenSSH.

I would have opted for Dropbear, too. Especially because old at91
based boards usually don't come with a lot of memory (both RAM and
Flash).

> Is scp provided by Dropbear?

Yes it is. sftp is tricky, however.

Greets
Alex

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181026/ce44e26a/attachment.asc>
