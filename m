From: Martin Bark <martin@barkynet.com>
Date: Fri, 10 Jan 2014 14:24:02 +0000
Subject: [Buildroot] [PATCH v2] ca-certificates: new package
In-Reply-To: <20140109235917.GH3713@free.fr>
References: <1389201330-2420-1-git-send-email-martin@barkynet.com>
 <20140109235917.GH3713@free.fr>
Message-ID: <52D00282.8040607@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

Thanks for the feedback.

On 09/01/14 23:59, Yann E. MORIN wrote:

[--SNIP--]

>> +    #generate symlinks to certificates under /etc/ssl/certs
>> +    ( \
>> +      cd $(TARGET_DIR) ;\
>> +      for i in `find usr/share/ca-certificates -name "*.crt"` ; do \
>> +            ln -sf ../../../$$i etc/ssl/certs/`basename $${i%.crt}.pem` ;\
>> +      done ;\
>> +    )
>
> As stated by Thomas, this is not very nice.
>
> However, you do not need to enclose the command in-between a ()-pair,
> since make will spawn a shell for each 'command', and thus the cd is in
> effect only in that shell. That is, the following line:
>
>> +    $(HOST_DIR)/usr/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
>
> Will be executed in another shell.
>
> Also, your use of basename is weird. I'd use this instead:
>      `basename $${i} .crt`.pem
>

I was using the bash ${var%Pattern} substitution but your solution is 
neater.  I'll make those changes now.

Thanks
