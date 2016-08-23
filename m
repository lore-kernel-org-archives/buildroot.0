From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 21:52:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: switch from libmysqlclient
 to mysqlnd
In-Reply-To: <1471971288-4564-1-git-send-email-bos@je-eigen-domein.nl>
References: <1471971288-4564-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20160823215210.584482c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Aug 2016 18:54:48 +0200, Floris Bos wrote:
> The Mysql Native Driver has been the default mysql driver since
> PHP 5.4, but buildroot was still using libmysqlclient.
> 
> Mysqlnd has several advantages such as improved memory management
> and the more favorable PHP licensing terms.
> (can combine it with proprietary PHP extensions like Ioncube
> loader, while libmysqlclient requires commercial licensing if you
> link to it and do not fall under their GPL/FOSS license exception)
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

I see that you are changing the *existing* options to use the native
driver rather than the libmysqlclient based one.

Would there be any reason for someone to prefer the libmysqlclient
based one over the native driver?

I'm simply wondering if we should change the semantic of the existing
options, or add new ones for the native driver. I very much prefer
*less* options, so if the native driver is fine and a drop-in
replacement for the libmysqlclient based one, I'm all for your patch,
just wanted to confirm.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
