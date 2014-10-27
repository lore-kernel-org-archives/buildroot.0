From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 27 Oct 2014 07:59:33 -0300
Subject: [Buildroot] [PATCH] zlog: Add patch to remove -Werror
In-Reply-To: <20141027080209.7cbcf476@free-electrons.com>
References: <1414352079-17708-1-git-send-email-ezequiel@vanguardiasur.com.ar>	<20141026215222.1bf25872@free-electrons.com>	<544DB1AA.7070805@vanguardiasur.com.ar>
 <20141027080209.7cbcf476@free-electrons.com>
Message-ID: <544E2595.9000406@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/27/2014 04:02 AM, Thomas Petazzoni wrote:
> Dear Ezequiel Garcia,
> 
> On Sun, 26 Oct 2014 23:44:58 -0300, Ezequiel Garcia wrote:
> 
>> But which is the real problem: the BSD_SOURCE macro usage or the warning
>> in the toolchain?
> 
> The BSD_SOURCE macro usage.
> 
>> Other architectures are not producing any warning, so this sounds like
>> yet another issue with the toolchain.
> 
> That's because NIOS II is for now the only toolchain using glibc 2.20,
> which has deprecated certain macros. Packages should be converted, as
> such warnings will also appear with other toolchain as they start using
> glibc 2.20.
> 
> See commit 116733c6c211f49d7ba5fff5883f682eb72106a3 for instance.
> 

Great, thanks. I hadn't noticed you fixed a similar thing before.

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141027/a610790e/attachment.asc>
