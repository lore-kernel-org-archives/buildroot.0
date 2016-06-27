From: Davit Mirzoyan <davit.mirzoyan@eu.omron.com>
Date: Mon, 27 Jun 2016 14:52:55 +0200
Subject: [Buildroot] Help in enabling large file support
In-Reply-To: <20160627123212.GS2319@tarshish>
References: <OFEC3F3C04.179E3A42-ONC1257FDF.00434B2F-C1257FDF.00437E69@eu.omron.com>
 <20160627123212.GS2319@tarshish>
Message-ID: <OF4EEEEFB0.32E05D87-ONC1257FDF.004683FE-C1257FDF.0046C4AF@eu.omron.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Thank you for your reply. I see. Is it normal then that I do not find "
BR2_LARGEFILE " variable defined anywhere. 

I am adding a package that requires largefile support and I add a line in 
the config file of the package as shown below


comment "partclone requires a toolchain with LARGEFILE+WCHAR support"


        depends on !(BR2_LARGEFILE && BR2_USE_WCHAR) 

Shall I just remove the BR2_LARGEFILE variable?

Kind Regards, 
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
Davit Mirzoyan, 
R&D Engineer, 
Omron Europe B.V., Industrial Automation, 
Zilverenberg 2, 5234 GM ?s-Hertogenbosch, 
The Netherlands 




From:   Baruch Siach <baruch@tkos.co.il>
To:     Davit Mirzoyan <davit.mirzoyan@eu.omron.com>, 
Cc:     buildroot at busybox.net
Date:   27-06-2016 14:32
Subject:        Re: [Buildroot] Help in enabling large file support



Hi Davit,

On Mon, Jun 27, 2016 at 02:17:10PM +0200, Davit Mirzoyan wrote:
> Could you please help me enable large file support in buildroot?

Buildroot removed support for non-largefile toolchain build since version 
2015.05. There is no need to explicitly enable largefile now, it's always 
enabled.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open 
Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160627/35e8ceae/attachment.html>
