From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 May 2018 14:15:35 +0200
Subject: [Buildroot] BUG: BR-2018.05-rc1 cannot build dahdi-linux 2.11.1
In-Reply-To: <1933348917.58346.1526039534346.JavaMail.zimbra@datacom.com.br>
References: <1526036020.685182559@f413.i.mail.ru>
 <1933348917.58346.1526039534346.JavaMail.zimbra@datacom.com.br>
Message-ID: <20180511141535.15baf45b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 May 2018 08:52:14 -0300 (BRT), Carlos Santos wrote:

> [CC Yann]
> 
> The dahdi-linux recipe is boken since commit 514291f39ef06, AFAICT.
> Notice that it attempts to copy from $(BR2_DL_DIR)/$(f) while it
> should copy from $(BR2_DL_DIR)/dahdi-linux/$(f).

It should use $(DADHI_LINUX_DL_DIR) instead of $(BR2_DL_DIR). It was
apparently missed in the conversion to use <pkg>_DL_DIR, as a
preparation to the download infra rework.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
