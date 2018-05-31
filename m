From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 May 2018 11:16:08 +0200
Subject: [Buildroot] [PATCH 1/2] configs/stm32f429: force usage of
 BINUTILS 2.28.x
In-Reply-To: <cd9bc020-7228-60f5-187e-70c9c4274c37@st.com>
References: <1527595765-23055-1-git-send-email-christophe.priouzeau@st.com>
 <20180529233219.0eca0f54@windsurf.home>
 <98410cef-37c3-0450-9142-e1df5df34eaa@st.com>
 <20180530174257.616403f2@windsurf.home>
 <a478a326-805a-0b80-2df6-4779211fdfd9@mind.be>
 <20180530224134.0b87b6ad@windsurf.home>
 <cd9bc020-7228-60f5-187e-70c9c4274c37@st.com>
Message-ID: <20180531111608.2ebbd4a0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christophe,

It would be nice if you could avoid top-posting. It's the same best
practice on the Linux kernel mailing lists.

On Thu, 31 May 2018 08:34:08 +0000, Christophe PRIOUZEAU wrote:

>   I'm ok to provide the patches.

Great!

>   For the warning, can you point to me an example or a documentation
> to write a "conditional warning" on Kconfig.

comment "Linux kernel < v4.12 will not boot with the selected binutils version"
	depends on BR2_ARMV7M
	depends on !BR2_BINUTILS_2_28_X

or something like that (I haven't checked the exact option names, nor
the kernel version, nor anything else, it's just an example).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
