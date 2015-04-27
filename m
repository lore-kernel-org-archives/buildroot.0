From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Mon, 27 Apr 2015 13:01:43 -0700
Subject: [Buildroot] [PATCH] imx-usb-loader: new host package
In-Reply-To: <6061599.b1S2CSsYX5@sagittea>
References: <1430142459-9448-1-git-send-email-antoine.tenart@free-electrons.com>
 <6061599.b1S2CSsYX5@sagittea>
Message-ID: <553E95A7.6000704@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?r?me,

On 04/27/2015 10:56 AM, J?r?me Pouiller wrote:
> Hello Antoine,
> 
> On Monday 27 April 2015 15:47:39 Antoine Tenart wrote:
>> This host package allows to build tools to download and execute code on
>> Freescale i.MX5/i.MX6 and Vybrid SoCs through the Serial Download
>> Protocol.
>>
>> The work behind this commit was funded by ECA Group
>> <http://www.ecagroup.com>. ECA Group is the copyright owner of the
>> contributed code.
>>
>> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
>> ---
>>  package/Config.in.host                   |  1 +
>>  package/imx-usb-loader/Config.in.host    | 10 ++++++++++
>>  package/imx-usb-loader/imx-usb-loader.mk | 22 ++++++++++++++++++++++
>>  3 files changed, 33 insertions(+)
>>  create mode 100644 package/imx-usb-loader/Config.in.host
>>  create mode 100644 package/imx-usb-loader/imx-usb-loader.mk
> [...]
>> +define HOST_IMX_USB_LOADER_INSTALL_CMDS
>> +	$(MAKE) -C $(@D)	\
>> +		DESTDIR=$(HOST_DIR) install
>> +endef
> hmm... configuration files are installed in $(HOST_DIR)/usr/etc, 
> $(HOST_DIR)/etc would be better.
> 
> More annoying, it seems installed binaries look for configuration files in 
> /etc instead of $(HOST_DIR)/etc.
> 

This can be over-ridden by setting sysconfdir=$(HOST_DIR)/etc/
	https://github.com/boundarydevices/imx_usb_loader/blob/master/Makefile#L6

Regards,


Eric
