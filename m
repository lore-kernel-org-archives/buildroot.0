From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Date: Wed, 30 May 2018 15:24:19 +0000
Subject: [Buildroot] [PATCH 1/2] configs/stm32f429: force usage of
 BINUTILS 2.28.x
In-Reply-To: <20180529233219.0eca0f54@windsurf.home>
References: <1527595765-23055-1-git-send-email-christophe.priouzeau@st.com>
 <20180529233219.0eca0f54@windsurf.home>
Message-ID: <98410cef-37c3-0450-9142-e1df5df34eaa@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Tomas,
  I know that my patches are not a durable solution.
  My concern are to have a solution for stm32  and not keep
this state on which stm32 board doesn't boot.

  For the long term solution, I have seen a patch on the kernel
to correct the issue around 'adr pseudo instruction'.
Patch: https://patchwork.kernel.org/patch/10072631/
"arm: ensure symbol is a thumb symbol in new binutils".
This patch are not merged on the kernel, I have tested it on top
of kernel 4.11(buildroot config) and kernel 4.17-rc5, the patch
work correctly, we are able to perform a  complete boot.
I need to continue my test to see if this patch is sufficient.

Regards
Christophe Priouzeau



On 05/29/2018 11:32 PM, Thomas Petazzoni wrote:

Hello Christophe,

On Tue, 29 May 2018 12:09:27 +0000, Christophe PRIOUZEAU wrote:


Due to runtime issue with the usage of BINUTILS 2.29.x,
we need to use the version 2.28.x

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com><mailto:christophe.priouzeau@st.com>



I know those patches have been committed, but I'd like to say I'm not
totally happy with them: to me, they don't implement the right approach.

Your patches only fix specifically the STM32 defconfigs. Any other
Buildroot user doing Cortex-M4 stuff, for other platforms, will fall
into the same binutils issue.

So in fact the proposal that was made back in April at
http://lists.busybox.net/pipermail/buildroot/2018-April/219223.html was
in the end better.

I still don't like the fact that we are forced to use an old binutils
version, because we are ultimately going to drop support for binutils
2.28 in the future, and if the issue isn't fixed in newer binutils
versions, we are going to have a problem. But regardless of that,
fixing the defconfigs is really not the correct solution here I believe.

Best regards,

Thomas



--


Best regards / Cordialement,

[cid:part1.BC660A15.40BF3C41 at st.com]
Christophe Priouzeau | TINA: 166 7320 | Tel: +33 244027320

STMicroelectronics
ST oneline: www.st.com<http://www.st.com>







-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180530/359799d7/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: st_mail.png
Type: image/png
Size: 9916 bytes
Desc: st_mail.png
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180530/359799d7/attachment.png>
