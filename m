From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 24 Jun 2013 09:49:21 +0200
Subject: [Buildroot] [PATCH 1/6] tcl: change BR2_PACKAGE_TCL_SHLIB_ONLY
	option
In-Reply-To: <51C56B4C.1070908@fh-kl.de>
References: <1371743610-17810-1-git-send-email-richard.genoud@gmail.com>
 <51c43f9c.ebbbb40a.0abf.ffffba07@mx.google.com> <51C56B4C.1070908@fh-kl.de>
Message-ID: <CACQ1gAiQo31ayhuMfPfSc0bnYw68fCX4YHeA4u-Ekksso4NNyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/6/22 Patrick Ziegler <patrick.ziegler@fh-kl.de>:
> Dear Richard Genoud,
>
> Am 21.06.2013 13:56, schrieb richard.genoud at gmail.com:
>> From: Richard Genoud <richard.genoud@gmail.com>
>>
>> It's not convenient to have an option (defaulted to yes) that removes a
>> software.
>> For instance, usb_modeswitching_data needs the tclsh interpreter, so it
>> would have to un-select this option, but select TCL.
>>
>> Having an option that adds the tclsh binary (defaulted to no to keep the
>> same behaviour) is way more convenient.
>> Moreover, it seems that it was intended liked that at the begining
>> because usb_modeswitching_data already selects BR2_PACKAGE_TCL_TCLSH
>> which wasn't declared anywhere.
>>
>> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
>
> If you change an existing option, please have a look on the
> Config.in.legacy file. You should add the old option to that file, so
> the user gets informed about the change.
>
> Finally you should check if another package uses this option for its own
> configuration and change this to the new option.
> BR2_PACKAGE_TCL_SHLIB_ONLY is used by usb_modeswitch (not
> usb_modeswitch_data anymore) to switch between the binary wrapper and
> the tcl wrapper script.
>
I didn't saw your patch on that !
It seems that you already correct the problem with the tclsh interpreter.
So I can drop this patch.

Thanks !

Best regards,
Richard.
