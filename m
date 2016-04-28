From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Apr 2016 13:51:49 +0200
Subject: [Buildroot] [PATCHv2] package/cryptopp: Backport gcc
 compatibility patch
In-Reply-To: <1461571769-29772-1-git-send-email-julian@jusst.de>
References: <1461571769-29772-1-git-send-email-julian@jusst.de>
Message-ID: <20160428135149.79bf2358@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Apr 2016 10:09:29 +0200, Julian Scheel wrote:
> Import patch from cryptopp upstream which fixes the gcc version
> checks for using attribute deprecated with messages. Fixes build with
> host gcc versions < 4.5.
> 
> Signed-off-by: Julian Scheel <julian@jusst.de>

The patch on the cryptopp source didn't apply once applied from your
e-mail, since the DOS line endings had been turned into Unix line
endings. But the upstream source is really using DOS line endings.

So in the end, since the patch is easily available from Github, I've
simply used the <pkg>_PATCH variable to let Buildroot download and
apply the patch, rather than importing it in package/cryptopp/. And
then I've applied. See:

   https://git.buildroot.net/buildroot/commit/?id=b4ccab90608efca6a7c753a4980c546a61f715ad

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
