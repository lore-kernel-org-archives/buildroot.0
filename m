From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 May 2018 23:32:19 +0200
Subject: [Buildroot] [PATCH 1/2] configs/stm32f429: force usage of
 BINUTILS 2.28.x
In-Reply-To: <1527595765-23055-1-git-send-email-christophe.priouzeau@st.com>
References: <1527595765-23055-1-git-send-email-christophe.priouzeau@st.com>
Message-ID: <20180529233219.0eca0f54@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christophe,

On Tue, 29 May 2018 12:09:27 +0000, Christophe PRIOUZEAU wrote:
> Due to runtime issue with the usage of BINUTILS 2.29.x,
> we need to use the version 2.28.x
> 
> Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>

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
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
